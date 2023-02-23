FactoryBot.define do
  factory :trip do
    name {Faker::Movies::HarryPotter.spell}
    city {Faker::Address.city}
    country {Faker::Address.country}
    postcode {Faker::Address.postcode}
  end
end
