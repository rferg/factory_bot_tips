# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    first_name { 'MyString' }
    middle_name { 'MyString' }
    last_name { 'MyString' }
    in_good_standing { false }
    phone_number { 'MyString' }
    email { 'MyString' }
  end
end
