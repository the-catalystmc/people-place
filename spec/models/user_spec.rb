require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Tom Rodrick',
                     photo: 'link',
                     bio: "I am just goin to overdo the title for emphasis.\s
                     aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\s
                     sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss!",
                     posts_counter: 0)
    @user.save
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should return not valid with no number value for posts_counter' do
    @user.posts_counter = 'a'
    expect(@user).to_not be_valid
  end

  it 'should return not valid with negative number' do
    @user.posts_counter = -1
    expect(@user).to_not be_valid
  end
end
