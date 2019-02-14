class Tip < ActiveRecord::Base
    mount_uploader :image, AvatarUploader
    has_many :comment_tips
    belongs_to :user
    has_many :liketips
    has_many :liked_tip_users, through: :liketips, source: :user
    
    def self.search(search)
        where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
    end
end
