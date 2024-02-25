FactoryBot.define do
  factory :recipe do
    title {Faker::Food.dish}
    body {Faker::Books::Lovecraft.paragraph_by_chars(characters: 100)}
    category {['vegan','meal','romantic_dinner','pizza','soup'].sample}
    association :user,factory: :user
  end
end
