1.times do |n|
    name = Faker::Name.name
    email = Faker::Internet.email
  
    User.create(
        name: name,
        email: email,
    )
  end