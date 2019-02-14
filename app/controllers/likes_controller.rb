class LikesController < ApplicationController
  def like_toggle
    like = Like.find_by(user: current_user, post_id: params[:post_id])
    if like.nil?
      Like.create!(user: current_user, post_id: params[:post_id])
    else
      like.destroy
    end
    redirect_to :back
  end

  def like_busking_toggle
    like = Likebusking.find_by(user: current_user, busking_id: params[:post_id])
    if like.nil?
      Likebusking.create!(user: current_user, busking_id: params[:post_id])
    else
      like.destroy
    end
    redirect_to :back
  end
  
  def like_tip_toggle
    like = Liketip.find_by(user: current_user, tip_id: params[:post_id])
    if like.nil?
      Liketip.create!(user: current_user, tip_id: params[:post_id])
    else
      like.destroy
    end
    redirect_to :back
  end
  
  def like_per_toggle
    like = Likeper.find_by(user: current_user, performance_id: params[:post_id])
    if like.nil?
      Likeper.create!(user: current_user, performance_id: params[:post_id])
    else
      like.destroy
    end
    redirect_to :back
  end
  
  def like_photo_toggle
    like = Likephoto.find_by(user: current_user, photo_id: params[:post_id])
    if like.nil?
      Likephoto.create!(user: current_user, photo_id: params[:post_id])
    else
      like.destroy
    end
    redirect_to :back
  end
  
  def like_video_toggle
    like = Likevideo.find_by(user: current_user, video_id: params[:post_id])
    if like.nil?
      Likevideo.create!(user: current_user, video_id: params[:post_id])
    else
      like.destroy
    end
    redirect_to :back
  end

end 

