require 'rails_helper'

RSpec.describe "groups integration tests", type: :feature do
  before(:each) do
  @user = create(:user)
  @group = create(:group, user_id: @user.id)
  # @group.user_id = @user.id

  visit new_user_session_path
    within('#new_user') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
  end

  it 'should go to main category page' do
    visit user_groups_path @user
    expect(page).to have_content('CATEGORIES')
  end

  it 'should go to new category page' do
    visit user_groups_path @user
    click_button 'ADD CATEGORY'
    expect(page).to have_content('NEW CATEGORY')
  end

  it 'should create a new category' do
    visit new_user_group_path @user
    fill_in 'Category name', with: @group.name
    fill_in 'Icon url', with: @group.icon
    click_button 'CREATE GROUP'
    expect(page).to have_content("Group was successfully created.")
  end

  it 'should fail to create a new category' do
    visit new_user_group_path @user
    fill_in 'Category name', with: @group.name
    click_button 'CREATE GROUP'
    expect(page).to have_content("Icon can't be blank")
  end
end
