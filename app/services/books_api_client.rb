# frozen_string_literal: true

class BooksApiClient
  def by_isbn(isbn)
    body = {
      'isbn' => isbn,
      'author' => Faker::Name.name,
      'title' => Faker::Book.title,
      'details' => {
        'descriptions' => { 'en-us' => Faker::Lorem.paragraph, 'en-gb' => Faker::Lorem.paragraph }
      }
    }
    Response.success(body)
  end

  class Response
    attr_reader :status, :body

    def self.success(body)
      new(200, body)
    end

    def initialize(status, body)
      @status = status
      @body = body
    end

    def ensure_success
      raise Error.new(status, body&.fetch('message', '')) unless status.between?(200, 299)

      self
    end

    class Error < StandardError
      def initialize(status, message = '')
        super("Received #{status} response: #{message}")
      end
    end
  end
end
