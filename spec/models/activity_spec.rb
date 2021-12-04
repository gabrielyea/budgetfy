require 'rails_helper'

RSpec.describe Activity, type: :model do
  before(:each) do
    @user = create(:user)
    @group = create(:group, user_id: @user.id)
    @activity = create(:activity, author_id: @user.id)
    @group.activities << @activity
  end

  it 'should be a valid activity' do
    expect(@activity).to be_valid
  end

  it 'should pass if group has 1 activity' do
    expect(@group.activities.count).to be 1
  end

  it 'should fail against incorrect count of activity' do
    expect(@group.activities.count).to_not be 2
  end

  it 'should fail if activity does not has a name' do
    @activity.name = nil
    expect(@activity).to_not be_valid
  end

  it 'should fail if activity does not has an amount' do
    @activity.amount = nil
    expect(@activity).to_not be_valid
  end

  it 'should pass if amounts are adding correctly' do
    @activity2 = create(:activity, author_id: @user.id)
    @activity2.amount = 6
    @group.activities << @activity2
    @activity3 = create(:activity, author_id: @user.id)
    @activity3.amount = 5
    @group.activities << @activity3
    @activity.amount = 1
    expect(@group.total_group_cost.to_int).to be 12
  end

  it 'should fail if amounts tested against incorrect value' do
    @activity2 = create(:activity, author_id: @user.id)
    @activity2.amount = 6
    @group.activities << @activity2
    @activity3 = create(:activity, author_id: @user.id)
    @activity3.amount = 5
    @group.activities << @activity3
    @activity.amount = 1
    expect(@group.total_group_cost.to_int).to_not be 13
  end
end
