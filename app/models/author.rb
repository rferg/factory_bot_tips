# frozen_string_literal: true

class Author < ApplicationRecord
  validates :last_name, :year_of_birth, presence: true
end
