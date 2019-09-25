FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name  }
    password { '123321' }
    password_confirmation { '123321' }
  end
end