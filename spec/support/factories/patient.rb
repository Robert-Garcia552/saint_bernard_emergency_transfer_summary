require 'faker'

FactoryBot.define do
  factory :patient do
    first_name  { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name   { Faker::Name.last_name }
    mr          { Faker::Number.unique.number(digits: 4).to_s }
    dob         { Faker::Date.birthday(min_age: 1, max_age: 65) }
    gender      { rand(0..2) }
  end
end