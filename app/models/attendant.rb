# frozen_string_literal: true

class Attendant < ApplicationRecord
  has_secure_password
  has_many :products, foreign_key: :attendant_id
  validates :username, uniqueness: { message: "The username %{value} has already been taken" },
                       format: { without: /\s/,
                                 message: "Your username should have no spaces" }
  validates :name, presence: { message: "name should be present" }, format: { with: /\A[a-z]+\z/i }
  validates :username, :password_digest, presence: { message: "%{value}should be present" }
  validates :role, inclusion: { in: %w(admin attendant) }
end
