Restaurant.destroy_all

puts "start seed"
10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    category: Restaurant::CATEGORIES.sample,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number
  )
  restaurant.save!
end
puts "10 restaurant has been generated"
