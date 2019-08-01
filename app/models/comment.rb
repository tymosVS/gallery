class Comment < ApplicationRecord
  belongs_to :image
  belongs_to :user
  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 1}
end
