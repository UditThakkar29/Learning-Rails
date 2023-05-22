class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :image_url
      t.string :name

      t.timestamps
    end
  end
end
