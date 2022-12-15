# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :loans, dependent: :destroy
  has_many :copies, through: :loans
  has_many :books, through: :copies
  validates :last_name, :email, presence: true
end
