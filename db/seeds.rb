User.delete_all
Spot.delete_all
Cat.delete_all
Subcat.delete_all
Place.delete_all
Subscription.delete_all
Attendee.delete_all
Friend.delete_all
PlaceImage.delete_all

50.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "1234",
    password_confirmation: "1234",
    avatar: Faker::Avatar.image
  )
end

User.create!(
  first_name: "Doug",
  last_name: "Bennett",
  email: "d@b.com",
  password: "1234",
  password_confirmation: "1234",
  avatar: Faker::Avatar.image
)

User.all.each do |user|
  (rand(10)+1).times do
    Friend.create!(
      user: user,
      friend_id: User.select{|u| u != user}.sample.id
    )
  end
end

active = Cat.create(name: "Active", image: 'active.png')
  Subcat.create(name: "Gym", cat_id: active.id)
  Subcat.create(name: "Rock Climbing", cat_id: active.id)
  Subcat.create(name: "Swimming", cat_id: active.id)
  Subcat.create(name: "Yoga", cat_id: active.id)

bars = Cat.create(name: "Bars", image: 'beer.png')
  Subcat.create(name: "Dive", cat_id: bars.id)
  Subcat.create(name: "Pub", cat_id: bars.id)
  Subcat.create(name: "Club", cat_id: bars.id)

bored = Cat.create(name: "Bored", image: 'popcorn.png')
  Subcat.create(name: "Movies", cat_id: bored.id)
  Subcat.create(name: "Concerts", cat_id: bored.id)
  Subcat.create(name: "Games", cat_id: bored.id)

broke = Cat.create(name: "Broke", image: 'broke.png')

intellectual = Cat.create(name: "Intellectual", image: 'coffee.png')
  Subcat.create(name: "Coffee", cat_id: intellectual.id)
  Subcat.create(name: "Library", cat_id: intellectual.id)

outdoors = Cat.create(name: "Outdoors", image: 'outdoors.png')
  Subcat.create(name: "Mountains", cat_id: outdoors.id)
  Subcat.create(name: "Biking", cat_id: outdoors.id)
  Subcat.create(name: "Camping", cat_id: outdoors.id)
  Subcat.create(name: "Running", cat_id: outdoors.id)

restaurants = Cat.create(name: "Restaurants", image: 'pizza.png')
  Subcat.create(name: "Italian", cat_id: restaurants.id, image: 'italian.png', role: 'type')
  Subcat.create(name: "Mexican", cat_id: restaurants.id, image: 'mexican.png', role: 'type')
  Subcat.create(name: "Thai", cat_id: restaurants.id, image: 'thai.png', role: 'type')
  Subcat.create(name: "American", cat_id: restaurants.id, image: 'american.png', role: 'type')
  Subcat.create(name: "Chinese", cat_id: restaurants.id, image: 'chinese.png', role: 'type')
  Subcat.create(name: "Fast food", cat_id: restaurants.id, image: 'fastfood.png', role: 'type')
  Subcat.create(name: "Breakfast", cat_id: restaurants.id, image: 'breakfast.png', role: 'meal')
  Subcat.create(name: "Lunch", cat_id: restaurants.id, image: 'lunch.png', role: 'meal')
  Subcat.create(name: "Dinner", cat_id: restaurants.id, image: 'dinner.png', role: 'meal')

shopping = Cat.create(name: "Shopping", image: 'shopping.png')
  Subcat.create(name: "Clothes", cat_id: shopping.id)
  Subcat.create(name: "Sports", cat_id: shopping.id)
  Subcat.create(name: "Food", cat_id: shopping.id)

Subcat.all.each do |s|
  5.times do
    Place.create!(
      name: Faker::Lorem.word,
      description: Faker::Lorem.sentence,
      location: Faker::Address.city,
      subcat_id: s.id,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude
    )
  end
end

Place.all.each do |place|
  (rand(6)+1).times do
    Subscription.create!(
      user: User.all.sample,
      place: place,
      role: "Spottee"
    )
  end
  rand(3).times do
    Subscription.create!(
      user: User.all.sample,
      place: place,
      role: "Spotter"
    )
  end
  (rand(3)+1).times do
    PlaceImage.create!(
      image: Faker::Avatar.image,
      place: place,
      user: User.all.sample,
      spot: place.spots.sample,
      comment: Faker::Lorem.paragraph,
      public: [true,false].sample
    )
  end
end

25.times do
  spot = Spot.create!(
  place_id: Place.all.sample.id,
  description: Faker::Lorem.sentence,
  date: Faker::Date.between(2.days.ago, Date.today + 2),
  start_time: Faker::Time.between(1.day.ago, Time.now, :morning),
  end_time: Faker::Time.between(1.day.ago, Time.now, :evening),
  )
  (rand(2)+1).times do
    Attendee.create!(
    user: User.all.sample,
    spot: spot,
    role: "Attendant",
    attending: [true, false].sample,
    arrived: [true, false].sample
    )
  end
  (rand(6)+1).times do
    Attendee.create!(
    user: User.all.sample,
    spot: spot,
    role: "Attendee",
    attending: [true, false].sample,
    arrived: [true, false].sample
    )
  end
end
