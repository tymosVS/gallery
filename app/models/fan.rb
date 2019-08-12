class Fan < ApplicationRecord
  belongs_to :user
  belongs_to :image, counter_cache: true

  def to_s
    self.user.name
  end
end
