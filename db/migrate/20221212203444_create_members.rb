# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name, null: false
      t.boolean :in_good_standing, null: false, default: true
      t.string :phone_number
      t.string :email, null: false

      t.timestamps
    end
  end
end
