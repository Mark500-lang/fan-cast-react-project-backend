puts "🌱 Seeding spices..."

50.times do 
    movie = Movie.create(
        title: Faker::Movie.title,
        release_date: Faker::Time.backward(days: 1000, period: :all),
        starring: Faker::Name.name,
        quote: Faker::Movie.quote
    )
end

puts "✅ Done seeding!"
