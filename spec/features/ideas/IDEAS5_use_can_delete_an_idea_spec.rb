require 'rails_helper'

describe 'A user wants to deleta an idea' do
  describe 'they visit the idea#show page' do
    it 'they click the delete link to delete the idea' do
      idea1 = Idea.create!(title: 'Uno', body: 'What an idea')
      idea2 = Idea.create!(title: 'Dos', body: 'Titanic')
      idea3 = Idea.create!(title: 'Tres', body: 'bob thunder')

      visit idea_path(idea1)

      click_link 'Delete'

      expect(current_path).to eq(ideas_path)
      expect(page).to_not have_content(idea1.title)
      expect(page).to_not have_content(idea1.body)
      expect(page).to have_content(idea2.title)
      expect(page).to have_content(idea2.body)
      expect(page).to have_content(idea3.title)
      expect(page).to have_content(idea3.body)
    end
  end

  describe 'they visit the idea#index page' do
    it 'they click the delete link to delete the idea' do
      idea1 = Idea.create!(title: 'Uno', body: 'What an idea')
      idea2 = Idea.create!(title: 'Dos', body: 'Titanic')
      idea3 = Idea.create!(title: 'Tres', body: 'bob thunder')

      visit ideas_path

      within(".idea-#{idea1.id}") do
        find('.delete').click
      end

      expect(current_path).to eq(ideas_path)
      expect(page).to_not have_content(idea1.title)
      expect(page).to_not have_content(idea1.body)
      expect(page).to have_content(idea2.title)
      expect(page).to have_content(idea2.body)
      expect(page).to have_content(idea3.title)
      expect(page).to have_content(idea3.body)
    end
  end
end
