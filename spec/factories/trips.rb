FactoryBot.define do
  factory :trip do
    name {Faker::Movies::HarryPotter.spell}
    city {Faker::Address.city}
    country {Faker::Address.country}
    postcode {Faker::Address.postcode}
    start_date {Faker::Date.forward(days: 23)}
    end_date {Faker::Date.forward(days: 45)}
  end
end
