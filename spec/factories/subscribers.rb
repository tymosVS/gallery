FactoryBot.define do
  factory :subscriber do
    category_id { create(:category).id }
    user_id { create(:user).id }
  end
end
