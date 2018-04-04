require 'rails_helper'

describe 'visits show page' do
  describe 'as a user' do
    it 'shows that category' do
      user1 = User.create!(username: 'Thor', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      cat1 = Category.create!(name: 'Brilliant')
      Category.create!(name: 'Less Brilliant')
      Category.create!(name: 'Stupid')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      idea2 = cat1.ideas.create!(title: 'Second', body: 'Yikes another idea', user_id: user1.id)

      visit categories_path
      click_link cat1.name

      expect(current_path).to eq(category_path(cat1))
      expect(page).to have_content(cat1.name)
    end
  end

  describe 'as an admin' do
    it 'shows that category' do
      admin = User.create!(username: 'Thor', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      cat1 = Category.create!(name: 'Brilliant')
      Category.create!(name: 'Less Brilliant')
      Category.create!(name: 'Stupid')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: admin.id)
      idea2 = cat1.ideas.create!(title: 'Second', body: 'Yikes another idea', user_id: admin.id)

      visit categories_path
      expect(current_path).to eq(categories_path)

      click_link cat1.name

      expect(current_path).to eq(category_path(cat1))
      expect(page).to have_content(cat1.name)
    end
  end

  describe 'to see the ideas for that category' do
    it 'shows the ideas' do
      user1 = User.create!(username: 'Thor', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      cat1 = Category.create!(name: 'Brilliant')
      Category.create!(name: 'Less Brilliant')
      Category.create!(name: 'Stupid')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      idea2 = cat1.ideas.create!(title: 'Second', body: 'Yikes another idea', user_id: user1.id)

      visit categories_path

      click_link cat1.name

      expect(current_path).to eq(category_path(cat1))
      expect(page).to have_content(cat1.name)
      expect(page).to have_content(idea1.title)
      expect(page).to have_content(idea1.body)
      expect(page).to have_content(idea2.title)
      expect(page).to have_content(idea2.body)
    end
  end
end
