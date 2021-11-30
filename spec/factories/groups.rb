FactoryBot.define do
  factory :group do
    name { Faker::Name.name }
    icon { Faker::Name.name }
  end
end
