# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
  end
end
