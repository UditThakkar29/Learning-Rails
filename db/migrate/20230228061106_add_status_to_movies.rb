class AddStatusToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :status, :string
  end
end
