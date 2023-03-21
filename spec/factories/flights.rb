FactoryBot.define do
  factory :flight do
    flight_number { Faker::Number.number(digits: 4) }
    date {Faker::Date.forward(days: 23)}
    association :user
  end
end