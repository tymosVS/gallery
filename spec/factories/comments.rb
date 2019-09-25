FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence(word_count: 15) }
    image_id { create(:image).id }
    user_id { create(:user).id }
  end
end