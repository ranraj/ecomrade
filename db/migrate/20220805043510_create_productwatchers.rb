# frozen_string_literal: true

class CreateProductwatchers < ActiveRecord::Migration[7.0]
  def change
    create_table :productwatchers do |t|
      t.string :status

      t.timestamps
    end
  end
end
