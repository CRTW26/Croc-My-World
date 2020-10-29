require 'rails_helper'

RSpec.feature 'Create a like' do
  scenario 'The main page has a like button on it ' do
    sign_up
    add_new_post
    expect(page).to have_selector(:link_or_button, 'Like')
  end

  scenario 'Can like a post on the main page' do
    sign_up
    add_new_post
    click_on 'Like'
    expect(page).to have_content('Like added')
  end

  scenario 'Can unlike the post if already liked on the main page' do
    sign_up
    add_new_post
    click_on 'Like'
    click_on 'Like'
    expect(page).not_to have_content('Like added')
    expect(page).to have_content('Like removed')
  end

  scenario 'The main page has a like button on it ' do
    sign_up
    add_new_post
    expect(page).to have_selector(:link_or_button, 'Like')
  end

  scenario 'Can like a post from the individual post page' do
    sign_up
    add_new_post
    click_on 'Like'
    expect(page).to have_current_path('/')
    expect(page).to have_content('Like added')
  end

  scenario 'Can unlike a post from the individual post page' do
    sign_up
    add_new_post
    click_on 'Like'
    click_on 'Like'
    expect(page).to have_current_path('/')
    expect(page).to_not have_content('Like added')
    expect(page).to have_content('Like removed')
  end
end
