class AddProductIdToProductwatcher < ActiveRecord::Migration[7.0]
  def change
    add_column :productwatchers, :product_id, :integer
    add_index :productwatchers, :product_id
  end
end
