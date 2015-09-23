Given /^I am registered$/ do
  @user = FactoryGirl.create(:user)
end

When(/^I sign up$/) do
  click_link "Sign up"
  fill_in "Email", :with => "bubasev2@bk.ru"
  fill_in "Password", :with => "12345678"
  fill_in "Password confirmation", :with => "12345678"
  click_button "Sign up"
end

Then(/^I should see a sign up confirmation$/) do
  page.should have_content("Welcome! You have signed up successfully.")
end

Then(/^I should be logged in$/) do
  page.should have_content("Edit profile")
  page.should have_content("Logout")
end

When(/^I log in$/) do
  click_link "Log in"
  fill_in "Email", :with => "buba_sev4@example.com"
  fill_in "Password", :with => "12345678"
  click_button "Log in"
end

Then(/^I should see a log in confirmation$/) do
  page.should have_content("Signed in successfully.")
end

When(/^I log out$/) do
  click_link "Logout"
end

Then(/^I should see the log out confirmation$/) do
  page.should have_content("Signed out successfully.")
end
