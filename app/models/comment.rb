class Comment < ApplicationRecord
  include Visible
  
  belongs_to :movie

end
