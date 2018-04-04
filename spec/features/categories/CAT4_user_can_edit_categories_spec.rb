require 'rails_helper'

describe 'A user visits the categories#edit page' do
  describe 'by linking from the categories#index' do
    it 'can edit an existing category' do
      admin = User.create(username: 'odin', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      cat1 = Category.create!(name: 'Brilliant')
      Category.create!(name: 'Less Brilliant')

      visit categories_path

      within(".category-#{cat1.id}") do
        find('.edit').click
      end

      fill_in 'category[name]', with: 'Kowabunga'

      click_on 'Submit'

      expect(current_path).to eq(category_path(cat1))
      expect(page).to have_content('Kowabunga')
      expect(page).to_not have_content(cat1.name)
    end
  end

  describe 'by linking from the category#show' do
    it 'can edit an existing category' do
      admin = User.create(username: 'odin', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      cat1 = Category.create!(name: 'Brilliant')
      Category.create!(name: 'Super Strange')

      visit categories_path
      click_link 'Brilliant'
      find('.edit').click

      fill_in 'category[name]', with: 'Kowabunga'
      click_on 'Submit'

      expect(current_path).to eq(category_path(cat1))
      expect(page).to have_content('Kowabunga')
      expect(page).to_not have_content(cat1.name)
    end
  end

  describe 'a non-admin cannot edit category' do
    it 'they are directed' do
      user = User.create(username: 'odin', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      cat1 = Category.create!(name: 'Brilliant')
      Category.create!(name: 'Super Strange')

      visit categories_path
      click_link 'Brilliant'
      find('.edit').click

      expect(current_path).to eq(ideas_path)
      expect(page).to have_content('Not Authorized')
    end
  end
end
