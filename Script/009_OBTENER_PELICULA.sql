DROP FUNCTION IF EXISTS OBTENER_PELICULA();

CREATE FUNCTION OBTENER_PELICULA()
RETURNS SETOF public.PELICULA AS
$BODY$
	SELECT 
		id_pelicula, 	
		id_calificacion_pelicula, 
		id_genero_pelicula, 
		id_reparto, 
		titulo_distribucion, 
		titulo_original, 
		idioma_original, 
		subtitulos_espanol, 
		ano_produccion, 
		duracion_minutos, 
		fecha_estreno, 
		resumen
  FROM public.pelicula;
$BODY$
LANGUAGE 'sql';
