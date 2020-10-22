# frozen_string_literal: true

def newpost
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: 'Hello, world!'
  click_button 'Submit'
end

def createuser
  visit '/users/new'
  fill_in 'Email', with: 'johnny@johnny.com'
  fill_in 'Password', with: 'secret'
  fill_in 'Name', with: 'Johnny Yip'
  click_button 'Submit'
end
