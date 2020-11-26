FactoryBot.define do
  factory :project do
    name { "MyString" }
    description { "MyText" }
    due_date { "2020-11-25" }
    user { nil }
  end
end
