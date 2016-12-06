DROP FUNCTION IF EXISTS OBTENER_FUNCION();

CREATE FUNCTION OBTENER_FUNCION()
RETURNS SETOF public.FUNCION AS
$BODY$
	SELECT 
		id_funcion, 
		id_pelicula, 
		id_sala, 
		fecha_funcion
	FROM public.funcion;
$BODY$
LANGUAGE 'sql'
