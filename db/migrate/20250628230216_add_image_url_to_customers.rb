class AddImageUrlToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :image_url, :string
  end
end
