# require 'rails_helper'

# RSpec.describe "activities/edit", type: :view do
#   before(:all) do
#     @user = create(:user)
#     @activity = create(:activity, author_id: @user.id)
#   end

#   before(:each) do
#     visit new_user_session_path
#     within('#new_user') do
#       fill_in 'Email', with: @user.email
#       fill_in 'Password', with: @user.password
#     end
#     click_button 'Log in'
#     visit user_activity_path(@user, @activity)
#     sleep(1)
#   end

#   it 'should visit add activity form' do
#     # click_button 'Add Ingredient'
#     sleep(1)
#     expect(page).to have_content('New Activity')
#   end
# end
