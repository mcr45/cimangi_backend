# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

(1..10).each do |i|
    user=User.create(first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        username: Faker::Internet.username,
        password: 'password',
        password_confirmation: 'password')
    
    rand(2..10).times do |o|
        user.posts.create(title:Faker::Food.dish,
            body:Faker::Books::Lovecraft.paragraph_by_chars(characters: 50),
            likes:Faker::Number.number(digits: 10))
        user.recipes.create(title:Faker::Lorem.paragraph_by_chars(number: 24),
        body:Faker::Books::Lovecraft.paragraph_by_chars(characters: 100),
        category:['vegan','meal','romantic_dinner','pizza','soup'].sample)
    end
    


end
rand(2..5).times do |e|
        Recipe.find_or_create_by!(title:Faker::Lorem.paragraph_by_chars(number: 24),
        body:Faker::Books::Lovecraft.paragraph_by_chars(characters: 100),
        category:['vegan','meal','romantic_dinner','pizza','soup'].sample)
    end