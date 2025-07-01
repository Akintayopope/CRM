class AddImageUrlToAdminUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :admin_users, :image_url, :string
  end
end
