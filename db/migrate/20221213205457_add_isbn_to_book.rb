# frozen_string_literal: true

class AddIsbnToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :isbn, :string
  end
end
