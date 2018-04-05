require 'rails_helper'

describe 'An admin can visit the images#new page' do
  describe 'to fill out image form' do
    it 'creates the image' do
      admin = User.create!(username: 'Thor', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_image_path

      fill_in 'image[src]', with: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg'
      fill_in 'image[title]', with: 'Andy Mumford'
      click_on 'Submit'

      expect(page).to have_css("img[src*='https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg']")
    end
  end

  describe 'but a user cannot' do
    it 'create the image' do
      user = User.create!(username: 'Thor', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_image_path

      expect(current_path).to eq(error_path)
      expect(page).to have_content('Not Authorized')
    end
  end

  describe 'and a visitor cannot' do
    it 'create the image' do
      visit new_image_path

      expect(current_path).to eq(error_path)
      expect(page).to have_content('Not Authorized')
    end
  end
end
