require 'rails_helper'

describe 'A user visits the root_path' do
  describe 'to see a form to sign up' do
    it 'creates account when submits form' do
      visit root_path

      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in 'user[username]', with: 'heavensdownfall'
      fill_in 'user[password]', with: 'test'

      click_on 'Create User'

      expect(page).to have_content('Welcome, funbucket13!')
    end
  end
end
