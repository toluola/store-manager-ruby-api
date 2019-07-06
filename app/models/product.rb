# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :quantity, presence: { message: "%{value}is required" }
  validates :quantity, numericality: { only_integer: true }
  validates :image, url: true
end
