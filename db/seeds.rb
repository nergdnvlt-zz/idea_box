Idea.destroy_all
ImageIdea.destroy_all
Image.destroy_all
Category.destroy_all
User.destroy_all

USERNAMES = %w[Odin Thor Freya Hela Valyrie]
CATEGORIES = %w[Kowabunga Radical Ridiculous]
IMAGES = ['https://orig00.deviantart.net/9221/f/2008/344/a/7/palafitico_by_andymumford.jpg',
          'https://t00.deviantart.net/B9Uj_GJead3Q_-iuk1bpWRG49M4=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/ba15/th/pre/f/2016/151/a/4/magoito_sunset_by_andymumford-da4hzy8.jpg',
          'https://t00.deviantart.net/BAubTrhv2LhdqSzofr26LE7bD3c=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/425c/th/pre/f/2010/284/3/8/the_old_man_by_andymumford-d30jtu7.jpg',
          'https://static1.squarespace.com/static/5852ece3e6f2e1ac624051fb/t/585d981603596eeb5267d25e/1482528797541/miramar2+copy.jpg?format=1500w',
          'https://t00.deviantart.net/kbcP_EOb1nun_dyw7L08h6GrcBw=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/6e40/th/pre/f/2014/279/d/d/altiplano_light_by_andymumford-d81ufew.jpg',
          'http://photodoto.com/wp-content/uploads/2013/08/Andy-Mumford-500x329.jpg']
TITLES = %w[random1 random2 random3]
IDEAS = %w[Unbelievable Rad Rufio Lime Pineapple Kiwi Iphone Mad Neff DC Chopper Bobber MLD 11B]
BODY = ['Love it', 'Flower child', 'Free love', 'Get em', 'Oh yeah']
USERS = []
CATEGORY_IDS = []
# FULL_IDEAS = []

USERNAMES.each_with_index do |username, index|
  USERS.push(index = User.create!(username: username, password: 'test'))
end

admin = User.create(username: 'Joe', password: 'admin', role: 1)

CATEGORIES.each do |category, index|
  CATEGORY_IDS.push(Category.create!(name: category))
end

# IMAGES.each do |image|
#   Image.create!(src: image, title: TITLES.sample)
# end

image1 = Image.create!(src: IMAGES[0], title: TITLES.sample)
image2 = Image.create!(src: IMAGES[1], title: TITLES.sample)
image3 = Image.create!(src: IMAGES[2], title: TITLES.sample)
image4 = Image.create!(src: IMAGES[3], title: TITLES.sample)
image5 = Image.create!(src: IMAGES[4], title: TITLES.sample)
image6 = Image.create!(src: IMAGES[5], title: TITLES.sample)

idea1 = Idea.create!(title: IDEAS[0], body: BODY.sample, category_id: CATEGORY_IDS[0].id, user_id: USERS[0].id)
idea2 = Idea.create!(title: IDEAS[1], body: BODY.sample, category_id: CATEGORY_IDS[1].id, user_id: USERS[1].id)
idea3 = Idea.create!(title: IDEAS[2], body: BODY.sample, category_id: CATEGORY_IDS[2].id, user_id: USERS[2].id)
idea4 = Idea.create!(title: IDEAS[3], body: BODY.sample, category_id: CATEGORY_IDS[0].id, user_id: USERS[3].id)
idea5 = Idea.create!(title: IDEAS[4], body: BODY.sample, category_id: CATEGORY_IDS[1].id, user_id: USERS[4].id)
idea6 = Idea.create!(title: IDEAS[5], body: BODY.sample, category_id: CATEGORY_IDS[2].id, user_id: USERS[0].id)
idea7 = Idea.create!(title: IDEAS[6], body: BODY.sample, category_id: CATEGORY_IDS[0].id, user_id: USERS[1].id)
idea8 = Idea.create!(title: IDEAS[7], body: BODY.sample, category_id: CATEGORY_IDS[1].id, user_id: USERS[2].id)
idea9 = Idea.create!(title: IDEAS[8], body: BODY.sample, category_id: CATEGORY_IDS[2].id, user_id: USERS[3].id)
idea10 = Idea.create!(title: IDEAS[9], body: BODY.sample, category_id: CATEGORY_IDS[0].id, user_id: USERS[4].id)
idea11 = Idea.create!(title: IDEAS[10], body: BODY.sample, category_id: CATEGORY_IDS[1].id, user_id: USERS[0].id)
idea12 = Idea.create!(title: IDEAS[11], body: BODY.sample, category_id: CATEGORY_IDS[2].id, user_id: USERS[1].id)
idea13 = Idea.create!(title: IDEAS[12], body: BODY.sample, category_id: CATEGORY_IDS[0].id, user_id: USERS[2].id)
idea14 = Idea.create!(title: IDEAS[13], body: BODY.sample, category_id: CATEGORY_IDS[1].id, user_id: USERS[3].id)

idea1.images = [image1, image3, image5]
idea1.save
idea2.images = [image2, image4, image6]
idea2.save
idea3.images = [image3, image5, image1]
idea3.save
idea4.images = [image1, image2, image3]
idea4.save
idea5.images = [image4, image5, image6]
idea5.save
idea6.images = [image2, image3, image4]
idea6.save
idea7.images = [image3, image4, image5]
idea7.save
idea8.images = [image4, image5, image6]
idea8.save
idea9.images = [image1, image4, image6]
idea9.save
idea10.images = [image2, image4, image5]
idea10.save
idea11.images = [image1, image3, image5]
idea11.save
idea12.images = [image2, image4, image6]
idea12.save
idea13.images = [image3, image5, image1]
idea13.save
idea14.images = [image1, image2, image3]
idea14.save
