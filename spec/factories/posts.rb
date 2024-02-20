FactoryBot.define do
  factory :post do
    title {Faker::Food.dish}
    body {Faker::Books::Lovecraft.paragraph_by_chars(characters: 50)}
    likes {Faker::Number.number(digits: 10)} 
    association :user, factory: :user
  end
end
