User.delete_all

50.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "1234",
    password_confirmation: "1234"
  )
end

25.times do
  Spot.create!(
    location: Faker::Address.city,
    description: Faker::Lorem.word,
    date: Faker::Date.forward(5),
    start_time: Faker::Time.between(1.day.ago, Time.now, :morning),
    end_time: Faker::Time.between(1.day.ago, Time.now, :evening),
    others: Faker::Name.name
  )
end
