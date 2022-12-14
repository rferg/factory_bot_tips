# frozen_string_literal: true

class AddReturnedOnToLoan < ActiveRecord::Migration[7.0]
  def change
    add_column :loans, :returned_on, :datetime
  end
end
