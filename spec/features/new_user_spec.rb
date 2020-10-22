
require 'rails_helper'


RSpec.feature 'Timeline', type: :feature do
  scenario 'Create a new user' do
    createuser
    expect(page).to have_content("Johnny Yip's page")
  end
  
  scenario "User can't enter an existing email" do
  end

end

