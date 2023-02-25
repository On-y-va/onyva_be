FactoryBot.define do
  factory :trip_event do
    # t.boolean "confirmed", default: true
    event_date {Faker::Date.forward(days: 23)}
    event_time {Faker::Time.forward(days: 45 ) }
    event_id { Faker::Number.number(digits: 4) }
    votes { 0 }
    association :trip
  end
end