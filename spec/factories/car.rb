FactoryGirl.define do
  factory :car do
    user
    brand Faker::Vehicle.manufacture
    registration 'AZ123AZ'
    model Faker::StarWars.vehicle
  end
end
