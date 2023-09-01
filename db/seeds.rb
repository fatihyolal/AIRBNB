# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
file = URI.open("https://www.bernard-gallay.com/uploads/yacht/IL%20GATTOPARDO/slide/il_gattopardo_my_amer116s_permaresrl_01.jpg")



puts "users are being created.........."
20.times do
  User.create!(email: Faker::Internet.email,
  name: Faker::Name.name,
  password: "123456",
  phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
  address: Faker::Address.full_address,
  username: Faker::Internet.username,
  is_owner: [true, false].sample
  )
end

puts "listings are being created........."
20.times do
  listing = Listing.new(
    address: ["Moll de La Barceloneta, 1, 08039 Barcelona, Spain", "1 Blaža Jovanovića, Tivat 85320, Montenegro", "Rte de la Piscine, 98000 Monaco"].sample,
    price:Faker::Commerce.price,
    average_rating: Faker::Number.between(from: 1, to: 10),
    boat_description:["Large and modern yacht with all the facilities you could want!",'Top of the range super yacht, everything you could want and more!'].sample,
    capacity:Faker::Number.between(from: 1, to: 10),
    user:User.take,
    title:Faker::Company.name

  )

  images_urls = ["https://www.bernard-gallay.com/uploads/yacht/IL%20GATTOPARDO/slide/il_gattopardo_my_amer116s_permaresrl_01.jpg","https://www.bernard-gallay.com/uploads/yacht/IL%20GATTOPARDO/slide/il_gattopardo_my_amer116s_permaresrl_04.jpg","https://www.bernard-gallay.com/uploads/yacht/IL%20GATTOPARDO/slide/il_gattopardo_my_amer116s_permaresrl_08.jpg", "https://www.bernard-gallay.com/uploads/yacht/IL%20GATTOPARDO/slide/il_gattopardo_my_amer116s_permaresrl_02.jpg"]
  images_urls.each do |image|
    file = URI.open(image)
    listing.photos.attach(io: file, filename: listing.title, content_type: "image/png")
    sleep(1)
  end
  listing.save
end
puts "bookings are being created............"
20.times do
  Booking.create(
  # price:Faker::Commerce.price,
  # average_rating: Faker::Number.between(from: 1, to: 10),
  # availability: [true,false].sample, # needs to be dated
  # capacity:Faker::Number.between(from: 1, to: 10),
  #add total price to bookinf so it can be generated for invoice
  # dari said we can create an invoice inside block of booking not specifically under create if booking is true
  listing: Listing.take,
  is_confirmed:[true,false].sample,
  user: User.take,
  start_date: Date.today,
  end_date: Date.today + 1
  )
end

puts "reviews are being created..........."
20.times do
  Review.create(
    comment:["Hello i loved this boat","Very cheap and great fun cant wait to be back","You guys are the best thanks","Keep it up", "Yacht hub to the world and back hahahaha","i can not wait to actually buy this yacht great service"].sample,
    rating: Faker::Number.between(from: 1, to: 5),
    booking:Booking.take
  )
end
puts "invoices are being created..............."
20.times do
  Invoice.create(
    total_price:["£90","£210","£200","£120","£200","£1000","£600","£800","£260","£130""£520","£420","£320","£2980"].sample,
    booking:Booking.take
  )
end
