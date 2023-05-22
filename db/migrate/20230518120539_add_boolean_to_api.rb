class AddBooleanToApi < ActiveRecord::Migration[7.0]
  def change
    add_column :apis, :stored_locally, :boolean
  end
end
