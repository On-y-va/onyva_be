FactoryBot.define do
  factory :trip do
    name {Faker::Movies::HarryPotter.spell}
    city {Faker::Address.city}
    country {Faker::Address.country}
    postcode {Faker::Address.postcode}
    place_id {Faker::Alphanumeric.alphanumeric(number: 15, min_alpha: 3, min_numeric: 3)}
  end
end
