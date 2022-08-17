# frozen_string_literal: true

class AddUserIdToPurchaseorder < ActiveRecord::Migration[7.0]
  def change
    add_column :purchaseorders, :user_id, :integer
    add_index :purchaseorders, :user_id
  end
end
