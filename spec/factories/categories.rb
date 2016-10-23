FactoryGirl.define do
  factory :category do
    name { Faker::Name.name }
    color { Faker::Color.hex_color }
    approved false

    trait :approved do
      approved true
    end

    trait :disapproved do
      approved false
    end
  end
end
