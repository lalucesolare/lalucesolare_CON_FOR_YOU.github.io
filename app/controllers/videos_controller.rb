class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:home]
  # before_action :check_user, only: [:edit, :destroy]
  
  def comment_video_edit
    @video = Video.find(params[:x_id])
    @comment = Video.find(params[:x_id]).comment_videos.find(params[:c_id])
    
    # if @comment.user != current_user
    #   redirect_to '/videos'
    # end
  end
  
  def comment_video_update
   comment = Video.find(params[:x_id]).comment_videos.find(params[:c_id])
   comment.content = params[:c_content]
   comment.save
    
   redirect_to '/videos'
  end
  
  def comment_create
    comment = Video.find(params[:x_id]).comment_videos.create(content: params[:content])
    comment.user = current_user
    comment.save
    
    redirect_to '/videos'
  end
  
  def comment_destroy
    comment = Video.find(params[:x_id]).comment_videos.find(params[:c_id])
    # if comment.user != current_user
    #   redirect_to '/videos' 
    # else
      comment.destroy
      redirect_to '/videos'
    # end 
  end

  # GET /videos
  # GET /videos.json
  def index
    # @videos = Video.all
    @videos = Video.page(params[:page]).per(5).order(created_at: :desc)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.user = current_user
    
    file = params[:image]
    
  uploader = AvatarUploader.new
      
  uploader.store!(file)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :image, :content)
    end
    
    def check_user
      if @video.user != current_user
        redirect_to '/videos' 
      end
    end
end
