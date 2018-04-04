require 'rails_helper'

describe 'user visits root' do
  before(:each) do
    @user1 = User.create!(username: 'Thor', password: 'test')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    @cat1 = Category.create!(name: 'Brilliant')
    @idea1 = @cat1.ideas.create!(title: 'First', body: 'Whoo an idea', user_id: @user1.id)
    @idea2 = @cat1.ideas.create!(title: 'Second', body: 'Yikes another idea', user_id: @user1.id)
    @idea3 = @cat1.ideas.create!(title: 'Third', body: 'A third idea!', user_id: @user1.id)
    @image1 = Image.create!(src: 'https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg', title: 'Andy Mumford')
    @image2 = Image.create!(src: 'https://t00.deviantart.net/B9Uj_GJead3Q_-iuk1bpWRG49M4=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/ba15/th/pre/f/2016/151/a/4/magoito_sunset_by_andymumford-da4hzy8.jpg', title: 'Water')
    @image3 = Image.create!(src: 'https://t00.deviantart.net/BAubTrhv2LhdqSzofr26LE7bD3c=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/425c/th/pre/f/2010/284/3/8/the_old_man_by_andymumford-d30jtu7.jpg', title: 'Mountain and sea')
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  describe 'to link to categories' do
    it 'they see all the categories' do
      visit root_path

      click_link 'Categories'

      expect(current_path).to eq(categories_path)
      expect(page).to have_content(@cat1.name)
    end
  end

  describe 'to link back to home page' do
    it 'from Categories' do
      visit categories_path

      click_link "#{@user1.username}'s Page"

      expect(current_path).to eq(ideas_path)
      expect(page).to have_content('Ideas!')
    end
  end

  describe 'to return to sign in page' do
    it 'from anywhere clicks sign out' do
      visit ideas_path

      click_link 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Welcome to Idea Box')
    end
  end
end
