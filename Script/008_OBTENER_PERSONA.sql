DROP FUNCTION IF EXISTS OBTENER_PERSONA();

CREATE FUNCTION OBTENER_PERSONA()
RETURNS SETOF public.PERSONA AS
$BODY$
	SELECT 
		id_persona, 
		nombre_persona, 
		apellido_paterno, 
		apellido_materno
	FROM public.persona;
$BODY$
LANGUAGE 'sql'
