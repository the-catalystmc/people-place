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

  describe 'I can see' do
    it 'the profile picture for each user' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_selector('img')
    end

    it 'the user\'s username' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content(user.name)
    end

    it 'the number of posts the user has written' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content('Post 1')
    end

    it 'a post\'s title' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content(user.posts.first.title)
    end

    it 'some of the post\'s body' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content(user.posts.first.text)
      expect(page).to have_content(user.posts.last.text)
    end

    it 'the first comment on a post' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content(user.posts.last.comments.first.text)
    end

    it 'how many comments a post has' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content("Comments: #{user.posts.first.comments_counter}")
    end

    it 'how many likes a post has' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content("Likes: #{user.posts.first.likes_counter}")
    end
  end

  describe 'when i click' do
    it 'on a post, it redirects me to that post\'s show page' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link 'See all posts'
      click_link user.posts.first.title
      expect(page).to have_content('Post 1')
    end
  end
end