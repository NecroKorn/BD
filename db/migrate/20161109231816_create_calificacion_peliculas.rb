class CreateCalificacionPeliculas < ActiveRecord::Migration[5.0]
  def change
    create_table :calificacion_peliculas do |t|
      t.integer :id_calificacion_pelicula
      t.string :nombre_calificacion_pelicula

      t.timestamps
    end
  end
end
