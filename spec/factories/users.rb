FactoryBot.define do
  factory :user do
    first_name {Faker::Name::first_name}
    last_name {Faker::Name::last_name}
    phone_number {Faker::PhoneNumber.cell_phone}
    email {Faker::Internet.email(name: "#{first_name}.#{last_name}")}
    password {Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3)}
    password_confirmation {password}
  end
end