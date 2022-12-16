# frozen_string_literal: true

class LoanPresenter < ApplicationPresenter
  def due_message
    due_on.strftime('Due by %m/%d/%Y %l:%M%p')
  end

  def book_title
    copy.book.title
  end
end
