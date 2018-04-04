require 'rails_helper'

describe 'A user accesses the category path' do
  describe 'and an admin' do
    it 'can delete a category' do
      admin = User.create!(username: 'Thor', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      cat1 = Category.create!(name: 'Brilliant')
      cat2 = Category.create!(name: 'Weird')

      visit category_path(cat1)

      find('.delete').click

      expect(current_path).to eq(categories_path)
      expect(page).to_not have_content(cat1.name)
      expect(page).to have_content(cat2.name)
    end
  end

  describe 'by linking from the category#index an admin' do
    it 'can delete a category' do
      admin = User.create!(username: 'Thor', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      cat1 = Category.create!(name: 'Brilliant')
      cat2 = Category.create!(name: 'So weird')

      visit categories_path

      within(".category-#{cat1.id}") do
        find('.delete').click
      end

      expect(current_path).to eq(categories_path)
      expect(page).to_not have_content(cat1.name)
      expect(page).to have_content(cat2.name)
    end
  end


    describe 'a user cannot delete a category' do
      it 'they get redirected' do
        user = User.create!(username: 'Thor', password: 'test')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        cat1 = Category.create!(name: 'Brilliant')
        cat2 = Category.create!(name: 'So weird')

        visit categories_path

        within(".category-#{cat1.id}") do
          find('.delete').click
        end

        expect(current_path).to eq(root_path)
        expect(page).to have_content('Not Authorized')
      end
    end
end
