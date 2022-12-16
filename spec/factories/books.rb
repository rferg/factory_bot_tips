# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    year_of_publication { Faker::Number.within(range: -3000..Time.zone.now.year) }
    tier { Book.tiers[:normal] }
    author
    publisher
  end
end
