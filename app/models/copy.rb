# frozen_string_literal: true

class Copy < ApplicationRecord
  belongs_to :book
  has_many :loans, inverse_of: :copy, dependent: :destroy

  def reserve_for(member, as_of: Time.zone.now)
    loans.create!(member:, active_on: as_of, due_on: due_date(now))
  end

  def available?(as_of: Time.zone.now)
    !loans.merge(Loan.active(as_of:)).exists?
  end

  private

  def due_date(now)
    if book.best_seller?
      now + 1.week
    else
      now + 2.weeks
    end
  end
end
