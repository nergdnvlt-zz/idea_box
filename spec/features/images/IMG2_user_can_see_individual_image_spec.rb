require 'rails_helper'

describe 'An user visits the images#show page' do
  describe 'to see one image' do
    it 'shows the images' do
      image1 = Image.create!(src: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg', title: 'Andy Mumford')

      visit image_path(image1)

      expect(current_path).to eq(image_path(image1))
      expect(page).to have_css("img[src*='#{image1.src}']")
    end
  end
end
