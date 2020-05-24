require 'rails_helper'

feature 'User visits homepage' do
  scenario 'they see the header' do
    facility = create(:facility)
    
    visit root_path

    expect(page).to have_css('h1', :text => 'Saint Bernard')
  end
end