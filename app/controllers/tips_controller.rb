class TipsController < ApplicationController
  before_action :set_tip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:home]
  # before_action :check_user, only: [:edit, :destroy]
  
  def comment_tip_edit
    @tip = Tip.find(params[:x_id])
    @comment = Tip.find(params[:x_id]).comment_tips.find(params[:c_id])
    
    # if @comment.user != current_user
    #   redirect_to '/tips'
    # end
  end
  
  def comment_tip_update
   comment = Tip.find(params[:x_id]).comment_tips.find(params[:c_id])
   comment.content = params[:c_content]
   comment.save
    
   redirect_to '/tips'
  end
  
  def comment_create
    comment = Tip.find(params[:x_id]).comment_tips.create(content: params[:content])
    comment.user = current_user
    comment.save
    
    redirect_to '/tips'
  end
  
  def comment_destroy
    comment = Tip.find(params[:x_id]).comment_tips.find(params[:c_id])
    # if comment.user != current_user
    #   redirect_to '/tips' 
    # else
      comment.destroy
      redirect_to '/tips'
    # end 
  end

  # GET /tips
  # GET /tips.json
  def index
    @tips = Tip.page(params[:page]).per(5).order(created_at: :desc)
  end

  # GET /tips/1
  # GET /tips/1.json
  def show
  end

  # GET /tips/new
  def new
    @tip = Tip.new
  end

  # GET /tips/1/edit
  def edit
  end

  # POST /tips
  # POST /tips.json
  def create
    @tip = Tip.new(tip_params)
    @tip.user = current_user

    file = params[:image]
    uploader = AvatarUploader.new
    uploader.store!(file)

    respond_to do |format|
      if @tip.save
        format.html { redirect_to @tip, notice: 'Tip was successfully created.' }
        format.json { render :show, status: :created, location: @tip }
      else
        format.html { render :new }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tips/1
  # PATCH/PUT /tips/1.json
  def update
    respond_to do |format|
      if @tip.update(tip_params)
        format.html { redirect_to @tip, notice: 'Tip was successfully updated.' }
        format.json { render :show, status: :ok, location: @tip }
      else
        format.html { render :edit }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tips/1
  # DELETE /tips/1.json
  def destroy
    @tip.destroy
    respond_to do |format|
      format.html { redirect_to tips_url, notice: 'Tip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 # 검색 결과
  def result
    if params[:search]
      @resultPost = Tip.search(params[:search]).reverse
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
    def set_tip
      @tip = Tip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tip_params
      params.require(:tip).permit(:title, :image, :content)
    end
    
    def check_user
      if @tip.user != current_user
        redirect_to '/tips' 
      end
    end
end
