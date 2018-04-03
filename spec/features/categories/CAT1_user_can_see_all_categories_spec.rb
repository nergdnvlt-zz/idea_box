require 'rails_helper'

describe 'A user visits the categories#index page' do
  describe 'to see all the categories' do
    it 'shows all the categories' do
      cat1 = Category.create!(name: 'Brilliant')
      cat2 = Category.create!(name: 'Less Brilliant')
      cat3 = Category.create!(name: 'Stupid')

      visit categories_path

      expect(current_path).to eq(categories_path)
      expect(page).to have_content(cat1.name)
      expect(page).to have_content(cat2.name)
      expect(page).to have_content(cat3.name)
    end
  end

  describe 'to link to individual category by name' do
    it 'shows that category' do
      cat1 = Category.create!(name: 'Brilliant')
      Category.create!(name: 'Less Brilliant')
      Category.create!(name: 'Stupid')

      visit categories_path
      expect(current_path).to eq(categories_path)

      click_link cat1.name

      expect(current_path).to eq(category_path(cat1))
      expect(page).to have_content(cat1.name)
    end
  end
end
