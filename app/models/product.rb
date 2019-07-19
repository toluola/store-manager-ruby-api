# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :attendants
  validates :name, :quantity, presence: { message: "%{value}is required" }
  validates :quantity, numericality: { only_integer: true }
  validates :image, url: true
end
