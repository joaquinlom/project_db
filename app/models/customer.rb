class Customer < ActiveRecord::Base
  has_many :orders
  #validates_uniqueness_of :customer_id, :message => "El ID del cliente debe ser unico"
  
  def new
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
    
  end
  def full_name
    "#{customer_first_name} #{customer_last_name}"
  end

end
