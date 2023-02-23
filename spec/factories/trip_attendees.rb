FactoryBot.define do
  factory :trip_attendee do
    association :trip, :user
  end
end