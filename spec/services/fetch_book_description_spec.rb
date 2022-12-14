# frozen_string_literal: true

RSpec.describe FetchBookDescription do
  describe '#call' do
    let(:isbn) { Faker::Barcode.isbn }
    let(:api_client) { instance_double(BooksApiClient) }

    before do
      allow(BooksApiClient).to receive(:new).and_return(api_client)
    end

    def call
      described_class.call(isbn)
    end

    def create_response(body)
      BooksApiClient::Response.success(body)
    end

    def setup_successful_response(body)
      allow(api_client).to receive(:by_isbn).with(isbn).and_return(BooksApiClient::Response.success(body))
    end

    it 'returns empty string if no US or GB English description is included in API response' do
      setup_successful_response(build(:books_api_response_body))

      expect(call).to be_empty
    end

    it 'returns US English description if included in API response' do
      expected = Faker::Lorem.paragraph
      body = build(:books_api_response_body, us_english_description: expected)
      setup_successful_response(body)

      expect(call).to eq(expected)
    end

    it 'returns GB English description if no US English included in API response' do
      expected = Faker::Lorem.paragraph
      body = build(:books_api_response_body, gb_english_description: expected)
      setup_successful_response(body)

      expect(call).to eq(expected)
    end

    it 'returns US English description if both GB and US included in API response' do
      expected = 'US'
      body = build(:books_api_response_body, us_english_description: expected, gb_english_description: 'GB')
      setup_successful_response(body)

      expect(call).to eq(expected)
    end
  end
end
