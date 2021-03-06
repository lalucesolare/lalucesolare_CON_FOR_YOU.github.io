class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:home]
  # before_action :check_user, only: [:edit, :destroy]
  
  def comment_photo_edit
    @photo = Photo.find(params[:x_id])
    @comment = Photo.find(params[:x_id]).comment_photos.find(params[:c_id])
  
    # if @comment.user != current_user
    #   redirect_to '/photos'
    # end
  end
  
  def comment_photo_update
   comment = Photo.find(params[:x_id]).comment_photos.find(params[:c_id])
   comment.content = params[:c_content]
   comment.save
    
   redirect_to '/photos'
  end
  
  def comment_create
    comment = Photo.find(params[:x_id]).comment_photos.create(content: params[:content])
    comment.user = current_user
    comment.save
    
    redirect_to '/photos'
  end
  
  def comment_destroy
    comment = Photo.find(params[:x_id]).comment_photos.find(params[:c_id])
    # if comment.user != current_user
    #   redirect_to '/photos' 
    # else
      comment.destroy
      redirect_to '/photos'
    # end 
  end

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.page(params[:page]).per(5).order(created_at: :desc)
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    
    file = params[:image]
    
  uploader = AvatarUploader.new
    
  uploader.store!(file)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image, :content)
    end
    
    def check_user
      if @photo.user != current_user
        redirect_to '/photos' 
      end
    end
end
