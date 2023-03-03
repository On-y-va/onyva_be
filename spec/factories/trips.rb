FactoryBot.define do
  factory :trip do
    name {Faker::Movies::HarryPotter.spell}
    city {Faker::Address.city}
    country {Faker::Address.country}
    postcode {Faker::Address.postcode}
    start_date {Faker::Date.in_date_period(year: 2018, month: 2)}
    end_date {Faker::Date.in_date_period(year: 2019, month: 2)}
  end
end
