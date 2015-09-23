When(/^I add comment$/) do
  fill_in "body", :with => "new_comment2"
  click_button "Create Comment"
end

Then(/^I should see a comment create confirmation$/) do
  page.should have_content("Comment was successfully created.")
end
