class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_name, :string, null: true
    add_column :users, :first_name, :string, null: true
    add_column :users, :last_name_kana, :string, null: true
    add_column :users, :first_name_kana, :string, null: true
    add_column :users, :postcode, :string, null: true
    add_column :users, :prefecture, :string, null: true
    add_column :users, :city, :string, null: true
    add_column :users, :block, :string, null: true
    add_column :users, :building, :string, null: true
    add_column :users, :phone_number, :string, null: true
  end
end
