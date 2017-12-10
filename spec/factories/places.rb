FactoryBot.define do
  factory :place do
    name { Faker::Name.name }
    street { Faker::Address.street_name }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    approved false
    association :requested_by, factory: :user

    trait :approved do
      approved true
      approved_at { Time.current }
      association :approved_by, factory: :user
    end

    trait :disapproved do
      approved false
    end
  end
end
