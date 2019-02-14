class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comment_comus
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    acts_as_commentable
    
    def self.search(search)
        where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
    end
end
