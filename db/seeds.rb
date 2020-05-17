require_relative 'data/data'
# Cleanup - Order is important!
Product.destroy_all
User.destroy_all


puts "seeding users"
# user_admin = User.create(email: 'admin@fruit.com', password: 'farmerno1', admin: true)
user_one = User.create(username: 'test1', email: 'test-user1@fruit.com', password: 'password', user_type: "farmer")
user_two = User.create(username: 'test2', email: 'test-user2@fruit.com', password: 'password', user_type: "farmer")
user_three = User.create(username: 'test3',email: 'test-user3@fruit.com', password: 'password', user_type: "normal")

admin1 = User.create(username: 'admin1',email: 'admin@fruit.com', password: 'password', user_type: "normal", admin: true)
puts "successfully seeded users ✅"

users = [user_one, user_two]

farmers_record = []

puts "seeding farmers"
farmers.each_with_index do |farmer, index|
  farmer[:user_id] = users[index].id
  farmers_record << Farmer.create(farmer)
end
puts "successfully seeded farmers ✅"


puts "seeding products"
products.each do |item|
  item[:farmer_id] = farmers_record.sample.id
  products_record = Product.create(item.except(:picture))
  products_record.picture.attach(io: File.open("app/assets/images/seed/#{item[:picture]}"), filename: "#{item[:picture]}", content_type: 'image/jpg')

end
puts "successfully seeded products ✅"
