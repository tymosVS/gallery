FactoryBot.define do
  factory :image_parser do
    image_url { Faker::Lorem.sentence(word_count: 1) }
  end
end