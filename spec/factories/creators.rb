FactoryBot.define do
  factory :creator do
    category_id { create(:category).id }
    user_id { create(:user).id }
  end
end