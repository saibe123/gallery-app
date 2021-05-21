class Post < ApplicationRecord
  belongs_to :gallery
  has_many_attached :images

  validates :image_type


  private
  def image_type
    if images_attached? == false
      errors.add(:images, "are missing!")
    end
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png')
        errors.add(:images, 'needs to be JPEG or PNG'))
  end
end
