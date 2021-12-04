require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  describe 'login test' do
    before(:all) do
      @user_login = create(:user)
    end

    it 'expects to go to sign-in page' do
      visit new_user_session_path
      expect(page).to have_content('Forgot password?')
      expect(page).to have_content('LOGIN')
    end

    it "expects to show error message 'Invalid Email or password.'" do
      visit new_user_session_path
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'new_user_session_path show a detailed error because wrong information in the form' do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: 'adm@gmail.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end