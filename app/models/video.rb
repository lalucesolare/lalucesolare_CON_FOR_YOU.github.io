class Video < ActiveRecord::Base
    mount_uploader :image, AvatarUploader
    has_many :comment_videos
    belongs_to :user
    has_many :likevideos
    has_many :liked_video_users, through: :likevideos, source: :user
end
