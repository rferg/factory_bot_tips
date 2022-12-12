# frozen_string_literal: true

class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :name, null: false
      t.string :city
      t.string :state
      t.string :country, null: false

      t.timestamps
    end
  end
end
