require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end

  it 'should pass if name and email are present' do
    expect(@user).to be_valid
  end

  it 'shoud fail if name is not present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'shoud fail if email is not present' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'should fail if password is less than 6 characters' do
    @user.password = '1234'
    expect(@user).to_not be_valid
  end
end