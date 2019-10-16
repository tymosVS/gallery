FactoryBot.define do
  factory :fan do
    image_id { create(:image).id }
    user_id { create(:user).id }
  end
end
