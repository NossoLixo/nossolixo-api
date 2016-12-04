FactoryGirl.define do
  factory :category do
    name { Faker::Name.name }
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
