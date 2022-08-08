# frozen_string_literal: true

class AddUserIdToProductwatcher < ActiveRecord::Migration[7.0]
  def change
    add_column :productwatchers, :user_id, :integer
    add_index :productwatchers, :user_id
  end
end
