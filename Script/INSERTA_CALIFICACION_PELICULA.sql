CREATE OR REPLACE FUNCTION public.inserta_calificacion_pelicula(
    _nombre_calificacion_pelicula character varying)
  RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
	public."calificacion_pelicula"
	(
		id_calificacion_pelicula, 
		nombre_calificacion_pelicula
	)
    VALUES 
	(
		nextval('id_calificacion_pelicula_seq'),
		_nombre_calificacion_pelicula
	);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
