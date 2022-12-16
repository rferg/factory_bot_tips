# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :member
  belongs_to :copy, inverse_of: :loans
  belongs_to :parent, class_name: 'Loan', optional: true, dependent: :destroy
  has_many :renewals, class_name: 'Loan', foreign_key: 'parent_id', inverse_of: :parent, dependent: :destroy

  scope :active, ->(as_of: Time.zone.now) { where(returned_on: nil, active_on: ..as_of) }

  validates :active_on, :due_on, presence: true
  validate :available_copy

  def overdue_fees_cents(now: Time.zone.now)
    reference_date = (returned_on || now).to_date
    cents = (reference_date - due_on.to_date).to_i * overdue_cents_per_day
    [cents, 0].max
  end

  private

  def available_copy
    errors.add(:copy, 'is not available') unless copy.available?(as_of: active_on)
  end

  def overdue_cents_per_day
    @overdue_cents_per_day ||= 10
  end
end
