class PostsController < ApplicationController
  before_action :get_gallery
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = @gallery.posts
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    if current_user == @gallery.user
      @post = @gallery.posts.build
    else
      redirect_to root_path, warning: "You cannot post here"
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = @gallery.posts.build(post_params)
    if current_user == @gallery.user
      respond_to do |format|
        if @post.save
          format.html { redirect_to gallery_post_path(@gallery, @post), notice: "Post was successfully created." }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      @opost,destroy
      redirect_to root_path, warning: "You cannot post here"
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if current_user == @gallery.user
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to gallery_post_path(@gallery), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to root_path, warning: "You cannot update this"

  end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if current_user == @gallery.user
      @post.destroy
      respond_to do |format|
        format.html { redirect_to gallery_posts_path(@gallery), notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end
    else 
      redirect_to root_path, warning: "You cannot delete this post"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = @gallery.posts.find(params[:id])
    end

    def get_gallery
      @gallery = Gallery.find(params[:gallery_id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :gallery_id, :image)
    end
end
