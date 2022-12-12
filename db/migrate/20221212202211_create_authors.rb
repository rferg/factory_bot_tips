# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name, null: false
      t.integer :year_of_birth, null: false
      t.integer :year_of_death

      t.timestamps
    end
  end
end
