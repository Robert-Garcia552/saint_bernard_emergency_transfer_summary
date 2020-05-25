require 'faker'

FactoryBot.define do
  factory :admission do
    patient
    moment { Faker::Time.backward(days: 150) }
  end
end
