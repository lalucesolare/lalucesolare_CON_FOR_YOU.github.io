class BuskingsController < ApplicationController
  before_action :set_busking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:home]
  # before_action :check_user, only: [:edit, :destroy]
  
  def comment_busking_edit
    @busking = Busking.find(params[:x_id])
    @comment = Busking.find(params[:x_id]).comment_buskings.find(params[:c_id])
    
    # if @comment.user != current_user
    #   redirect_to '/buskings'
    # end
  end
  
  def comment_busking_update
   comment = Busking.find(params[:x_id]).comment_buskings.find(params[:c_id])
   comment.content = params[:c_content]
   comment.save
    
   redirect_to '/buskings'
  end
  
  def comment_create
    comment = Busking.find(params[:x_id]).comment_buskings.create(content: params[:content])
    comment.user = current_user
    comment.save
    
    redirect_to '/buskings'
  end
  
  def comment_destroy
    comment = Busking.find(params[:x_id]).comment_buskings.find(params[:c_id])
    # if comment.user != current_user
    #   redirect_to '/buskings' 
    # else
      comment.destroy
      redirect_to '/buskings'
    # end 
  end

  # GET /buskings
  # GET /buskings.json
  def index
    # @buskings = Busking.all
    @buskings = Busking.page(params[:page]).per(5).order(created_at: :desc)
  end

  # GET /buskings/1
  # GET /buskings/1.json
  def show
  end

  # GET /buskings/new
  def new
    @busking = Busking.new
  end

  # GET /buskings/1/edit
  def edit
  end

  # POST /buskings
  # POST /buskings.json
  def create
    @busking = Busking.new(busking_params)
    @busking.user = current_user
    
    file = params[:image]
    uploader = AvatarUploader.new
    uploader.store!(file)

    respond_to do |format|
      if @busking.save
        format.html { redirect_to @busking, notice: 'Busking was successfully created.' }
        format.json { render :show, status: :created, location: @busking }
      else
        format.html { render :new }
        format.json { render json: @busking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buskings/1
  # PATCH/PUT /buskings/1.json
  def update
    respond_to do |format|
      if @busking.update(busking_params)
        format.html { redirect_to @busking, notice: 'Busking was successfully updated.' }
        format.json { render :show, status: :ok, location: @busking }
      else
        format.html { render :edit }
        format.json { render json: @busking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buskings/1
  # DELETE /buskings/1.json
  def destroy
    @busking.destroy
    respond_to do |format|
      format.html { redirect_to buskings_url, notice: 'Busking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
   # 검색 결과
  def result
    if params[:search]
      @resultPost = Busking.search(params[:search])#.reverse
      @keyword = params[:search]
    end
  end  
  
  def result2
    # 키워드검색
    @keyword = params[:keyword]
    url = "https://dapi.kakao.com/v2/search/vclip?query=" + @keyword
    uri = URI.encode(url)
    res = RestClient.get(uri, headers={'Authorization':'KakaoAK 63c5d677e72eed7c4670c433997d1975'})
    
    unitokor = eval(res)   
    json_g =  JSON.generate(unitokor)
    hash = JSON.parse(json_g)
        
    @item = hash['documents']
    
    # 동영상검색
    url_ = "https://dapi.kakao.com/v2/search/web?query=" + @keyword
    uri_ = URI.encode(url_)
    res_ = RestClient.get(uri_, headers={'Authorization':'KakaoAK 63c5d677e72eed7c4670c433997d1975'})
    
    unitokor_ = eval(res_)   
    json_g_ =  JSON.generate(unitokor_)
    hash_ = JSON.parse(json_g_)
        
    @item_ = hash_['documents']
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busking
      @busking = Busking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def busking_params
      params.require(:busking).permit(:day, :place, :name, :image, :content)
    end
    
    def check_user
      if @busking.user != current_user
        redirect_to '/buskings' 
      end
    end
end
