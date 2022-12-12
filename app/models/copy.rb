# frozen_string_literal: true

class Copy < ApplicationRecord
  belongs_to :book

  validates :book, presence: true
end
