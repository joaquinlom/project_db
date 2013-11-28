class RenamePasswordToUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :encrypted_pass, :password_hash
  end
end
