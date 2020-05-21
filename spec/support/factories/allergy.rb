require 'faker'

FactoryBot.define do
  factory :allergy do
    patient
    description { Faker::Lorem.sentence(word_count: 10).downcase }
  end
end