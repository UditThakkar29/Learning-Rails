class CreateTemps < ActiveRecord::Migration[7.0]
  def change
    create_table :temps do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps
    end
  end
end
