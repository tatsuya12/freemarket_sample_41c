class AddColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :shipping_charge, :string
    add_column :items, :origin_region, :string
    add_column :items, :shipping_method, :string
    add_column :items, :shipping_days, :string
  end
end
