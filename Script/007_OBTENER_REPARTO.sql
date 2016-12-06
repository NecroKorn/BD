DROP FUNCTION IF EXISTS OBTENER_REPARTO();

CREATE FUNCTION OBTENER_REPARTO()
RETURNS SETOF public.reparto AS
$BODY$
	SELECT
		id_reparto,
		id_persona,
		id_rol_reparto,
		nombre_personaje
	 FROM public.reparto;
$BODY$
LANGUAGE 'sql'
