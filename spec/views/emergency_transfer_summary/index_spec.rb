require 'rails_helper'
require 'faker'

describe 'emergency_transfer_summary/index.html.erb' do
  before do
    assign(:facility, create(:facility) )
    assign(:patients, [create(:patient)])
    render
  end

  it 'successfully views homepage' do
    expect(rendered).to have_css 'h1', text: 'Saint Bernard'
  end
end