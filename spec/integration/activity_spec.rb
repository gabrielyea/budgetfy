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
    click_button 'Create Activity'
    expect(page).to have_content('test name')
  end

  it 'should fail to create a activity with wrong amount' do
    visit new_user_group_activity_path @user, @group
    fill_in 'Name', with: 'test name'
    fill_in 'Amount', with: 'string'
    click_button 'Create Activity'
    expect(page).to have_content('Amount is not a number')
  end
end