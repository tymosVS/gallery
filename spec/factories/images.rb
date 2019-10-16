FactoryBot.define do
  factory :image do
    title { 'imageTitle' }
    image { Rails.root.join('spec/fixtures/images/default.jpg').open }
  end
end
