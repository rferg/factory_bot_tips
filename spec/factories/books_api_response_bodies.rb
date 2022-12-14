# frozen_string_literal: true

FactoryBot.define do
  factory :books_api_response_body, class: Hash do
    skip_create

    transient do
      isbn { Faker::Barcode.isbn }
      author { Faker::Name.name }
      title { Faker::Book.title }
      descriptions { {} }
      us_english_description { '' }
      gb_english_description { '' }
    end

    initialize_with do
      english_descriptions = { 'en-us' => us_english_description, 'en-gb' => gb_english_description }.compact_blank
      {
        'isbn' => isbn,
        'author' => author,
        'title' => title,
        'details' => { 'descriptions' => descriptions.merge(english_descriptions) }
      }
    end
  end
end
