require_relative 'data/data'
# Cleanup - Order is important!
Product.destroy_all
User.destroy_all


puts "seeding users"
# user_admin = User.create(email: 'admin@fruit.com', password: 'farmerno1', admin: true)
user_one = User.create(email: 'test-user1@fruit.com', password: 'password', user_type: "farmer")
user_two = User.create(email: 'test-user2@fruit.com', password: 'password', user_type: "farmer")
user_three = User.create(email: 'test-user3@fruit.com', password: 'password', user_type: "normal")

admin1 = User.create(email: 'admin@fruit.com', password: 'password', user_type: "normal", admin: true)
puts "successfully seeded users ✅"

puts "seeding farmers"
farmers_records = []
farmers.each do |item|
  # item[:user_id] = user_one.id
  farmers_records << Farmer.create(item)
end
puts "successfully seeded farmers ✅"


puts "seeding products"
products.each do |item|
  item[:farmer_id] = farmers_records.sample.id
  products_record = Product.create(item.except(:picture))
  products_record.picture.attach(io: File.open("app/assets/images/seed/#{item[:picture]}"), filename: "#{item[:picture]}", content_type: 'image/jpg')
end
puts "successfully seeded products ✅"
