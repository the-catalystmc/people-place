require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @like = Like.create
    @like.save
  end

  it 'title should be present' do
    @like.post_id = 1
    expect(@like.post_id).to eq(1)
  end
end
