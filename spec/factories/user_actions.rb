FactoryBot.define do
  factory :user_action do
    user_id { create(:user).id }
    action { Faker::Name.name  }
    action_path { Faker::Lorem.sentence(word_count: 1) }
  end
end
