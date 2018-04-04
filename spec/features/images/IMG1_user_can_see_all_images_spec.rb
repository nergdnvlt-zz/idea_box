require 'rails_helper'

describe 'An admin visits the images#index page' do
  describe 'to see all the images' do
    it 'shows all the images' do
      user1 = User.create!(username: 'Thor', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      image1 = Image.create!(src: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg', title: 'Andy Mumford')
      image2 = Image.create!(src: 'https://t00.deviantart.net/B9Uj_GJead3Q_-iuk1bpWRG49M4=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/ba15/th/pre/f/2016/151/a/4/magoito_sunset_by_andymumford-da4hzy8.jpg', title: 'Water')
      image3 = Image.create!(src: 'https://t00.deviantart.net/BAubTrhv2LhdqSzofr26LE7bD3c=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/425c/th/pre/f/2010/284/3/8/the_old_man_by_andymumford-d30jtu7.jpg', title: 'Mountain and sea')

      visit images_path

      expect(current_path).to eq(images_path)
      expect(page).to have_css("img[src*='#{image1.src}']")
      expect(page).to have_css("img[src*='#{image2.src}']")
      expect(page).to have_css("img[src*='#{image3.src}']")
    end
  end

  describe 'to see all the images' do
    it 'shows all the images to admin' do
      admin = User.create!(username: 'Thor', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      image1 = Image.create!(src: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg', title: 'Andy Mumford')
      image2 = Image.create!(src: 'https://t00.deviantart.net/B9Uj_GJead3Q_-iuk1bpWRG49M4=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/ba15/th/pre/f/2016/151/a/4/magoito_sunset_by_andymumford-da4hzy8.jpg', title: 'Water')
      image3 = Image.create!(src: 'https://t00.deviantart.net/BAubTrhv2LhdqSzofr26LE7bD3c=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/425c/th/pre/f/2010/284/3/8/the_old_man_by_andymumford-d30jtu7.jpg', title: 'Mountain and sea')

      visit images_path

      expect(current_path).to eq(images_path)
      expect(page).to have_css("img[src*='#{image1.src}']")
      expect(page).to have_css("img[src*='#{image2.src}']")
      expect(page).to have_css("img[src*='#{image3.src}']")
    end
  end
end
