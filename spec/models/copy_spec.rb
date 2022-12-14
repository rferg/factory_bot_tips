# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Copy do
  describe '#available?' do
    let(:now) { Time.zone.now }

    def call(copy)
      copy.available?(as_of: now)
    end

    it 'is true if copy has no loans' do
      copy = create(:copy)

      expect(call(copy)).to be(true)
    end

    it 'is true if all loans have been returned' do
      loan_statuses = [
        { active_on: now - 2.months, returned?: true },
        { active_on: now - 1.day, returned?: true }
      ]
      copy = create(:copy, :with_loans, loan_statuses:)
      expect(call(copy)).to be(true)
    end

    it 'is true if all loans are in the future' do
      loan_statuses = [{ active_on: now + 2.months }, { active_on: now + 1.day }]
      copy = create(:copy, :with_loans, loan_statuses:)
      expect(call(copy)).to be(true)
    end

    it 'is false if a loan is active an not returned' do
      loan_statuses = [{ active_on: now - 1.day }]
      copy = create(:copy, :with_loans, loan_statuses:)
      expect(call(copy)).to be(false)
    end
  end
end
