require 'rails_helper'

RSpec.feature "Viewing application's homepage", :type => :feature do
  scenario 'User creates a new widget' do
    visit '/'

    expect(current_path).to eql('/')
    expect(page).to have_text('Hotels')
  end
end
