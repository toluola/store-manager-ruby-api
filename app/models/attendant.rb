# frozen_string_literal: true

class Attendant < ApplicationRecord
  has_secure_password
  has_many :products, foreign_key: :created_by
  validates :name, :username, :password_digest, presence: { message: "%{value}should be present" }
end
