class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :second_last_name
      t.string :email
      t.string :encrypted_pass
      t.string :provider
      t.string :uid
      t.string :token
      t.integer :user_id
      
      t.timestamps
    end
  end
end
