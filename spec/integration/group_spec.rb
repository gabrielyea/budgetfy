require 'rails_helper'

RSpec.describe "groups integration tests", type: :feature do
  before(:each) do
  @user = create(:user)
  visit new_user_session_path
    within('#new_user') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
  end

  it 'should have a new group link' do
    click_link 'New Group'
    expect(page).to have_content('New Group')
  end

  it 'should create a new group' do
    visit new_user_group_path @user
    fill_in 'Name', with: 'test name'
    fill_in 'Icon', with: 'test icon'
    click_button 'Create Group'
    expect(page).to have_content('test name')
  end

  it 'should fail whith empty inputs' do
    visit new_user_group_path @user
    fill_in 'Icon', with: 'test icon'
    click_button 'Create Group'
    expect(page).to have_content("Name can't be blank")
  end
end
