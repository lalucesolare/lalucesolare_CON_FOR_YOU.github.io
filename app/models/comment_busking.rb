class CommentBusking < ActiveRecord::Base
  belongs_to :busking
  belongs_to :user
end
