class FoldersController < ApplicationController
  # GET /folders
  # GET /folders.json
  def index

    @users_id = User.find_all_by_class_room_id current_user.class_room.id
    @folders = Folder.where(:user_id => @users_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @folders }
    end
  end



  # GET /folders/1
  # GET /folders/1.json
  def show
    @folder = Folder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @folder }
    end
  end

  # GET /folders/new
  # GET /folders/new.json
  def new
    @folder = Folder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @folder }
    end
  end

  # GET /folders/1/edit
  def edit
    @folder = Folder.find(params[:id])
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = Folder.new(params[:folder])
    @folder.user = current_user
    @folder.path = params[:path];

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @folder, :notice => 'Le dossier a bien été mis à jour.' }
        format.json { render :json => @folder, :status => :created, :location => @folder }
      else
        format.html { render :action => "new" }
        format.json { render :json => @folder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /folders/1
  # PUT /folders/1.json
  def update
    @folder = Folder.find(params[:id])
    @folder.path = params[:path];

    respond_to do |format|
      if @folder.update_attributes(params[:folder])
        format.html { redirect_to @folder, :notice => 'Folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @folder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to folders_url }
      format.json { head :no_content }
    end
  end
end
