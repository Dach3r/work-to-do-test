FactoryBot.define do
  factory :task do
    project { nil }
    user { nil }
    name { "MyString" }
    description { "MyText" }
    position { 1 }
    priority { "MyString" }
    status { "MyString" }
  end
end
