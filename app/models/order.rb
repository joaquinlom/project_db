class Order < ActiveRecord::Base
  validates_uniqueness_of :order_id, :message => "ID duplicado"
  belongs_to :customer
end
