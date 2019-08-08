class Post < ApplicationRecord
  paginates_per 5
  after_create :new_image_in_subscribes_email

  belongs_to :image, dependent: :destroy
  belongs_to :category

  def to_s
    self.image.title
  end

  private

  def new_image_in_subscribes_email
    # UserMailer.new_image_in_subscribes_email(category).deliver 
    Resque.enqueue(NewImageSubscribedEmailJob, category)


  end 
end
