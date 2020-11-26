FactoryBot.define do
  factory :project do
    name { Faker::Movie.title }
    description { Faker::Lorem.paragraph }
    due_date { Faker::Date.between(from: Date.today, to: (Date.today + 1.month)) }

    association :user, factory: :user
  end
end
