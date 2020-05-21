require 'faker'

FactoryBot.define do
  factory :symptom do
    admission
    description { Faker::Lorem.sentence(word_count: 10).downcase }
  end
end