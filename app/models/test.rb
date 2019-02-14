class Test < ActiveRecord::Base
    mount_uploader :image, AvatarUploader
    
end