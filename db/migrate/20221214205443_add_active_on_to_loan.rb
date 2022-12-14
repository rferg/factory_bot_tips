# frozen_string_literal: true

class AddActiveOnToLoan < ActiveRecord::Migration[7.0]
  def change
    add_column :loans, :active_on, :datetime, null: false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
