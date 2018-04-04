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

CATEGORIES.each do |category, index|
  CATEGORY_IDS.push(Category.create!(name: category))
end

IMAGES.each do |image|
  Image.create!(src: image, title: TITLES.sample)
end

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
