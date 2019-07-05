# frozen_string_literal: true

class Product < ApplicationRecord
  validates_presence_of :name, :quantity
end
