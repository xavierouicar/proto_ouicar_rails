FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    uid Faker::Internet.email
    provider 'email'
    password 'password'
    password_confirmation 'password'
  end
end
