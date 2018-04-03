require 'rails_helper'

describe 'A user visits the ideas#new page' do
  describe 'to see a form to create the idea' do
    it 'fills in the info and clicks submit' do
      Category.create!(name: 'Brilliant')
      Category.create!(name: 'Stupid')
      visit ideas_path

      click_link 'Create a new idea'

      fill_in 'idea[title]', with: 'Whoa'
      fill_in 'idea[body]', with: 'Yay an idea'
      select 'Brilliant', from: 'idea[category_id]'

      click_on 'Submit'

      expect(page).to have_content('Whoa')
      expect(page).to have_content('Yay an idea')
    end
  end
end
