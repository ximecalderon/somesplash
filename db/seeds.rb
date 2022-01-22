puts "Destroying previous data"

Comment.destroy_all
Photo.destroy_all
Category.destroy_all

puts "Seeding DB"

wallpapers = Category.create(name: "Wallpapers", 
             description: "From epic drone shots to inspiring moments in nature, find free HD wallpapers worthy of your screens.")
             wallpapers.cover.attach(io: File.open("app/assets/images/categories/wallpapers.png"), filename: "wall_cover")

nature = Category.create(name: "Nature", 
             description: "Let’s celebrate the magic of Mother Earth — with images of everything our planet has to offer.")
             nature.cover.attach(io: File.open("app/assets/images/categories/nature.png"), filename: "nature_cover")

people = Category.create(name: "People", 
             description: "Real people, captured. Photography has the power to reflect the world around us, give voice to individuals and groups.")
             people.cover.attach(io: File.open("app/assets/images/categories/people.png"), filename: "people_cover")

purple_lake = nature.photos.create(name: "Purple Lake", 
              description: "Nice and big purple lake.")
              purple_lake.image.attach(io: File.open("app/assets/images/photos/purple_lake.png"), filename: "purple_lake")

green_plant = nature.photos.create(name: "Green Plant", 
              description: "Nice and little green plant.")
              green_plant.image.attach(io: File.open("app/assets/images/photos/green_plant.png"), filename: "green_plant")

lonely_bird = nature.photos.create(name: "Lonely Bird", 
              description: "Nice and lonely flying bird.")
              lonely_bird.image.attach(io: File.open("app/assets/images/photos/lonely_bird.png"), filename: "lonely_bird")

purple_lake.comments.create(body: "Lorem ipsum Dolor.")

nature.comments.create(body: "Lorem ipsum Dolor.")
                