class OrderDetails < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  validates_uniqueness_of :order_id, :message => "El ID de la orden debe ser unico"
end
