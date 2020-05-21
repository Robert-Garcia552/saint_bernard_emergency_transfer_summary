require 'faker'

FactoryBot.define do
  factory :medication_order do
    patient
    name { Faker::Science.element }
    mass_unit { 0 }
    dosage { Faker::Number.decimal(l_digits: 0, r_digits: 3) }
    medication_route { Faker::Number.within(range: 0..2) }
    necessity { Faker::Lorem.sentence(word_count: 10).downcase }
  end
end
