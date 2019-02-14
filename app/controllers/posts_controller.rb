class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:home]
  # before_action :check_user, only: [:edit, :destroy]
  
  def comment_comu_edit
    @post = Post.find(params[:x_id])
    @comment = Post.find(params[:x_id]).comment_comus.find(params[:c_id])
    
    # if @comment.user != current_user
    #   redirect_to '/posts'
    # end
  end
  
  def comment_comu_update
   comment = Post.find(params[:x_id]).comment_comus.find(params[:c_id])
   comment.content = params[:c_content]
   comment.save
    
   redirect_to '/posts'
  end
  
  def comment_create
    comment = Post.find(params[:x_id]).comment_comus.create(content: params[:content])
    comment.user = current_user
    comment.save
    
    redirect_to '/posts'
  end
  
  def comment_destroy
    comment = Post.find(params[:x_id]).comment_comus.find(params[:c_id])
    # if comment.user != current_user
    #   redirect_to '/posts' 
    # else
      comment.destroy
      redirect_to '/posts'
    # end 
    
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post         = Post.find(params[:id])
    @new_comment  = Comment.build_from(@post, current_user.id, "")
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    # check_user
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    # check_user
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
 
  end
  
  # 검색 결과
  def result
    if params[:search]
      @resultPost = Post.search(params[:search]).reverse
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
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
    
    def check_user
      if @post.user != current_user
        redirect_to '/posts' 
      end
    end
 
  
end
