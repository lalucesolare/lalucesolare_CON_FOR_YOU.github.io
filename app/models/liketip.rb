class Liketip < ActiveRecord::Base
  belongs_to :user
  belongs_to :tip
end
