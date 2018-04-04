require 'rails_helper'

describe 'An user visits the images#new page' do
  describe 'to fill out image form' do
    it 'creates the image' do
      visit new_image_path

      fill_in 'image[src]', with: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg'
      fill_in 'image[title]', with: 'Andy Mumford'
      click_on 'Submit'

      expect(page).to have_css("img[src*='#{image1.src}']")
    end
  end
end
