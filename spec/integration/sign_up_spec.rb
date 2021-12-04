require 'rails_helper'

RSpec.describe 'Sign up page', type: :feature do
  describe 'Sign up test' do

    it 'expects to go to sign-up page' do
      visit new_user_registration_path
      expect(page).to have_content('SIGN UP')
      expect(page).to have_content('Log in')
    end

    it 'shoud correctly sign up a new user' do
      @user_login = create(:user)
      visit new_user_registration_path
      fill_in 'Full Name', with: @user_login.name
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: @user_login.password
      fill_in 'Confirm password', with: @user_login.password
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    it 'should not be able to sign up a user with no name' do
      @user_login = create(:user)
      visit new_user_registration_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: @user_login.password
      fill_in 'Confirm password', with: @user_login.password
      click_button 'Sign up'
      expect(page).to have_content("Name can't be blank")
    end

    it 'should not be able to sign up a repeated email' do
      @user_login = create(:user)
      visit new_user_registration_path
      fill_in 'Full Name', with: @user_login.name
      fill_in 'Email', with: @user_login.email
      fill_in 'Password', with: @user_login.password
      fill_in 'Confirm password', with: @user_login.password
      click_button 'Sign up'
      expect(page).to have_content("Email has already been taken")
    end
  end
end