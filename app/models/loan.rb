# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :member
  belongs_to :copy
  belongs_to :parent, class_name: 'Loan', optional: true, dependent: :destroy
  has_many :renewals, class_name: 'Loan', foreign_key: 'parent_id', inverse_of: :parent, dependent: :destroy

  validates :due_on, presence: true
end
