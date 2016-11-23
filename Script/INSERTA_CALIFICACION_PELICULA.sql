CREATE OR REPLACE FUNCTION public.inserta_calificacion_pelicula(
    id_calificacion_pelicula integer,
    nombre_calificacion_pelicula character varying)
  RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
	public.calificacion_pelicula
	(
		id_calificacion_pelicula, 
		nombre_calificacion_pelicula
	)
    VALUES 
	(
		id_calificacion_pelicula,
		nombre_calificacion_pelicula
	);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.inserta_calificacion_pelicula(integer, character varying)
  OWNER TO sa;
