﻿DROP FUNCTION IF EXISTS OBTENER_CALIFICACION_PELICULA();

CREATE FUNCTION OBTENER_CALIFICACION_PELICULA()
RETURNS SETOF public.calificacion_pelicula AS
$BODY$
	SELECT * FROM public.calificacion_pelicula;
$BODY$
LANGUAGE 'sql'
