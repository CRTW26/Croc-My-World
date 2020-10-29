# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Add friend', type: :feature do
  scenario 'can send friend request' do
    sign_up
    click_link 'Logout'
    sign_up_second_user
    click_link 'All users'
    click_link 'View Profile'
    click_on 'Add friend'
    expect(page).to have_content('Friend request sent!')
  end
end
