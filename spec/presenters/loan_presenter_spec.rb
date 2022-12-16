# frozen_string_literal: true

RSpec.describe LoanPresenter do
  let(:loan) { build_stubbed(:loan) }
  let(:presenter) { described_class.new(loan) }

  describe '#due_message' do
    it 'contains formatted due_on date' do
      expect(presenter.due_message).to eq(loan.due_on.strftime('Due by %m/%d/%Y %l:%M%p'))
    end
  end

  describe '#book_title' do
    it 'is the title of the book associated to the loaned copy' do
      expect(presenter.book_title).to eq(loan.copy.book.title)
    end
  end
end
