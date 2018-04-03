require 'rails_helper'

describe 'A user visits the categories#edit page' do
  describe 'by linking from the category#index' do
    it 'can edit an existing category' do
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
end
