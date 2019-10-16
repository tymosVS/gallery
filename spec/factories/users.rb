FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Date.today }
  end
end
