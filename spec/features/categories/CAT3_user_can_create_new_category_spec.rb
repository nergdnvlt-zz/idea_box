require 'rails_helper'

describe 'A user visits the categories#new page' do
  describe 'by linking from the category#index' do
    it 'can create a new category' do
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
end
