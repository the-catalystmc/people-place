require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  before(:all) do
    @admin = User.create(name: 'Admin', photo: 'photo',
                         bio: 'I am a software developer.',
                         posts_counter: 0, email: 'admin@admin.com', password: '123456', confirmed_at: Time.now)
    @post = Post.create(title: 'Post 1', text: 'Hey I am a post.',
                        author_id: @admin.id, comments_counter: 0, likes_counter: 0)
    Comment.create(text: 'I am a comment', author_id: @admin.id, post_id: @post.id)
  end

  describe 'I can see' do
    it 'the post\'s title' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link user.posts.last.title
      expect(page).to have_content(user.posts.last.title)
    end

    it 'who wrote the post' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link user.posts.last.title
      expect(page).to have_content(user.name)
    end

    it 'how many comments it has' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link user.posts.last.title
      expect(page).to have_content("Comments: #{user.posts.last.comments_counter}")
    end

    it 'how many likes it has' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link user.posts.last.title
      expect(page).to have_content("Likes: #{user.posts.last.likes_counter}")
      click_button 'Like'
      expect(page).to have_content("Likes: #{user.posts.last.likes_counter}")
    end

    it 'the post body' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link user.posts.last.title
      expect(page).to have_content(user.posts.last.text)
    end

    it 'the username of each commentor' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link user.posts.last.title
      user.posts.last.comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end

    it 'the comment each commentor left' do
      visit new_user_session_path
      fill_in 'email', with: 'admin@admin.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      user = User.find_by(name: 'Admin')
      click_link user.name
      click_link user.posts.last.title
      user.posts.last.comments.each do |comment|
        expect(page).to have_content("#{comment.author.name}: #{comment.text}")
      end
    end
  end
end
