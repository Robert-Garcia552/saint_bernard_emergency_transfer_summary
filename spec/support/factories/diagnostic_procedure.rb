require 'faker'

FactoryBot.define do
  factory :diagnostic_procedure do
    patient
    description { Faker::Lorem.sentence(word_count: 10).downcase }
    moment { Faker::Time.backward(days: 150) }
  end
end