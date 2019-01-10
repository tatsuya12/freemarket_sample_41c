class RemoveAuthorFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_index :items, :brand_id
    remove_column :items, :brand_id, :string
    remove_index :items, :category_id
    remove_column :items, :category_id, :string
    remove_index :items, :delivery_id
    remove_column :items, :delivery_id, :string
  end
end
