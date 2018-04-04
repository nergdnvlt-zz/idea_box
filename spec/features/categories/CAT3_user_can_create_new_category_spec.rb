require 'rails_helper'

describe 'A user visits the categories#new page' do
  describe 'as an admin can create new category' do
    it 'can create a new category' do
      admin = User.create!(username: 'Thor', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      Category.create!(name: 'Brilliant')
      Category.create!(name: 'Less Brilliant')

      visit categories_path

      click_link 'Create New Category'

      fill_in 'category[name]', with: 'Radical'

      click_on 'Submit'

      expect(current_path).to eq(category_path(Category.all.last))
      expect(page).to have_content('Radical')
    end
  end

  describe 'by linking from the category#index' do
    it 'as an user cannot create new category' do
      user = User.create!(username: 'Thor', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      Category.create!(name: 'Brilliant')
      Category.create!(name: 'Less Brilliant')

      visit categories_path

      click_link 'Create New Category'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Not Authorized')
    end
  end
end
