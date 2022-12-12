# frozen_string_literal: true

class Member < ApplicationRecord
  validates :last_name, :email, presence: true
end
