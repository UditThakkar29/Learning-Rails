class Movie < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  # before_save :update_movie_name

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 5}

  # private
  #   def update_movie_name
  #     self.title.downcase!
  #   end

end
