class CreateCustomers < ActiveRecord::Migration
  def change
   
    create_table :customers do |t|
      t.integer :customer_id
      t.string :customer_first_name
      t.string :customer_last_name
      t.string :customer_address
      t.string :customer_city
      t.string :customer_state
      t.string :customer_zip
      t.string :customer_phone
      t.string :customer_fax
      t.string :email 
      
      t.timestamps
    end
  end
end
