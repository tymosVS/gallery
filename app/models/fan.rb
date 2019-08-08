class Fan < ApplicationRecord
  belongs_to :user
  belongs_to :image

  def to_s
    self.user.name
  end
end
