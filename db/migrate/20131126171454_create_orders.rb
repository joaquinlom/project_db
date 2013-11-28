class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.integer :custome_id
      t.datetime :order_date
      t.datetime :shipped_date

      t.timestamps
    end
  end
end
