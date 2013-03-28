# -*- encoding : utf-8 -*-
class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where("receiver_id = ? OR sender_id = ?", current_user, current_user)
    @users = User.find_all_by_class_room_id_and_user_type_id(current_user.class_room, 1)

    self.new
  end

  def by_class_room
    @posts = Post.order("created_at desc").find_all_by_class_room_id(current_user.class_room)
    self.new
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end


  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.sender = current_user

    respond_to do |format|
      if @post.save
        if @post.class_room == nil
          PostMailer.post_created(@post.receiver, @post).deliver
          format.html { redirect_to :posts}
        else
          format.html { redirect_to :posts_by_class_room}
        end
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, :notice => 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
