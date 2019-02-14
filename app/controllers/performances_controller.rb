class PerformancesController < ApplicationController
  before_action :set_performance, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:home]
  # before_action :check_user, only: [:edit, :destroy]
  # before_action :check_role, except: [:show]
    
  
  def comment_per_edit
    @performance = Performance.find(params[:x_id])
    @comment = Performance.find(params[:x_id]).comment_pers.find(params[:c_id])
    
    # if @comment.user != current_user
    #   redirect_to '/performances'
    # end
  end
  
  def comment_per_update
   comment = Performance.find(params[:x_id]).comment_pers.find(params[:c_id])
   comment.content = params[:c_content]
   comment.save
    
   redirect_to '/performances'
  end
  
  
  def comment_create
    comment = Performance.find(params[:x_id]).comment_pers.create(content: params[:content])
    comment.user = current_user
    comment.save
    
    redirect_to '/performances'
  end
  
  def comment_destroy
    comment = Performance.find(params[:x_id]).comment_pers.find(params[:c_id])
    # if comment.user != current_user
    #   redirect_to '/performances' 
    # else
      comment.destroy
      redirect_to '/performances'
    # end 
  end

  # GET /performances
  # GET /performances.json
  def index
    # @performances = Performance.all // pagenate 해서 안써도 됨
    # @performances = Performance.order("created_at DESC") 밑에 포함
    @performances = Performance.page(params[:page]).per(5).order(created_at: :desc)
  end

  # GET /performances/1
  # GET /performances/1.json
  def show

  end

  # GET /performances/new
  def new
    @performance = Performance.new
  end

  # GET /performances/1/edit
  def edit
  end

  # POST /performances
  # POST /performances.json
  def create
    @performance = Performance.new(performance_params)
    @performance.user = current_user
    
    file = params[:image]
    uploader = AvatarUploader.new
    uploader.store!(file)
    
    file = params[:second]
    uploader = AvatarUploader.new
    uploader.store!(file)

    respond_to do |format|
      if @performance.save
        format.html { redirect_to @performance, notice: 'Performance was successfully created.' }
        format.json { render :show, status: :created, location: @performance }
      else
        format.html { render :new }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performances/1
  # PATCH/PUT /performances/1.json
  def update
    respond_to do |format|
      if @performance.update(performance_params)
        format.html { redirect_to @performance, notice: 'Performance was successfully updated.' }
        format.json { render :show, status: :ok, location: @performance }
      else
        format.html { render :edit }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performances/1
  # DELETE /performances/1.json
  def destroy
    @performance.destroy
    respond_to do |format|
      format.html { redirect_to performances_url, notice: 'Performance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # def performance_like
  #     like = Performance.find(params[:performance_id]).likes.create(like)
  #     # like += 1
  #     like.save
      
  #     redirect_to '/performances'
  # end

  # 검색 결과
  def result
    if params[:search]
      @resultPost = Performance.search(params[:search]).reverse
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
    def set_performance
      @performance = Performance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performance_params
      params.require(:performance).permit(:day, :title, :image, :second, :content)
    end
    
    def check_user
      if @performance.user != current_user
        redirect_to '/performances'
      end
    end
    
    def check_role
      if current_user.role == 'admin' # 비워도 ok
      elsif current_user.role == 'editor'
      else
        redirect_back(fallback_location: root_url)
      end
    end
  
end
