class Photo < ActiveRecord::Base
    mount_uploader :image, AvatarUploader
    has_many :comment_photos
    belongs_to :user
    has_many :likephotos
    has_many :liked_photo_users, through: :likephotos, source: :user
end
