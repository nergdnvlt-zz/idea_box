require 'rails_helper'

describe 'A user visits the ideas#new page' do
  describe 'to see a form to create the idea' do
    it 'fills in the info and clicks submit' do
      user1 = User.create!(username: 'Thor', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      Category.create!(name: 'Brilliant')
      Category.create!(name: 'Stupid')
      visit ideas_path

      click_link 'Create a new idea'

      fill_in 'idea[title]', with: 'Whoa'
      fill_in 'idea[body]', with: 'Yay an idea'
      select 'Brilliant', from: 'idea[category_id]'

      click_on 'Submit'

      expect(current_path).to eq(idea_path(Idea.all.last))
    end
  end
end
