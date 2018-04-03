require 'rails_helper'

describe 'A user accesses the category path' do
  describe 'by linking from the category#show' do
    it 'can delete a category' do
      cat1 = Category.create!(name: 'Brilliant')
      cat2 = Category.create!(name: 'Weird')

      visit category_path(cat1)

      find('.delete').click

      expect(current_path).to eq(categories_path)
      expect(page).to_not have_content(cat1.name)
      expect(page).to have_content(cat2.name)
    end
  end

  describe 'by linking from the category#index' do
    it 'can delete a category' do
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
end
