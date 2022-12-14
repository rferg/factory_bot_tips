# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  enum :tier, { normal: 0, best_seller: 1 }

  validates :title, :year_of_publication, presence: true
end
