FactoryBot.define do
  factory :category do
    title { 'someTitle'}
    description { Faker::Lorem.sentence(word_count: 15) }
  end
end