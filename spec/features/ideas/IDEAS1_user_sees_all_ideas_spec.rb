require 'rails_helper'

describe 'A user visits the ideas#index page' do
  describe 'user wants to see their ideas' do
    it 'shows all the ideas' do
      user1 = User.create!(username: 'Vapes', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      user2 = User.create!(username: 'Heman', password: 'test')
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      idea2 = cat1.ideas.create!(title: 'Second', body: 'Yikes another idea', user_id: user1.id)
      idea3 = cat1.ideas.create!(title: 'Third', body: 'A third idea!', user_id: user2.id)
      idea4 = cat1.ideas.create!(title: 'Forth', body: 'A last idea!', user_id: user2.id)

      visit ideas_path

      expect(current_path).to eq(ideas_path)
      expect(page).to have_content(idea1.title)
      expect(page).to have_content(idea1.body)
      expect(page).to have_content(idea2.title)
      expect(page).to have_content(idea2.body)
      expect(page).to_not have_content(idea3.title)
      expect(page).to_not have_content(idea3.body)
      expect(page).to_not have_content(idea4.title)
      expect(page).to_not have_content(idea4.body)
    end
  end

  describe 'an admin wants to see all ideas' do
    it 'shows all the ideas' do
      admin = User.create!(username: 'Thor', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      user1 = User.create!(username: 'Vapes', password: 'test')
      user2 = User.create!(username: 'Heman', password: 'test')
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      idea2 = cat1.ideas.create!(title: 'Second', body: 'Yikes another idea', user_id: user1.id)
      idea3 = cat1.ideas.create!(title: 'Third', body: 'A third idea!', user_id: user2.id)
      idea4 = cat1.ideas.create!(title: 'Forth', body: 'A last idea!', user_id: user2.id)

      visit ideas_path

      expect(current_path).to eq(ideas_path)
      expect(page).to have_content(idea1.title)
      expect(page).to have_content(idea1.body)
      expect(page).to have_content(idea2.title)
      expect(page).to have_content(idea2.body)
      expect(page).to have_content(idea3.title)
      expect(page).to have_content(idea3.body)
      expect(page).to have_content(idea4.title)
      expect(page).to have_content(idea4.body)
    end
  end
end
