require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do  
  scenario 'Can edit name and email' do
    visit '/users/new'
    fill_in 'Name', with: 'Joe Bloggs'
    fill_in 'Email', with: 'joe@bloggs.com'
    fill_in 'Password', with: 'secret'
    click_button 'Submit'
    click_link 'Edit'
    find_field('user[name]').set('John Smith')
    click_button 'Submit'
    expect(page).to have_content 'John Smith'
  end
end
   




