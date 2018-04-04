require 'rails_helper'

describe 'A user navigates the site' do
  describe 'as an admin they visit the categories#index page' do
    it 'and want to link to an existing category' do
      admin = User.create!(username: 'Thor', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      cat1 = Category.create!(name: 'Brilliant')
      cat2 = Category.create!(name: 'Weird')

      visit categories_path

      click_link cat1.name

      expect(current_path).to eq(category_path(cat1))
      expect(page).to have_content(cat1.name)
      expect(page).to_not have_content(cat2.name)
    end
  end

  describe 'as a user they visit the categories#index page' do
    it 'and want to link to an existing category' do
      user = User.create!(username: 'Thor', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      cat1 = Category.create!(name: 'Brilliant')
      cat2 = Category.create!(name: 'Weird')

      visit categories_path

      click_link cat1.name

      expect(current_path).to eq(category_path(cat1))
      expect(page).to have_content(cat1.name)
      expect(page).to_not have_content(cat2.name)
    end
  end

  describe 'as a visitor they try visit the categories#index page' do
    it ' and get redirected' do
      cat1 = Category.create!(name: 'Brilliant')
      cat2 = Category.create!(name: 'Weird')

      visit categories_path

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Not Authorized')
    end
  end
end
