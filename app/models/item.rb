class Item < ActiveRecord::Base
  validates_uniqueness_of :item_id , :tittle, :artist
end
