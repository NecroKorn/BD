class CreateGeneroPeliculas < ActiveRecord::Migration[5.0]
  def change
    create_table :genero_peliculas do |t|
      t.integer :id_genero_pelicula
      t.string :nombre_genero

      t.timestamps
    end
  end
end
