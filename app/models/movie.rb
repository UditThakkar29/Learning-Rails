class Movie < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  # before_save :update_movie_name

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 5}
  accepts_nested_attributes_for :comments

  # def comments_attributes=(comments_attributes)
  #   comments_attributes.each do |i,comment_attr|
  #     self.comments.build(comment_attr)
  #   end
  # end
  # private
  #   def update_movie_name
  #     self.title.downcase!
  #   end

end
