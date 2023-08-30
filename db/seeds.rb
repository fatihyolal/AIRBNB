# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
  Listing.create!(address:Faker::Address.with_locale("it") { Faker::Address.full_address },
  price:Faker::Commerce.price,
  average_rating: Faker::Number.between(from: 1, to: 10),
  image_url:["https://images.unsplash.com/photo-1569263979104-865ab7cd8d13?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2948&q=80","https://media.cntraveller.com/photos/633411e9d68dee18a8b96eae/16:9/w_2560%2Cc_limit/four%2520seasons%2520yacht-sept22-pr4.jpg","https://majesty.gulfcraftinc.com/hubfs/Majesty%2062%20(redesigned)%20-%20New%20Images%20-%20April%202022/Exteriors/Majesty%2062%20-%20Profile%20(1)-1.jpeg","https://www.luxyachts.com/media/HomePage/Alegre-underway-hero-image.jpg"].sample,
  boat_description:["nice",'very good'].sample,
  capacity:Faker::Number.between(from: 1, to: 10),
  user:User.take,
  title:Faker::Company.name
  #availability: [true,false].sample,
  )
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
