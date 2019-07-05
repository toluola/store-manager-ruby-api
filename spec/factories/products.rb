# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Lorem.word }
    quantity { Faker::Number.number(10) }
    category { Faker::Lorem.word }
    image { Faker::Lorem.word }
  end
end
