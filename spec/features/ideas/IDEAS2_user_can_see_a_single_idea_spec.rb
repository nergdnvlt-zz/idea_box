require 'rails_helper'

describe 'A user visits the ideas#show page' do
  describe 'to see the first idea' do
    it 'shows the idea' do
      idea1 = Idea.create!(title: 'First', body: 'Whoo an idea')
      idea2 = Idea.create!(title: 'Second', body: 'Yikes another idea')

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
      idea1 = Idea.create!(title: 'First', body: 'Whoo an idea')
      idea2 = Idea.create!(title: 'Second', body: 'Yikes another idea')
      idea3 = Idea.create!(title: 'Third', body: 'A third idea!')

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
