require 'rails_helper'

RSpec.describe 'Login Page', type: :system do
  before(:all) do
    @admin = User.create(name: 'Admin', photo: 'photo',
                         bio: 'I am a software developer.',
                         posts_counter: 0, email: 'admin@admin.com', password: '123456', confirmed_at: Time.now)
    @post = Post.create(title: 'Post 1', text: 'Hey I am a post.',
                        author_id: @admin.id, comments_counter: 0, likes_counter: 0)
    Comment.create(text: 'I am a comment', author_id: @admin.id, post_id: @post.id)
  end
  describe 'Contains necessary elements' do
    it 'displays the username input.' do
      visit '/users/sign_in'
      expect(page).to have_field('email')
    end

    it 'displays the password input.' do
      visit '/users/sign_in'
      expect(page).to have_field('password')
    end

    it 'displays the Login button.' do
      visit '/users/sign_in'
      expect(page).to have_button('Log in')
    end
  end

  describe 'when I click the Log In button' do
    it 'Throws error when required fields are empty' do
      visit '/users/sign_in'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end

  it 'throws error after filling in the username and the password with incorrect data' do
    visit '/users/sign_in'
    fill_in 'email', with: 'email@email.com'
    fill_in 'password', with: 'email'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'redirects to root after filling in the username and the password with correct data' do
    visit '/users/sign_in'
    fill_in 'email', with: 'admin@admin.com'
    fill_in 'password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end
