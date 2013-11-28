class CreateItemsOrderdetails < ActiveRecord::Migration
  def change
    create_table :items_orders do |t|
      t.references :item
      t.references :order_details
    end
  end
end