class Post < ApplicationRecord
  belongs_to :image, dependent: :destroy
  belongs_to :category
end
