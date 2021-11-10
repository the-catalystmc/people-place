require 'rails_helper'

RSpec.describe 'Login Page', type: :system do
  describe 'Contains necessary elements' do
    it 'displays the username input.' do
      visit '/users/sign_in'
      expect(page).to have_field('email')
    end

    it 'displays the password input.' do
      visit '/users/sign_in'
      expect(page).to have_field('password')
    end

    it 'displays the Login button.' do
      visit '/users/sign_in'
      expect(page).to have_button('Log in')
    end
  end

  describe 'when I click the Log In button' do
    it 'Throws error when required fields are empty' do
      visit '/users/sign_in'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end

  it 'throws error after filling in the username and the password with incorrect data' do
    visit '/users/sign_in'
    fill_in 'email', with: 'email@email.com'
    fill_in 'password', with: 'email'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
