﻿CREATE OR REPLACE FUNCTION ELIMINA_PELICULA
(
	integer
) RETURNS BOOL AS
$BODY$
DECLARE
	codigo ALIAS FOR $1;
BEGIN
	DELETE FROM public.pelicula WHERE id_pelicula = codigo;
	IF FOUND THEN
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$  LANGUAGE 'plpgsql' VOLATILE;
