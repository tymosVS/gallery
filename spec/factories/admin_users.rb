FactoryBot.define do
  factory :admin_user do
    email { Faker::Internet.email }
    password { '123321' }
    password_confirmation { '123321' }
  end
end