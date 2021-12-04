FactoryBot.define do
  factory :activity do
    name { Faker::Name.name }
    amount { Faker::Number.within(range: 1..5) }
  end
end
