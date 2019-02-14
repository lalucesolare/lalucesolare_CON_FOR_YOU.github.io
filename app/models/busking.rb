class Busking < ActiveRecord::Base
    mount_uploader :image, AvatarUploader
    has_many :comment_buskings
    belongs_to :user
    has_many :likebuskings
    has_many :liked_busking_users, through: :likebuskings, source: :user
    
  def self.search(search)
    where("name LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
  end
end
