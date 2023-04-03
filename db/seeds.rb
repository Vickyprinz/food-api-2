puts "Seeding data...."

# Users
5.times do
  User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password_digest: BCrypt::Password.create('password')
  )
end

# Carts
5.times do |i|
  Cart.create(
    user_id: i + 1
  )
end

# Cart Items
5.times do
  CartItem.create(
    quantity: rand(1..5),
    cart_id: Cart.pluck(:id).sample,
    food_id: rand(1..5)
  )
end

# Orders
5.times do |i|
  Order.create(
    status: ["pending", "completed"].sample,
    total_price: rand(50..100),
    user_id: i + 1
  )
end

# Order Items
5.times do
  OrderItem.create(
    quantity: rand(1..5),
    order_id: Order.pluck(:id).sample,
    food_id: rand(1..5)
  )
end


  # Foods
  Food.create([
    {
    "name": "Red Velvet cake",
    "description": "Red velvet cake has endured as one of the most popular cakes in the United States.Cake's name is a descriptor of its soft, velvety texture.",
    "price": 20,
    "image_url": "https://images.unsplash.com/photo-1586788680434-30d324b2d46f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVkJTIwdmVsdmV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
    },
    {
    "name": "Black Forest cake",
    "description": "Typically, Black Forest cake is made by soaking the chocolate sponge in sugar syrup flavored with cherry brandy and topped with whipped cream.",
    "price": 25,
    "image_url": "https://media.istockphoto.com/id/1327824483/photo/image-of-sliced-black-forest-gateau-with-piped-whipped-cream-rosettes-with-morello-cherries.jpg?b=1&s=170667a&w=0&k=20&c=PeLWsfUyUe3mliVIV1tPvbQpQmC0u_pge8kp5eFeWro="
    },
    {
    "name": "Cupcakes",
    "description": "Cupcakes in general come in almost every flavor as traditional cakes, so you can customize your batch to your liking.",
    "price": 5,
    "image_url": "https://media.istockphoto.com/id/1324582711/photo/chocolate-and-vanilla-mini-desserts-cream-cupcakes-panacotas.jpg?b=1&s=170667a&w=0&k=20&c=p3_ZRRf1yXrZoslETdu4itmTgCWsgVvhJBF8UUe25GU="
    },
    {
    "name": "Apricot Danish",
    "description": "Apricot Danishes are easy and delicious! Chopped fresh apricots on a bed of sweetened cream cheese wrapped in buttery, crispy puff pastry.",
    "price": 15,
    "image_url": "https://media.istockphoto.com/id/1399448503/photo/apricot-danish-pastries-on-a-white-napkin-the-cakes-are-served-in-a-tall-glass-vase-close-up.jpg?b=1&s=170667a&w=0&k=20&c=xRsdf3iC_4iOtg4Vf3XT33HSZjIc14hmnNx6XM43GFU="
    },
    {
    "name": "Chocolate tarts",
    "description": "Get ready to swoon! These rich and indulgent chocolate tarts are filled with two types of chocolate.",
    "price": 15,
    "image_url": "https://media.istockphoto.com/id/480134303/photo/chocolate-tart.jpg?b=1&s=170667a&w=0&k=20&c=kT0ucWQBDGmxFMRvhMAQsv6l5jDUORazN8BQN3CUUGQ="
    },
    {
    "name": "Baklava",
    "description": "Layer with nuts and drizzle with honey to make this wonderfully sticky Middle Eastern treat.",
    "price": 10,
    "image_url": "https://media.istockphoto.com/id/1367685040/photo/traditional-turkish-arabic-sweets-baklava-with-turkish-coffee.jpg?b=1&s=170667a&w=0&k=20&c=WDv2EjogNxFU3I3dt22BS9P3X2Q-rUBYZl4Sbxb_KCM="
    },
    {
    "name": "White Chocolate Strawberry Cookies",
    "description": "These cookies bring together two favorite ingredients: white chocolate and strawberry. They are perfectly sweet and chewy with fun bites of dried strawberry pieces and white chocolate chips.",
    "price": 5,
    "image_url": "https://images.unsplash.com/photo-1621236378699-8597faf6a176?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8V2hpdGUlMjBDaG9jb2xhdGUlMjBTdHJhd2JlcnJ5JTIwQ29va2llc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
    },
    {
    "name": "Chocolate Chip Cookies",
    "description": "You cannot go wrong with the classic chocolate chip cookie. This recipe includes melted butter, more brown sugar than white sugar, and an extra egg yolk for a chewy texture and big chocolate chunks for indulgent flavor.",
    "price": 5,
    "image_url": "https://media.istockphoto.com/id/1367685040/photo/traditional-turkish-arabic-sweets-baklava-with-turkish-coffee.jpg?b=1&s=170667a&w=0&k=20&c=WDv2EjogNxFU3I3dt22BS9P3X2Q-rUBYZl4Sbxb_KCM="
    },
    {
    "name": "Gingerbread Cookies",
    "description": "They are the quintessential Christmas cookie, but gingerbread cookies are delicious anytime. With tasty warming spices, including ginger, cinnamon, ginger, and cloves, they are simply delicious and make your house smell amazing.",
    "price": 5,
    "image_url": "https://plus.unsplash.com/premium_photo-1669831178183-44b4829039d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2luZ2VyYnJlYWQlMjBjb29raWVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
    }
    ])



puts "Done seeding data"
  