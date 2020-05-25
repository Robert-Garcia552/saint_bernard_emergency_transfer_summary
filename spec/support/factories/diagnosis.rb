require 'faker'

FactoryBot.define do
  factory :diagnosis do
    admission
    patient
    coding_system { Faker::Lorem.word }
    code { Faker::Number.hexadecimal(digits: 3) }
    description { Faker::Lorem.sentence(word_count: 10).downcase }
  end
end