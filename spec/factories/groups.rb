FactoryBot.define do
  factory :group do
    name { Faker::Name.name }
    icon { "https://iconsapi.com/5ee26936e4b0b788a9339a64.svg" }
  end
end
