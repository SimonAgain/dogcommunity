# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating users'

User.destroy_all

o1 = User.create!(
  name:       'Simon',
  user_type:  'owner',
  email:      'simonraj@bigpond.net.au',
  password:   'chicken',
  phone_no:   '0410483122',
  address:    'Hurstville',
  image:      'https://64.media.tumblr.com/f5835a21f78660cb0cc86b5cbcc4f8a5/tumblr_mi6nl3oplR1rm0tofo1_500.jpg'
)
o2 = User.create!(
  name:       'Deano',
  user_type:  'owner',
  email:      'deano@deano.con',
  password:   'chicken',
  phone_no:   '0410483121',
  address:    'North Sydney',
  image:      ''
)

w1 = User.create!(
    name:       'Fiona',
    user_type:  'walker',
    email:      'fiona@fiona.com',
    password:   'chicken',
    phone_no:   '0413020324',
    address:    'Hurstville',
    image:      'https://i.ebayimg.com/images/g/aWoAAOSwubdeAdTi/s-l400.webp'
)

puts "Created #{User.count} users."

puts 'Creating dogs'

Dog.destroy_all

d1 = Dog.create!(
  name:       'Boris',
  breed:      'Cavalier mix'
)
d2 = Dog.create!(
  name:       'Coco',
  breed:      'Golden Retriever'
)

puts "Created #{Dog.count} dogs."

puts 'Creating photos'

Photo.destroy_all

p1 = Photo.create!(
  dog_id: d1.id,
  image:  'http://www.animal-photography.com/AP-1PBTCY-LR-wm.jpg'
)
p2 = Photo.create!(
  dog_id: d1.id,
  image:  'https://usercontent2.hubstatic.com/14615541_f520.jpg'
)

puts "Created #{Photo.count} photos"

#seeding the association of 1 dog to many photos.
d1.photos << p1
d2.photos << p2

#seeding the association dogs and users... Many to many..
d1.users << o1 << w1
d2.users << o2 << w1
