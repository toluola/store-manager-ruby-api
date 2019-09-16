# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Lorem.word }
    quantity { Faker::Number.number(digits: 3) }
    category { Faker::Lorem.word }
    image { Faker::Internet.url }
    attendant_id { Attendant.first.id }
  end
end
