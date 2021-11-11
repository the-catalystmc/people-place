require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before(:all) do
    @admin = User.create(name: 'Admin', photo: 'photo',
                         bio: 'I am a software developer.',
                         posts_counter: 0, email: 'admin@admin.com', password: '123456', confirmed_at: Time.now)
    @post = Post.create(title: 'Post 1', text: 'Hey I am a post.',
                        author_id: @admin.id, comments_counter: 0, likes_counter: 0)
    Comment.create(text: 'I am a comment', author_id: @admin.id, post_id: @post.id)
  end

  describe 'Displays' do
    it 'the user\'s profile picture' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      expect(page).to have_selector('img')
    end

    it 'the user\'s username' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      users = User.all
      click_link users[0].name
      expect(page).to have_content(users[0].name)
    end

    it 'the number of posts the user has written' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      users = User.all
      click_link users[0].name
      expect(page).to have_content('1')
    end

    it 'the user\'s bio' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      users = User.all
      click_link users[0].name
      expect(page).to have_content(users[0].bio)
    end

    it 'the user\'s first 3 posts' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      expect(page).to have_content('Post 1')
    end

    it 'a button that lets me view all of a user\'s posts' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      expect(page).to have_content('See all posts')
    end
  end

  describe 'when i click' do
    it 'a user\'s post, it redirects me to that post\'s show page' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link user.posts.last.title
      expect(page).to have_content('Post 1')
    end
  end
end
