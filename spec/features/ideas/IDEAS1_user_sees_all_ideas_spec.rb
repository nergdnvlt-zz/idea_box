require 'rails_helper'

describe 'A user visits the ideas#index page' do
  describe 'to see all the ideas' do
    it 'shows all the ideas' do
      user1 = User.create!(username: 'Thor', password: 'test')
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      idea2 = cat1.ideas.create!(title: 'Second', body: 'Yikes another idea', user_id: user1.id)
      idea3 = cat1.ideas.create!(title: 'Third', body: 'A third idea!', user_id: user1.id)

      visit ideas_path

      expect(current_path).to eq(ideas_path)
      expect(page).to have_content(idea1.title)
      expect(page).to have_content(idea1.body)
      expect(page).to have_content(idea2.title)
      expect(page).to have_content(idea2.body)
      expect(page).to have_content(idea3.title)
      expect(page).to have_content(idea3.body)
    end
  end
end
