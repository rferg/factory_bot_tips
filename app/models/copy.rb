# frozen_string_literal: true

class Copy < ApplicationRecord
  belongs_to :book
  has_many :loans, inverse_of: :copy, dependent: :destroy

  def reserve_for(member, as_of: Time.zone.now)
    loans.create!(member:, active_on: as_of, due_on: due_date(as_of))
  end

  def available?(as_of: Time.zone.now)
    !loans.merge(Loan.active(as_of:)).exists?
  end

  private

  def due_date(active_on)
    if book.best_seller?
      active_on + 1.week
    else
      active_on + 2.weeks
    end
  end
end
