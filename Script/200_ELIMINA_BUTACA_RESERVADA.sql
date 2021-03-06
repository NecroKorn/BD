CREATE OR REPLACE FUNCTION ELIMINA_BUTACA_RESERVADA
(
	integer
) RETURNS BOOL AS
$BODY$
DECLARE
	codigo ALIAS FOR $1;
BEGIN
	DELETE FROM public.butaca_reservada WHERE id_butaca = codigo;
	IF FOUND THEN
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$  LANGUAGE 'plpgsql' VOLATILE;
