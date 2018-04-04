require 'rails_helper'

describe 'A user visits the root_path' do
  describe 'to see a link to sign up' do
    it 'creates account when submits form' do
      visit root_path

      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in 'user[username]', with: 'heavensdownfall'
      fill_in 'user[password]', with: 'test'

      click_on 'Create Account'

      expect(page).to have_content('Welcome, heavensdownfall!')
    end
  end

  describe 'to see a link to log in' do
    it 'accesses account with form' do
      user = User.create(username: 'odin', password: 'test')

      visit root_path

      click_on 'Log In'

      expect(current_path).to eq(login_path)
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password

      click_on 'Log In'

      expect(current_path).to eq(user_path(user))

      expect(page).to have_content("Welcome, #{user.username}")
      expect(page).to have_content('Log Out')
    end
  end

  describe 'to see a link to log in' do
    it 'accesses account with form' do
      user = User.create(username: 'odin', password: 'test')

      visit root_path

      click_on 'Log In'
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
      click_on 'Log In'

      click_link 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Welcome to Idea Box')
    end
  end
end
