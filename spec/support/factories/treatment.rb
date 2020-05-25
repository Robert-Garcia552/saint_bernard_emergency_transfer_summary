require 'faker'

FactoryBot.define do
  factory :treatment do
    patient
    description { Faker::Lorem.sentence(word_count: 10).downcase }
    necessity { Faker::Lorem.sentence(word_count: 10).downcase }
  end
end