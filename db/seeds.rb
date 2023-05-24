require "faker"
Faker::Config.locale = 'fr'

puts "Clearing database..."
Restaurant.destroy_all
puts "Database cleared"

# Generate restaurants
10.times do
  new_restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: Restaurant::CATEGORIES.sample
  )
  new_restaurant.save

  # Generate reviews
  review_count = (5 * rand).ceil
  review_count.times do
    new_review = Review.new(
      rating: [1, 2, 3, 4, 5].sample,
      content: Faker::Restaurant.review,
      restaurant: new_restaurant
    )
    new_review.save
  end
  puts "Restaurant #{new_restaurant.name} added to the database, with #{review_count} reviews"
end

puts "#{Restaurant.count} restaurants seeded"
