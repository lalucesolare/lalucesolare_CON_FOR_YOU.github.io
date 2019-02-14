class Likephoto < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
end
