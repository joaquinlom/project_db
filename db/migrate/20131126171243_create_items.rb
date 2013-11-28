class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :item_id
      t.string :title
      t.string :artist
      t.float :unit_price

      t.timestamps
    end
  end
end
