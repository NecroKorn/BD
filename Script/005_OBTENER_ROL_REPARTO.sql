DROP FUNCTION IF EXISTS OBTENER_ROL_REPARTO();

CREATE FUNCTION OBTENER_ROL_REPARTO()
RETURNS SETOF public.rol_reparto AS
$BODY$
	SELECT 
		id_rol_reparto, 
		nombre_rol
	FROM public.rol_reparto;
$BODY$
LANGUAGE 'sql';
