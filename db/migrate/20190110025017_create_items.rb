class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
       t.string :name, null: false
       t.integer :price, null: false
       t.string :status, null: false
       t.string :size
       t.string :condition
       t.text :introduction
       t.timestamps null: true
    end
  end
end
