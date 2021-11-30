require 'rails_helper'

RSpec.describe "groups/index", type: :feature do
  # before(:all) do

  #   # @activity = create(:activity, author_id: @user.id)
  # end

  before(:each) do
  @user = create(:user)
  visit new_user_session_path
    within('#new_user') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    click_link 'New Group'
  end
  

  it 'should have a new group link' do
    expect(page).to have_content('New Group')
    fill_in 'Name', with: 'test name'
    fill_in 'Icon', with: 'test_icon'
    click_button 'Create Group'
  end
end
