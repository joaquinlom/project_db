class OrderDetails < ActiveRecord::Base
  has_many :items
  has_many :orders
  validates_uniqueness_of :order_id, :message => "El ID de la orden debe ser unico"
   
end
