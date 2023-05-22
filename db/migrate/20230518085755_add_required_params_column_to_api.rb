class AddRequiredParamsColumnToApi < ActiveRecord::Migration[7.0]
  def change
    add_column :apis, :required_params_names, :string, default: [], array: true
  end
end
