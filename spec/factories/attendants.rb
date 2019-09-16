# frozen_string_literal: true

FactoryBot.define do
  factory :attendant do
    name { Faker::Lorem.word }
    username { "tolu" }
    password { "test123" }
    role { "admin" }
  end
end
