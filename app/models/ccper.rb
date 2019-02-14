class Ccper < ActiveRecord::Base
  belongs_to :comment_per
  belongs_to :user
end
