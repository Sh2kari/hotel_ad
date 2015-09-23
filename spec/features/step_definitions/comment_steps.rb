require 'rails_helper'

RSpec.feature 'Adding & destroying comments', :type => :feature do
  let!(:user) { FactoryGirl.create :user }

  scenario 'Add comment' do
    visit '/'

    click_link 'Log in'
    expect(current_path).to eql('/users/login')

    fill_in 'Email', with: 'buba_sev4@example.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
    expect(current_path).to eql('/')

    click_link 'New Hotel'
    expect(current_path).to eql('/hotels/new')

    fill_in 'Title', with: 'Best room'
    fill_in 'Room description', with: 'light room'
    fill_in 'Breakfast', with: 'beer'
    fill_in 'Price', with: '666'
    click_button 'Create Hotel'
    expect(current_path).to eql('/hotels/1')

    expect(page).to have_text('Hotel was successfully created.')

    fill_in "comment_body", :with => "new_comment2"
    click_button "Create Comment"
    expect(current_path).to eql('/hotels/1')

    expect(page).to have_text('Comment was successfully created.')
  end

  scenario 'Destroy comment' do
    visit '/'

    click_link 'Log in'
    expect(current_path).to eql('/users/login')

    fill_in 'Email', with: 'buba_sev4@example.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
    expect(current_path).to eql('/')

    click_link 'New Hotel'
    expect(current_path).to eql('/hotels/new')

    fill_in 'Title', with: 'Best room'
    fill_in 'Room description', with: 'light room'
    fill_in 'Breakfast', with: 'beer'
    fill_in 'Price', with: '666'
    click_button 'Create Hotel'
    expect(current_path).to eql('/hotels/1')

    expect(page).to have_text('Hotel was successfully created.')

    fill_in 'comment_body', with: 'new_comment2'
    click_button 'Create Comment'
    expect(current_path).to eql('/hotels/1')

    expect(page).to have_text('Comment was successfully created.')

    click_link 'delete'
    expect(current_path).to eql('/hotels/1')

    expect(page).to have_text('Comment was successfully deleted.')
  end
end
