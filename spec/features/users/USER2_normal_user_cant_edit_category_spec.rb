require 'rails_helper'

describe 'A user visits the categories_path' do
  describe 'but cannot edit a category' do
    it 'denies then access to edit' do
      user = User.create(username: 'odin', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      cat1 = Category.create!(name: 'Brilliant')
      Category.create!(name: 'Less Brilliant')

      visit categories_path

      within(".category-#{cat1.id}") do
        find('.edit').click
      end

      expect(page).to have_content('Not  Authorized')
    end
  end
end
