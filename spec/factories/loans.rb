# frozen_string_literal: true

FactoryBot.define do
  factory :loan do
    member { nil }
    book { nil }
    due_on { '2022-12-12 15:40:32' }
  end
end
