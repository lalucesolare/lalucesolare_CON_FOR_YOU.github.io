class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :performances
  belongs_to :posts
  belongs_to :tips
  belongs_to :buskings
  belongs_to :videos
  belongs_to :photos
  
  belongs_to :comment_pers
  belongs_to :comment_comus
  belongs_to :comment_tips
  belongs_to :comment_buskings
  belongs_to :comment_videos
  belongs_to :comment_photos
  
  has_many :performances
  has_many :posts
  has_many :tips
  has_many :buskings
  has_many :photos
  has_many :videos
  
  
  has_many :comment_pers
  has_many :comment_comus
  has_many :comment_tips
  has_many :comment_buskings
  has_many :comment_photos
  has_many :comment_videos
  
  
  has_many :likepers
  has_many :liked_pers, through: :likepers, source: :performance
  
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  
  has_many :liketips
  has_many :liked_tips, through: :liketips, source: :tip
  
  has_many :likebuskings
  has_many :liked_buskings, through: :likebuskings, source: :busking
  
  has_many :likephotos
  has_many :liked_photos, through: :likephotos, source: :photo
  
  has_many :likevideos
  has_many :liked_videos, through: :likevideos, source: :video
  
  
  
  has_many :ccpers
 
end

