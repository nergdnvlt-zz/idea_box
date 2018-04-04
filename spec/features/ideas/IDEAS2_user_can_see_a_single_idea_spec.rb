require 'rails_helper'

describe 'A user visits the ideas#show page' do
  describe 'to see the first idea' do
    it 'shows the idea' do
      user1 = User.create!(username: 'Thor', password: 'test')
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      idea2 = cat1.ideas.create!(title: 'Second', body: 'Yikes another idea', user_id: user1.id)

      visit idea_path(idea1)

      expect(current_path).to eq(idea_path(idea1))
      expect(page).to have_content(idea1.title)
      expect(page).to have_content(idea1.body)
      expect(page).to_not have_content(idea2.title)
      expect(page).to_not have_content(idea2.body)
    end
  end

  describe 'to see another idea' do
    it 'shows a different idea' do
      user1 = User.create!(username: 'Thor', password: 'test')
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      idea2 = cat1.ideas.create!(title: 'Second', body: 'Yikes another idea', user_id: user1.id)
      idea3 = cat1.ideas.create!(title: 'Third', body: 'A third idea!', user_id: user1.id)

      visit idea_path(idea2)

      expect(current_path).to eq(idea_path(idea2))
      expect(page).to have_content(idea2.title)
      expect(page).to have_content(idea2.body)
      expect(page).to_not have_content(idea1.title)
      expect(page).to_not have_content(idea1.body)
      expect(page).to_not have_content(idea3.title)
      expect(page).to_not have_content(idea3.body)
    end
  end
end
