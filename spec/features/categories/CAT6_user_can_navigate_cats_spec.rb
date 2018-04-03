require 'rails_helper'

describe 'A user navigates the site' do
  describe 'they visit the categories#index page' do
    it 'and want to link to an existing category' do
      cat1 = Category.create!(name: 'Brilliant')
      cat2 = Category.create!(name: 'Weird')

      visit categories_path

      click_link cat1.name

      expect(current_path).to eq(category_path(cat1))
      expect(page).to have_content(cat1.name)
      expect(page).to_not have_content(cat2.name)
    end
  end
end
