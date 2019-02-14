class Performance < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  mount_uploader :second, AvatarUploader
    belongs_to :user
    has_many :comment_pers
    has_many :likepers
    has_many :liked_per_users, through: :likepers, source: :user
    
  def self.search(search)
    where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
  end
end
