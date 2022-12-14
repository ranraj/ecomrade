# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :code
      t.string :logo

      t.timestamps
    end
  end
end
