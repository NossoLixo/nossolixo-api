FactoryGirl.define do
  factory :city do
    name { Faker::Name.name }
    state { Faker::Address.state_abbr }
  end
end
