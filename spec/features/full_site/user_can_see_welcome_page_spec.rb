require 'rails_helper'

describe 'user visits root' do
  describe 'it has a home page' do
    it 'has a welcome message' do
      visit '/'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Welcome to Idea Box')
    end
  end
end
