When(/^I add hotel$/) do
  click_link "New Hotel"
  fill_in "Title", :with => "Best room"
  fill_in "Room description", :with => "light room"
  fill_in "Breakfast", :with => "beer"
  fill_in "Price", :with => "666"
  click_button "Create Hotel"
end

Then(/^I should see a hotel create confirmation$/) do
  page.should have_content("Hotel was successfully created.")
end

When(/^I edit hotel$/) do
  click_link "Edit"
  fill_in "Title", :with => "Nice room"
  fill_in "Room description", :with => "dark room"
  fill_in "Breakfast", :with => "beer"
  fill_in "Price", :with => "666"
  click_button "Update"
end

Then(/^I should see a hotel edit confirmation$/) do
  page.should have_content("Hotel was successfully updated.")
end

When(/^I destroy hotel$/) do
  click_link "Delete"
end

Then(/^I should see a hotel destroy confirmation$/) do
  page.should have_content("Hotel was successfully deleted.")
end
