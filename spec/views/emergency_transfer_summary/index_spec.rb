require 'rails_helper'
require 'faker'

describe 'emergency_transfer_summary/index.html.erb' do
  before do
    assign(:facility, Facility.create(name: 'Saint Bernard') )
    assign(:patients, [Patient.create(
      first_name: Faker::Name.first_name,
      middle_name: Faker::Name.middle_name,
      last_name: Faker::Name.last_name,
      mr: Faker::Number.unique.number(digits: 4).to_s,
      dob: Faker::Date.birthday(min_age: 1, max_age: 65),
      gender: rand(0..2)
    )])
    render
  end

  it 'successfully views homepage' do
    expect(rendered).to have_css 'h1', text: 'Saint Bernard'
  end
end