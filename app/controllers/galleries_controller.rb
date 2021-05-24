class GalleriesController < ApplicationController
  before_action :get_user
  before_action :set_gallery, only: %i[ show edit update destroy ]

  # GET /galleries or /galleries.json
  def index
    if user_signed_in?
      # @galleries = Gallery.where(user: current_user.id)
      @galleries = @user.galleries
    end
  end

  # GET /galleries/1 or /galleries/1.json
  def show
  end

  # GET /galleries/new
  def new
    # @gallery = Gallery.new
    @gallery = @user.galleries.build
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries or /galleries.json
  def create
    # @gallery = Gallery.new(gallery_params)
    @gallery = @user.galleries.build(gallery_params)
    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: "Gallery was successfully created." }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1 or /galleries/1.json
  def update
      respond_to do |format|
        if @gallery.update(gallery_params)
          format.html { redirect_to user_gallery_path(@user), notice: "Gallery was successfully updated." }
          format.json { render :show, status: :ok, location: @gallery }
        else
         format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @gallery.errors, status: :unprocessable_entity }
        end
    end
  end

  # DELETE /galleries/1 or /galleries/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to user_gallery_path(@user), notice: "Gallery was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a list of trusted parameters through.
    def gallery_params
      params.require(:gallery).permit(:title)
    end

    def get_user
      @user = current_user
    end

    def set_gallery
      if user_signed_in?
        @gallery = @user.galleries.find(params[:id])
      else
         @gallery = Gallery.find(params[:id])
      end
    end

end
