FactoryBot.define do
  factory :post do
    # association :image_id, factory: :image, strategy: :create
    # association :category_id, factory: :category, strategy: :create
    image_id { create(:image).id }
    category_id { create(:category).id }
  end
end