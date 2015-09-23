When(/^I edit profile$/) do
  click_link "Edit profile"
  fill_in "Email", :with => "buba_sev4@example.com"
  fill_in "Password", :with => "123456789"
  fill_in "Password confirmation", :with => "123456789"
  fill_in "Current password", :with => "12345678"
  click_button "Update"
end

Then(/^I should see the edit profile$/) do
  page.should have_content("Your account has been updated successfully.")
end

When(/^I cancel profile$/) do
  click_link "Edit profile"
  click_button "Cancel my account"
end

Then(/^I should see the cancel confirmation$/) do
  page.should have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
end
