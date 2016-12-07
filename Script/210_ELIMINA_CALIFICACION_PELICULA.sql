-- Función UPDATE: Actualizamos un registro por el campo Código, devolvemos TRUE si se actualiza
CREATE OR REPLACE FUNCTION ELIMINA_CALIFICACION_PELICULA
(
	integer
) RETURNS BOOL AS
$BODY$
DECLARE
	codigo ALIAS FOR $1;
BEGIN
	DELETE FROM public.calificacion_pelicula WHERE id_calificacion_pelicula = codigo;
	IF FOUND THEN
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$  LANGUAGE 'plpgsql' VOLATILE;
