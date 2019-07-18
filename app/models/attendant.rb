# frozen_string_literal: true

class Attendant < ApplicationRecord
  has_secure_password
  has_many :products, foreign_key: :created_by
  validates :username, uniqueness: { message: "The username %{value} has already been taken" },
                       format: { without: /\s/,
                                 message: "Your username should have no spaces" }
  validates :name, :username, :password_digest, presence: { message: "%{value}should be present" }
end
