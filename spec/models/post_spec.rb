require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Tom Rodrick',
                        photo: 'link',
                        bio: "I am a footballer",
                        posts_counter: 0)
    @post = Post.new(title: 'Post 1', text: 'Text', author_id: @user.id, comments_counter: 0, likes_counter: 0)
    @post.save
  end

  it 'title should be present' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'should be not valid when title to long' do
    @post.title = "I am just goin to overdo the title for emphasis.\s
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\s
    sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss.
    I am just goin to overdo the title for emphasis.\s
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\s
    sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss.
    "
    expect(@post).to_not be_valid
  end

  it 'should be not valid when comments_counter not number' do
    @post.comments_counter = 'a'
    expect(@post).to_not be_valid
  end

  it 'should be not valid when comments_counter negative' do
    @post.comments_counter = -1
    expect(@post).to_not be_valid
  end

  it 'should be not valid when likes_counter not number' do
    @post.likes_counter = 'a'
    expect(@post).to_not be_valid
  end

  it 'should be not valid when likes_counter negative' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end
end
