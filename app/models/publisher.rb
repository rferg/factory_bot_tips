# frozen_string_literal: true

class Publisher < ApplicationRecord
  validates :name, :country, presence: true
end
