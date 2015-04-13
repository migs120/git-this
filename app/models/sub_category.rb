class SubCategory < ActiveRecord::Base
  belongs_to :main_category
  has_many :items
end
