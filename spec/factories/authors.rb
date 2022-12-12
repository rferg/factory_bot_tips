# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    last_name { Faker::Name.last_name }
    year_of_birth { Faker::Number.within(range: -3000..Time.zone.now.year) }
  end
end
