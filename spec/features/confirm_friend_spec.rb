# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Confirm friend', type: :feature do
  scenario 'can confirm friend request' do
    sign_up
    click_link 'Logout'
    sign_up_second_user
    click_link 'All users'
    click_link 'View Profile'
    click_on 'Add friend'
    click_link 'Logout'
    log_in_user
    click_link 'All users'
    click_on 'View Profile'
    click_on 'Confirm'
    expect(page).to have_content('Friend request accepted!')
  end

  scenario 'can deny friend request' do
    sign_up
    click_link 'Logout'
    sign_up_second_user
    click_link 'All users'
    click_link 'View Profile'
    click_on 'Add friend'
    click_link 'Logout'
    log_in_user
    click_link 'All users'
    click_on 'View Profile'
    click_on 'Reject'
    expect(page).to have_content('Friend request denied!')
  end
end
