# frozen_string_literal: true

FactoryBot.define do
  factory :copy do
    book

    trait :with_loans do
      transient do
        loan_statuses { [{ active_on: 2.weeks.ago, returned?: true }] }
      end

      loans do
        loan_statuses.map do |status|
          active_on = status.fetch(:active_on)
          traits = status[:returned?] ? [:returned] : []
          association(:loan, *traits, active_on:)
        end
      end
    end
  end
end
