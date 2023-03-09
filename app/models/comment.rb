class Comment < ApplicationRecord
  include Visible
  belongs_to :movie
  validates_presence_of :movie_id
end
