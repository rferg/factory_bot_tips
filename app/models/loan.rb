# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :member
  belongs_to :book
  belongs_to :parent, class_name: 'Loan', optional: true
  has_many :renewals, class_name: 'Loan', foreign_key: 'parent_id'
end
