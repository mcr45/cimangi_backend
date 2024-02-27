FactoryBot.define do
  factory :comment do
    body {Faker::TvShows::NewGirl.quote}
    association :user,factory: :user
    association :commentable, factory: :post
  end
end
