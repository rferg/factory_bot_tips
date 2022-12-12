# frozen_string_literal: true

FactoryBot.define do
  factory :loan do
    member
    copy
    due_on { Time.zone.now }
  end
end
