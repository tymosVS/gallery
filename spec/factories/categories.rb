FactoryBot.define do
  factory :category do
    title { Faker::Lorem.sentence(word_count: 1) }
    description { Faker::Lorem.sentence(word_count: 15) }
  end
end