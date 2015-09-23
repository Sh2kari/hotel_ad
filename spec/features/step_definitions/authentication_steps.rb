require 'rails_helper'

RSpec.feature 'Authenticatig users', :type => :feature do
  let!(:user) { FactoryGirl.create :user }

  scenario 'Signing up' do
    visit '/'

    click_link 'Sign up'
    expect(current_path).to eql('/users/sign_up')

    fill_in 'Email', with: 'bubasev2@bk.ru'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'

    expect(current_path).to eql('/')
    expect(page).to have_text('Welcome! You have signed up successfully.')
    expect(page).to have_text('Edit profile')
    expect(page).to have_text('Logout')
  end

  scenario 'Log in' do
    visit '/'

    click_link 'Log in'
    expect(current_path).to eql('/users/login')

    fill_in 'Email', with: 'buba_sev4@example.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in'

    expect(current_path).to eql('/')
    expect(page).to have_text('Signed in successfully.')
  end

  scenario 'Log out' do
    visit '/'

    click_link 'Log in'
    expect(current_path).to eql('/users/login')

    fill_in 'Email', with: 'buba_sev4@example.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
    click_link 'Logout'

    expect(current_path).to eql('/')
    expect(page).to have_text('Signed out successfully.')
  end
end
