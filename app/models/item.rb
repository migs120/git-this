class Item < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
end
