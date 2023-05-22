class AddHostToApi < ActiveRecord::Migration[7.0]
  def change
    add_column :apis, :api_host, :string
  end
end
