class Movie < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  has_one_attached :image
  # before_save :update_movie_name

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 5}
  accepts_nested_attributes_for :comments, allow_destroy: true
  validate :acceptable_image

  # def comments_attributes=(comments_attributes)
  #   comments_attributes.each do |i,comment_attr|
  #     self.comments.build(comment_attr)
  #   end
  # end
  # private
  #   def update_movie_name
  #     self.title.downcase!
  #   end
  def acceptable_image
    return unless image.attached?
    unless image.blob.byte_size <= 5.megabyte
      errors.add(:image, "is too big")
    end
    acceptable_type = ["image/jpeg", "image/png"]
    unless acceptable_type.include?(image.content_type)
      errors.add(:image, "must be JPEG or PNG")
    end
  end
end
