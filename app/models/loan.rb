# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :member
  belongs_to :copy, inverse_of: :loans
  belongs_to :parent, class_name: 'Loan', optional: true, dependent: :destroy
  has_many :renewals, class_name: 'Loan', foreign_key: 'parent_id', inverse_of: :parent, dependent: :destroy

  scope :active, ->(as_of: Time.zone.now) { where(returned_on: nil, active_on: ..as_of) }

  validates :active_on, :due_on, presence: true
  validate :available_copy

  private

  def available_copy
    errors.add(:copy, 'is not available') unless copy.available?(as_of: active_on)
  end
end
