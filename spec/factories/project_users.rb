FactoryBot.define do
  factory :project_user do
    association :project, factory: :project
    association :user, factory: :user
  end
end
