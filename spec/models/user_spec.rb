require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Tom Rodrick',
                     photo: 'link',
                     bio: 'I am just goin to overdo the title for emphasis.\s
                     aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\s
                     sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss!',
                     posts_counter: 0)
    @user.save
    @post = Post.new(title: 'Post 1', text: 'This is a post', author_id: 1)
    @post.save
  end

  it 'should be equal to zero if there are no recent posts' do
    recent = @user.recent_posts
    expect(recent.length).to eq(0)
  end

  it 'should be equal to zero if there are no three recent posts' do
    recent = @user.three_recent_posts
    expect(recent.length).to eq(0)
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
