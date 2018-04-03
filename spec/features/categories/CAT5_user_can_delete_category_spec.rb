require 'rails_helper'

describe 'A user accesses the category path' do
  describe 'by linking from the category#show' do
    it 'can delete a category' do
      cat1 = Category.create!(name: 'Brilliant')
      Category.create!(name: 'Less Brilliant')

      visit category_path(cat1)

      find('.delete').click

      expect(current_path).to eq(categories_path)
      expect(page).to_not have_content(cat1.name)
    end
  end

  # describe 'by linking from the category#show' do
  #   it 'can delete a category' do
  #     cat1 = Category.create!(name: 'Brilliant')
  #     Category.create!(name: 'Less Brilliant')
  #
  #     visit category_path(cat1)
  #
  #     within(".category-#{cat1.id}") do
  #       find('.edit').click
  #     end
  #
  #     fill_in 'category[name]', with: 'Kowabunga'
  #
  #     click_on 'Submit'
  #
  #     expect(current_path).to eq(category_path(cat1))
  #     expect(page).to have_content('Kowabunga')
  #     expect(page).to_not have_content(cat1.name)
  #   end
  # end
end
