# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loan do
  describe '#overdue_fees_cents' do
    let(:now) { Time.zone.now }

    def build_loan(*args, **kwargs)
      # Change this to build() to improve performance.
      create(:loan, *args, **kwargs)
    end

    it 'is 0 if loan is not returned and due date is in future' do
      loan = build_loan(due_on: now + 1.day)

      expect(loan.overdue_fees_cents(now:)).to be(0)
    end

    it 'is 0 if loan was returned before due date' do
      loan = build_loan(due_on: now - 1.day, returned_on: now - 2.days)

      expect(loan.overdue_fees_cents(now:)).to be(0)
    end

    it 'is 10 cents per day after due_on if not returned' do
      days_cases = [1, 5, 13, 50]
      days_cases.each do |days|
        loan = build_loan(due_on: now - days.days)

        expect(loan.overdue_fees_cents(now:)).to be(days * 10)
      end
    end

    it 'is 10 cents per day returned after due_on' do
      days_cases = [1, 5, 13, 50]
      days_cases.each do |days|
        loan = build_loan(due_on: now, returned_on: now + days.days)

        expect(loan.overdue_fees_cents(now:)).to be(days * 10)
      end
    end
  end
end
