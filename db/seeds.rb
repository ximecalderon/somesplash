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

wallpapers = seed_category("Wallpapers", 
                           "From epic drone shots to inspiring moments in nature, find free HD wallpapers worthy of your screens.", 
                           "wallpapers.png")

nature = seed_category("Nature", 
                       "Let’s celebrate the magic of Mother Earth — with images of everything our planet has to offer.", 
                       "nature.png")

people = seed_category("People", 
                       "Real people, captured. Photography has the power to reflect the world around us, give voice to individuals and groups.", 
                       "people.png")

purple_lake = seed_photo(nature,
                         "Purple Lake",
                         "Nice and big purple lake.",
                         "purple_lake.png")

green_plant = seed_photo(nature,
                         "Green Plant",
                         "Nice and little green plant.",
                         "green_plant.png")

lonely_bird = seed_photo(nature,
                         "Lonely Bird",
                         "Nice and lonely flying bird.",
                         "lonely_bird.png")

nature.comments.create(body: "Lorem ipsum Dolor.")

purple_lake.comments.create(body: "Lorem ipsum Dolor.")

puts "Succesfully seeded database."
               