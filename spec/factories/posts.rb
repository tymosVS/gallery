FactoryBot.define do
  factory :post do
    image_id { create(:image).id }
    category_id { create(:category).id }
  end
end