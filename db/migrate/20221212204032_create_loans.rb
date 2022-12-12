# frozen_string_literal: true

class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.references :member, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.references :parent, foreign_key: { to_table: :loans }
      t.datetime :due_on, null: false

      t.timestamps
    end
  end
end
