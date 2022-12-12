# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'MyString' }
    year_of_publication { 1 }
    author { nil }
    publisher { nil }
  end
end
