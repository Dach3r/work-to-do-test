FactoryBot.define do
  factory :category do
    name { Faker::Name.name }

    association :categorization, factory: :user
  end
end
