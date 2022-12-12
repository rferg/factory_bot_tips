# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    first_name { 'MyString' }
    middle_name { 'MyString' }
    last_name { 'MyString' }
    year_of_birth { 1 }
    year_of_death { 1 }
  end
end
