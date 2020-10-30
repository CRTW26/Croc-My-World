# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'View users', type: :feature do
  scenario 'When the user logs in theres a link to click and see all users and their profile' do
    sign_up
    expect(page).to have_content('All users')
    expect(page).to have_content('My profile')
  end

  scenario 'User can view their profile informaiton' do
    sign_up
    click_on 'My profile'
    expect(page).to have_content('Test')
    expect(page).to have_content('user@test.com')
  end

  scenario 'User can view other peoples profiles when clicking on All users' do
    sign_up
    click_on 'Logout'
    sign_up_second_user
    click_on 'All users'
    expect(page).to have_content('Test')
    expect(page).to have_content('User2')
  end

  scenario 'Users who are not friends can only see other users name' do
    sign_up
    click_on 'Logout'
    sign_up_second_user
    click_on 'All users'
    click_on 'View Profile'
    expect(page).to have_content('Test')
  end
end
