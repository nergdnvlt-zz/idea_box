require 'rails_helper'

describe 'An user visits the images#show page' do
  describe 'to see one image' do
    it 'shows the images' do
      user1 = User.create!(username: 'Thor', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      image1 = Image.create!(src: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg', title: 'Andy Mumford')

      visit image_path(image1)

      expect(current_path).to eq(image_path(image1))
      expect(page).to have_css("img[src*='#{image1.src}']")
    end
  end

  describe 'to see one image' do
    it 'shows the image for an admin' do
      admin = User.create!(username: 'Thor', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      image1 = Image.create!(src: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg', title: 'Andy Mumford')

      visit image_path(image1)

      expect(current_path).to eq(image_path(image1))
      expect(page).to have_css("img[src*='#{image1.src}']")
    end
  end

  describe 'try to visit the image show page as visitor' do
    it 'redirects to root' do
      image1 = Image.create!(src: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg', title: 'Andy Mumford')

      visit image_path(image1)

      expect(current_path).to eq(error_path)
      expect(page).to have_content('Not Authorized')
    end
  end
end
