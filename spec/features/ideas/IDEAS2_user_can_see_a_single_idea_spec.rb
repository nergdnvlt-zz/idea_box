require 'rails_helper'

describe 'A user visits the ideas#show page' do
  describe 'to see the first idea' do
    it 'shows the idea' do
      user1 = User.create!(username: 'Thor', password: 'test')
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      idea2 = cat1.ideas.create!(title: 'Second', body: 'Yikes another idea', user_id: user1.id)

      visit idea_path(idea1)

      expect(current_path).to eq(idea_path(idea1))
      expect(page).to have_content(idea1.title)
      expect(page).to have_content(idea1.body)
      expect(page).to_not have_content(idea2.title)
      expect(page).to_not have_content(idea2.body)
    end
  end

  describe 'to see another idea' do
    it 'shows a different idea' do
      user1 = User.create!(username: 'Thor', password: 'test')
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      idea2 = cat1.ideas.create!(title: 'Second', body: 'Yikes another idea', user_id: user1.id)
      idea3 = cat1.ideas.create!(title: 'Third', body: 'A third idea!', user_id: user1.id)

      visit idea_path(idea2)

      expect(current_path).to eq(idea_path(idea2))
      expect(page).to have_content(idea2.title)
      expect(page).to have_content(idea2.body)
      expect(page).to_not have_content(idea1.title)
      expect(page).to_not have_content(idea1.body)
      expect(page).to_not have_content(idea3.title)
      expect(page).to_not have_content(idea3.body)
    end
  end

  describe 'to see the images for an idea' do
    it 'has images' do
      user1 = User.create!(username: 'Thor', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      image1 = Image.create!(src: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg', title: 'Andy Mumford')
      idea1.images = [image1]


      visit idea_path(idea1)

      expect(current_path).to eq(idea_path(idea1))
      expect(page).to have_css("img[src*='#{image1.src}']")
    end
  end

  describe 'to see the images for an idea' do
    it 'has images' do
      user1 = User.create!(username: 'Thor', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      image1 = Image.create!(src: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg', title: 'Andy Mumford')
      idea1.images = [image1]


      visit idea_path(idea1)

      expect(current_path).to eq(idea_path(idea1))
      expect(page).to have_css("img[src*='#{image1.src}']")
    end
  end

  describe 'to add another images for an idea' do
    it 'has images' do
      user1 = User.create!(username: 'Thor', password: 'test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: user1.id)
      image1 = Image.create!(src: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg', title: 'Andy Mumford')
      idea1.images = [image1]
      image2 = Image.create!(src: 'https://t00.deviantart.net/B9Uj_GJead3Q_-iuk1bpWRG49M4=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/ba15/th/pre/f/2016/151/a/4/magoito_sunset_by_andymumford-da4hzy8.jpg', title: 'Water')


      visit idea_path(idea1)

      page.check 'Water'
      click_on 'Add Image'

      expect(current_path).to eq(idea_path(idea1))
      expect(page).to have_css("img[src*='#{image2.src}']")
    end
  end
end
