require 'rails_helper'

describe 'A user visits the ideas#index page' do
  describe 'to see all the ideas' do
    it 'shows all the ideas' do
      idea1 = Idea.new(title: 'First', body: 'Whoo an idea')
      idea2 = Idea.new(title: 'Second', body: 'Yikes another idea')
      idea3 = Idea.new(title: 'Third', body: 'A third idea!')

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
