# Auxiliar Methods
def seed_category(name, description, cover_file)
  new_category = Category.new(name:name, description:description)
  new_category.cover.attach(io: File.open("app/assets/images/categories/#{cover_file}"), filename: cover_file)
  new_category.save
  new_category
end

def seed_photo(category, name, description, image_file)
  new_photo = category.photos.new(name:name, description:description)
  new_photo.image.attach(io: File.open("app/assets/images/photos/#{image_file}"), filename: image_file)
  new_photo.save
  new_photo
end

# Seeding process

puts "Destroying previous data..."

Comment.destroy_all
Photo.destroy_all
Category.destroy_all

puts "Succesfully cleaned database."

puts "Seeding DB..."

# Categories
wallpapers = seed_category("Wallpapers", 
                           "From epic drone shots to inspiring moments in nature, find free HD wallpapers worthy of your screens.", 
                           "wallpapers.png")

nature = seed_category("Nature", 
                       "Let’s celebrate the magic of Mother Earth — with images of everything our planet has to offer.", 
                       "nature.png")

people = seed_category("People", 
                       "Real people, captured. Photography has the power to reflect the world around us, give voice to individuals and groups.", 
                       "people.png")

# Photos

wallpaper_photos = []
nature_photos = []
people_photos = []

w_range = (1..5).to_a
3.times do
  img = w_range.sample
  new_photo = seed_photo(wallpapers,
              Faker::Emotion.noun.capitalize,
              Faker::GreekPhilosophers.quote,
              "#{img}.png")
  wallpaper_photos.push(new_photo)
  w_range.delete(img)
end

n_range = (6..10).to_a
3.times do
  img = n_range.sample
  new_photo = seed_photo(nature,
              Faker::Emotion.noun.capitalize,
              Faker::GreekPhilosophers.quote,
              "#{img}.png")
              nature_photos.push(new_photo)
  n_range.delete(img)
end

p_range = (11..15).to_a
3.times do
  img = p_range.sample
  new_photo = seed_photo(people,
              Faker::FunnyName.name,
              Faker::GreekPhilosophers.quote,
              "#{img}.png")
  people_photos.push(new_photo)
  p_range.delete(img)
end

# Comments
[nature, wallpapers, people].each do |category|
  rand(2..4).times do
    category.comments.create(body: Faker::Quote.famous_last_words)
  end
end

wallpaper_photos.each do |photo|
  rand(2..6).times do
    photo.comments.create(body: Faker::Quote.famous_last_words)
  end
end

nature_photos.each do |photo|
  rand(2..6).times do
    photo.comments.create(body: Faker::Quote.famous_last_words)
  end
end

people_photos.each do |photo|
  rand(2..6).times do
    photo.comments.create(body: Faker::Quote.famous_last_words)
  end
end

puts "Succesfully seeded database."
               