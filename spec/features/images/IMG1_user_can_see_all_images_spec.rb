require 'rails_helper'

describe 'An admin visits the images#index page' do
  describe 'to see all the images' do
    it 'shows all the images' do
      image1 = Image.create!(src: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg')
      image2 = Image.create!(src: 'https://t00.deviantart.net/B9Uj_GJead3Q_-iuk1bpWRG49M4=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/ba15/th/pre/f/2016/151/a/4/magoito_sunset_by_andymumford-da4hzy8.jpg')
      image3 = Image.create!(src: 'https://t00.deviantart.net/BAubTrhv2LhdqSzofr26LE7bD3c=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/425c/th/pre/f/2010/284/3/8/the_old_man_by_andymumford-d30jtu7.jpg')

      visit images_path

      expect(current_path).to eq(images_path)
      expect(page).to have_content(image1.src)
      expect(page).to have_content(image2.src)
      expect(page).to have_content(image3.src)
    end
  end
end
