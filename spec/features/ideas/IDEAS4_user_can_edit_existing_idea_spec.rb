require 'rails_helper'

describe 'A user visits the ideas#new page' do
  describe 'to see a form to create the idea' do
    it 'fills in the info and clicks submit' do
      idea = Idea.create!(title: 'First', body: 'Whoo an idea')
      visit idea_path(idea)

      click_link 'Edit Idea'

      fill_in 'idea[title]', with: 'Whoa'
      fill_in 'idea[body]', with: 'Yay an idea'
      click_on 'Submit'

      expect(current_path).to eq(idea_path(Idea.all.last))
      expect(page).to have_content('Whoa')
      expect(page).to have_content('Yay an idea')
      expect(page).to_not have_content(idea.title)
      expect(page).to_not have_content(idea.body)
    end
  end
end
