# frozen_string_literal: true

FactoryBot.define do
  factory :loan do
    member
    copy
    due_on { Time.zone.now }
    active_on { Time.zone.now }

    trait :returned do
      returned_on { Time.zone.now }
    end
  end
end
