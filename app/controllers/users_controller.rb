class UsersController < ApplicationController

  skip_before_filter :require_login, :only => [ :new, :create]
  
  # GET /users
  # GET /users.json
  def index
    # 1 is for UserType : 'Professeur'
    @users = User.find_all_by_class_room_id_and_user_type_id(current_user.class_room, 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @last_private_post = Post.find_by_receiver_id(current_user)
    @last_post = Post.find_by_class_room_id(current_user.class_room);

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def edit_avatar
    @user = current_user
  end

  def update_avatar
    @user = current_user
    @user.avatar = params[:avatar]

    respond_to do |format|
      if @user.update_attributes(params[:avatar])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def add_teacher
    @teacher = User.new;

    respond_to do |format|
      format.html 
      format.json { render :json => @teacher }
    end
  end


  def classmates 
    @classroom = User.find(current_user.id).class_room
    @classmates = User.order('class_room_id DESC').find_all_by_class_room_id_and_user_type_id(@classroom.id, 1)

    respond_to do |format|
      format.html 
      format.json { render :json => @classmates }
      format.xml { render :xml => @classmates }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @userTypes = UserType.all
    @classRooms = ClassRoom.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @classRooms = ClassRoom.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.avatar = params[:avatar]

    respond_to do |format|
      if @user.save
        format.html { redirect_to :root, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { redirect_to :root, :notice => "L'utilisateur n'a pas été créé!"  }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @classRooms = ClassRoom.all

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
