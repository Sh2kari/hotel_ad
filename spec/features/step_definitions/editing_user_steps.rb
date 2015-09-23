require 'rails_helper'

RSpec.feature 'Editind and deleting users', :type => :feature do
  let!(:user) { FactoryGirl.create :user }

  scenario 'Edit profile' do
    visit '/'

    click_link 'Log in'
    expect(current_path).to eql('/users/login')

    fill_in 'Email', with: 'buba_sev4@example.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
    expect(current_path).to eql('/')

    click_link 'Edit profile'
    expect(current_path).to eql('/users/edit')

    fill_in 'Email', with: 'buba_sev4@example.com'
    fill_in 'Password', with: '123456789'
    fill_in 'Password confirmation', with: '123456789'
    fill_in 'Current password', with: '12345678'
    click_button 'Update'
    expect(current_path).to eql('/')

    expect(page).to have_text('Your account has been updated successfully.')
  end

  scenario 'Delete profile' do
    visit '/'

    click_link 'Log in'
    expect(current_path).to eql('/users/login')

    fill_in 'Email', with: 'buba_sev4@example.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
    expect(current_path).to eql('/')

    click_link 'Edit profile'
    expect(current_path).to eql('/users/edit')

    click_button 'Cancel my account'
    expect(current_path).to eql('/')

    expect(page).to have_text('Bye! Your account has been successfully cancelled.
                             We hope to see you again soon.')
  end
end
