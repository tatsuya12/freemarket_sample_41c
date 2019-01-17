class RemovePathFromCategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :path, :string
  end
end
