require 'rails_helper'

RSpec.feature 'Adding & destroying & editing hotels', :type => :feature do
  let!(:user) { FactoryGirl.create :user }

  scenario 'Add hotel' do
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
  end

  scenario 'Edit hotel' do
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

    click_link 'Edit'
    expect(current_path).to eql('/hotels/1/edit')

    fill_in 'Title', with: 'Nice room'
    fill_in 'Room description', with: 'dark room'
    fill_in 'Breakfast', with: 'beer'
    fill_in 'Price', with: '666'
    click_button 'Update'
    expect(current_path).to eql('/hotels/1')

    expect(page).to have_text('Hotel was successfully updated.')
  end

  scenario 'Delete hotel' do
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

    click_link 'Delete'
    expect(current_path).to eql('/hotels')

    expect(page).to have_text('Hotel was successfully deleted.')
  end
end
