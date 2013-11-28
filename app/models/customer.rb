class Customer < ActiveRecord::Base
  has_many :orders
  validates_uniqueness_of :customer_id, :message => "El ID del cliente debe ser unico"
  
  def new
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
    
  end
  

end
