require 'faker'

FactoryBot.define do
  factory :order_frequency do
    value { rand(1..10) }
    frequency_unit { 0 }
    medication_order_id { rand(1..MedicationOrder.count) }
  end
end
  