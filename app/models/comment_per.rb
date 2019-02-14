class CommentPer < ActiveRecord::Base
  belongs_to :performance
  belongs_to :user
  
  has_many :ccpers
end
