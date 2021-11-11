require 'rails_helper'

RSpec.describe 'User Index Page', type: :system do
  before(:all) do
    @admin = User.create(name: 'Admin', photo: 'photo',
                         bio: 'I am a software developer.',
                         posts_counter: 0, email: 'admin@admin.com', password: '123456', confirmed_at: Time.now)
    @post = Post.create(title: 'Post 1', text: 'Hey I am a post.',
                        author_id: @admin.id, comments_counter: 0, likes_counter: 0)
    Comment.create(text: 'I am a comment', author_id: @admin.id, post_id: @post.id)
  end

  describe 'Home page shows' do
    it 'username of all other users.' do
      visit '/users/'
      expect(page).to have_content('Admin')
    end

    it 'photos of all other users.' do
      visit '/users/'
      expect(page).to have_selector('img')
    end

    it 'posts counter of all other users.' do
      visit '/users/'
      expect(page).to have_content('1')
    end

    it 'redirects to user show page.' do
      visit '/users/'
      click_on('Admin')
      expect(page).to have_content('Bio')
    end
  end
end
