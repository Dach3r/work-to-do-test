FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    cellphone { Faker::PhoneNumber.cell_phone }
    password { 'password' }
  end
end
