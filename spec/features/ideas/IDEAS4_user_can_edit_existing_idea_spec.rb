require 'rails_helper'

describe 'A user wants to edit an idea' do
  describe 'so they visit the ideas#show page' do
    it 'and fill in the info and clicks submit' do
      user1 = User.create!(username: 'Thor', password: 'test')
      cat1 = Category.create!(name: 'Brilliant')
      idea = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      visit idea_path(idea)

      find('.edit').click

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

  describe 'so they visit the ideas#index' do
    it 'fills in the info and clicks submit' do
      user1 = User.create!(username: 'Thor', password: 'test')
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'Uno', body: 'What an idea', user_id: user1.id)
      cat1.ideas.create!(title: 'Dos', body: 'Titanic', user_id: user1.id)
      cat1.ideas.create!(title: 'Tres', body: 'bob thunder', user_id: user1.id)

      visit ideas_path

      within(".idea-#{idea1.id}") do
        find('.edit').click
      end

      fill_in 'idea[title]', with: 'Whoa'
      fill_in 'idea[body]', with: 'Yay an idea'
      click_on 'Submit'

      expect(current_path).to eq(idea_path(idea1))
      expect(page).to have_content('Whoa')
      expect(page).to have_content('Yay an idea')
      expect(page).to_not have_content(idea1.title)
      expect(page).to_not have_content(idea1.body)
    end
  end
end
