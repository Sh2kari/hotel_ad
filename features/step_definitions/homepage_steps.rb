Given(/^I am on the homepage$/) do
  visit("/")
end

Then(/^I should see the hotels page$/) do
  page.should have_content("Hotels")
end
