class Addfiles < ActiveRecord::Migration
  def change
    add_column :customers, :provider, :string
    add_column :customers, :uid, :string
    add_column :customers, :oauth_token, :string
    add_column :customers, :oauth_expires_at, :datetime
  end
end