require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @comment = Comment.create(text: 'I am a footballer')
    @comment.save
  end

  it 'title should be present' do
    @comment.text = nil
    expect(@comment).to_not be_valid
  end
end
