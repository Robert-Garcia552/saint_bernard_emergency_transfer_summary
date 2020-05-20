require 'rails_helper'
require 'faker'

describe 'emergency_transfer_summary/show.html.erb' do
  before do
    assign(:facility, Facility.create(name: 'Saint Bernard'))
    assign(:patient, Patient.create(
      first_name: 'First',
      middle_name: 'Middle',
      last_name: 'Last',
      mr: '1234',
      dob: "Tue, 13 Jan 2009",
      gender: 0
    ))
    assign(:summary, {
      "patient" => Patient.last,
      "facility" => Facility.last,
      "allergies_sentence" => Faker::Lorem.sentence(word_count: 10).downcase,
      "chronic_conditions_sentence" => Faker::Lorem.sentence(word_count: 10).downcase,
      "medications" => Faker::Lorem.sentence(word_count: 10).downcase,
      "treatment_sentence" => Faker::Lorem.sentence(word_count: 10).downcase,
      "diagnostic_procedures_sentence" => Faker::Lorem.sentence(word_count: 10).downcase,
      "admission_date" => Faker::Lorem.sentence(word_count: 10).downcase,
      "symptoms_sentence" => Faker::Lorem.sentence(word_count: 10).downcase,
      "diagnoses_sentence" => Faker::Lorem.sentence(word_count: 10).downcase,
      "observations_sentence" => Faker::Lorem.sentence(word_count: 10).downcase,
    })
    render
  end
 
  it 'shows an Emergency Transfer Summary for a patient' do
    expect(rendered).to have_content('Saint Bernard')
    expect(rendered).to have_content('First')
    expect(rendered).to have_content('Middle')
    expect(rendered).to have_content('Last')
    expect(rendered).to have_content('1234')
    expect(rendered).to have_content('11')
  end
end
