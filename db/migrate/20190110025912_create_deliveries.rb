class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.string :shipping_charge, null: false
      t.string :origin_region, null: false
      t.string :shipping_days, null: false
      t.string :shipping_method, null: false
      t.references :item, null: false, foreign_key: true
      t.timestamps null: true
    end
  end
end
