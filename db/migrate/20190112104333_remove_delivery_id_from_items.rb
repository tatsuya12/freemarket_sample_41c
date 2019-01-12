class RemoveDeliveryIdFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_reference :items, :delivery, foreign_key: true
  end
end
