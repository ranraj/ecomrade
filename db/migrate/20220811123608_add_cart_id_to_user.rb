# frozen_string_literal: true

class AddCartIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cart_id, :integer
    add_index :users, :cart_id
  end
end
