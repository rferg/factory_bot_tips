# frozen_string_literal: true

class FetchBookDescription < ApplicationService
  def initialize(isbn)
    @isbn = isbn
  end

  def call
    body = client.by_isbn(isbn).ensure_success.body
    extract_description(body)
  end

  private

  attr_reader :isbn

  def extract_description(body)
    descriptions = body&.dig('details', 'descriptions')
    return '' if descriptions.blank?

    descriptions.fetch('en-us', descriptions.fetch('en-gb', ''))
  end

  def client
    @client ||= BooksApiClient.new
  end
end
