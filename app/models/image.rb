class Image < ApplicationRecord
  paginates_per 20
  has_one :post, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :fans, dependent: :destroy
  # --------------------------------------------------------
#   ransacker :containing_category, 
#           :formatter => ->(v) { ids = Category.find(v).self_and_descendants.pluck(:id);
#                                 ids.present? ? ids : nil } do |product|
#   product.table[:category_id]
# end
  # --------------------------------------------------------
  ransacker :containing_category,
            :formatter => ->(v) {ids = Post.where(category_id: v).pluck(:image_id);
                              ids.present? ? ids : nil} do |image|
    image.table[:id]
  end
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: {minimum: 2}
  validates :image, presence: true, 
            file_size: { less_than_or_equal_to: 50.megabytes }
end
