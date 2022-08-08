# frozen_string_literal: true

class CreatePurchaseorders < ActiveRecord::Migration[7.0]
  def change
    create_table :purchaseorders do |t|
      t.string :status

      t.timestamps
    end
  end
end
