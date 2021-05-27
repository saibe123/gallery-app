class Post < ApplicationRecord
  belongs_to :gallery
  has_one_attached :image

  def thumb
    self.image.variant(resize_to_limit: [200,200]).processed
  end


  validates :image, :presence => true

end