FactoryBot.define do
  factory :trip do
    name {Faker::Movies::HarryPotter.spell}
    city {Faker::Address.city}
    country {Faker::Address.country}
    postcode {Faker::Address.postcode}
    start_date {Faker::Time.forward(days: 30, period: :day)}
    end_date {Faker::Time.forward(days: 45, period: :day)}
  end
end
