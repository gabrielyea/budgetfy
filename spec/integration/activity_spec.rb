require 'rails_helper'

RSpec.describe "activitites integration tests", type: :feature do
  before(:each) do
  @user = create(:user)
  @group = create(:group, user_id: @user.id)
  visit new_user_session_path
    within('#new_user') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
  end

  it 'should create a new activity' do
    visit new_user_group_activity_path @user, @group
    fill_in 'Name', with: 'test name'
    fill_in 'Amount', with: 123456
    click_button 'CREATE ACTIVITY'
    expect(page).to have_content('test name')
  end

  it 'should fail to create a activity with wrong amount' do
    visit new_user_group_activity_path @user, @group
    fill_in 'Name', with: 'test name'
    fill_in 'Amount', with: 'string'
    click_button 'CREATE ACTIVITY'
    expect(page).to have_content('Amount is not a number')
  end

  it 'should fail to create a activity with no name' do
    visit new_user_group_activity_path @user, @group
    fill_in 'Amount', with: '123'
    click_button 'CREATE ACTIVITY'
    expect(page).to have_content("Name can't be blank")
  end

  it 'should add the correct total amount' do
    visit new_user_group_activity_path @user, @group
    fill_in 'Name', with: 'test name 1'
    fill_in 'Amount', with: '1'
    click_button 'CREATE ACTIVITY'
    visit new_user_group_activity_path @user, @group
    fill_in 'Name', with: 'test name 2'
    fill_in 'Amount', with: '2'
    click_button 'CREATE ACTIVITY'
    expect(page).to have_content('3')
  end
end