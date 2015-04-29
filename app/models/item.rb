class Item < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :user
  has_many :item_pics
  mount_uploader :avatar, AvatarUploader
end
