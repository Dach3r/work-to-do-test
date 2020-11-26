FactoryBot.define do
  factory :task do
    name { Faker::Movie.title }
    description { Faker::Lorem.paragraph }
    position { rand(100) }
    priority { ConstantHelper::PRIORITY_LIST.sample }
    status { ConstantHelper::STATUS_LIST.sample }

    association :user, factory: :user
    association :project, factory: :project
  end
end
