FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }

    trait :admin do
      role :admin
    end
  end
end
