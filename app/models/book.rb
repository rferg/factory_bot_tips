# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher

  validates :title, :year_of_publication, :author, :publisher, presence: true
end
