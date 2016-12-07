CREATE OR REPLACE FUNCTION ELIMINA_REPARTO
(
	integer
) RETURNS BOOL AS
$BODY$
DECLARE
	codigo ALIAS FOR $1;
BEGIN
	DELETE FROM public.reparto WHERE id_reparto = codigo;
	IF FOUND THEN
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;

$BODY$  LANGUAGE 'plpgsql' VOLATILE;
