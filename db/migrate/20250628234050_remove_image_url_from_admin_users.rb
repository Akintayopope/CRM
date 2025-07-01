class RemoveImageUrlFromAdminUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :admin_users, :image_url, :string
  end
end
