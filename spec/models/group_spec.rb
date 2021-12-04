require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = create(:user)
    @group = create(:group, user_id: @user.id)
  end

  it 'should pass if group has all fields' do
    expect(@group).to be_valid
  end

  it 'should fail if group has invalid name' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'should fail if group has invalid icon' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end

  it 'should pass if user has 2 groups' do
    @group = create(:group, user_id: @user.id)
    expect(@user.groups.count).to be 2
  end
end
