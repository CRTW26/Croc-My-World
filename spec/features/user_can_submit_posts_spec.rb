require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Cannot submit posts that less than 3 character" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hi"
    click_button "Submit"
    text = page.driver.browser.switch_to.alert.text
    expect(text).to eq 'Please use at least 3 characters (you are currently using 2 characters) '
  
    def check_alert(text)     
    page.evaluate_script "window.original_alert_function = window.alert"     
    page.evaluate_script "window.alert = function(msg) { window.lastAlertMsg = msg; }"     
    yield     last_alert_msg = page.evaluate_script "window.lastAlertMsg"     
    last_alert_msg.should == text   ensure     
    page.evaluate_script "window.alert = window.original_alert_function"   
  end
  end
end
