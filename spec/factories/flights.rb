FactoryBot.define do
  factory :flight do
    airline_code { Faker::Alphanumeric.alpha(number: 2) }
    flight_number { Faker::Number.number(digits: 4) }
    date {Faker::Date.forward(days: 23)}
    association :user
  end
end