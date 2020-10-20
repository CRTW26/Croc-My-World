require 'rails_helper'

RSpec.feature "Delete", type: :feature do 
  scenario 'user can delete a post' do 
    visit '/posts'
    click_link 'New post'
    fill_in "Message", with: "Hello world"
    click_button 'Submit'
    #first(:link).click
    click_link 'Delete'
    expect(page).not_to have_content('Hello world')
  end 
end 