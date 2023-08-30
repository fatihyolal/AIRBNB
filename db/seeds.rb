# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times do
  User.create(email: Faker::Internet.email,
  name: Faker::Name.name,
  phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
  address: Faker::Address.full_address,
  username: Faker::Internet.username,
  is_owner: [true, false].sample
  )

end


20.times do
  Listing.create (address: Faker::Address.with_locale("it") { Faker::Address.full_address },
  price:Faker::Commerce.price,
  average_rating: Faker::Number.between(from: 1, to: 10),
  availability: [true,false].sample,
  boat_description:[]
  capacity:Faker::Number.between(from: 1, to: 10),
  user_id
  )
end

20.times do
  Booking.create (address:Faker::Address.with_locale("it") { Faker::Address.full_address },
  price:Faker::Commerce.price,
  average_rating: Faker::Number.between(from: 1, to: 10),
  availability: [true,false].sample,
  boat_description:
  capacity:Faker::Number.between(from: 1, to: 10),
  user_id
  )
end


20.times do
  Review.create (
  comment: []
  average_rating: Faker::Number.between(from: 1, to: 10),
  availability: [true,false].sample,
  boat_description:
  capacity:Faker::Number.between(from: 1, to: 10),
  user_id
  )
end
