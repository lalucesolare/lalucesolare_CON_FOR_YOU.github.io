class MainController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def mypage
    
  end
  
  def index
    @lastperformances = Performance.limit(3)
    @tips = Tip.limit(5)
    @posts = Post.limit(5)
    @buskings = Busking.limit(5)
    @photos = Photo.limit(3)
    @videos = Video.limit(3)
    @busks = Busking.all
    @performances = Performance.all
  end
  
  def search
    @sdate = params[:searchdate]
    @buskings = Busking.all
    @performances = Performance.all
  end
end







