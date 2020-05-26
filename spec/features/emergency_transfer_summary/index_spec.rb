require 'rails_helper'

feature 'User visits homepage' do
  scenario 'they see the header' do
    facility = create(:facility, name: 'Saint Bernard')
    patient = create(:patient)
    
    visit root_path

    expect(page).to have_css('h1', :text => facility.name)
    expect(page).to have_css('td', :text => patient.full_name)
  end
end