require 'rails_helper'

feature 'User visits homepage' do
  scenario 'they see the header' do
    facility = create(:facility)
    patient = create(:patient)
    
    visit root_path

    expect(page).to have_css('h1', :text => 'Saint Bernard')
    expect(page).to have_css('td', :text => patient.full_name)
  end
end