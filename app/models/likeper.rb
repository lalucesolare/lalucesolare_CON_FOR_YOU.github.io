class Likeper < ActiveRecord::Base
  belongs_to :user
  belongs_to :performance
end
