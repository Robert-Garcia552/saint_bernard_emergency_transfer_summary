require 'faker'

5.times do
  Patient.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
    mr: Faker::Number.unique.number(digits: 4).to_s,
    dob: Faker::Date.birthday(min_age: 1, max_age: 65),
    gender: rand(0..2)
  )

  Admission.create(
    patient_id: Patient.last.id,
    moment: Faker::Time.backward(days: 150)
  )

  Allergy.create(
    patient_id: Patient.last.id,
    description: Faker::Lorem.sentence(word_count: 10)
  )

  Diagnosis.create(
    coding_system: Faker::Lorem.word,
    code: Faker::Number.hexadecimal(digits: 3),
    description: Faker::Lorem.sentence(word_count: 10)
  )

  DiagnosticProcedure.create(
    patient_id: Patient.last.id,
    description: Faker::Lorem.sentence(word_count: 10),
    moment: Faker::Time.backward(days: 150)
  )

  Facility.create(
    name: Faker::Company.name
  )

  OrderFrequency.create(
    value: rand(1..10),
    frequency_unit: 0
  )

  MedicationOrder.create(
    patient_id: Patient.last.id,
    name: Faker::Science.element,
    mass_unit: 0,
    dosage: Faker::Number.decimal(l_digits: 0, r_digits: 3),
    medication_route: Faker::Number.within(range: 0..2),
    order_frequency_id: OrderFrequency.find(rand(1..OrderFrequency.count)),
    necessity: Faker::Lorem.sentence(word_count: 10)
  )

  Observation.create(
    admission_id: Admission.last.id,
    description: Faker::Lorem.sentence(word_count: 10),
    moment: Faker::Time.backward(days: 150)
  )

  Symptom.create(
    admission_id: Admission.last.id,
    description: Faker::Lorem.sentence(word_count: 10)
  )

  Treatment.create(
    patient_id: Patient.last.id,
    description: Faker::Lorem.sentence(word_count: 10),
    necessity: Faker::Lorem.sentence(word_count: 10)
  )
end
