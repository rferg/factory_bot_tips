# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :member
  belongs_to :copy
  belongs_to :parent, class_name: 'Loan', optional: true
  has_many :renewals, class_name: 'Loan', foreign_key: 'parent_id'

  validates :copy, :due_on, :member, presence: true
end
