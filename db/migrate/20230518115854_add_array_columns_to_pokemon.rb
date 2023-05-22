class AddArrayColumnsToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :abilities, :string, default: [], array: true
    add_column :pokemons, :weakness, :string, default: [], array: true
  end
end
