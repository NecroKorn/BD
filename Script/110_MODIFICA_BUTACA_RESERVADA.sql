CREATE OR REPLACE FUNCTION public.MODIFICA_BUTACA_RESERVADA
(
	_id_butaca integer, 
	_id_reserva integer, 
	_numero_butaca_reservada integer
)  RETURNS boolean AS
$BODY$
DECLARE
	codigo ALIAS FOR $1;
	registro public.butaca_reservada%ROWTYPE;
BEGIN
	SELECT * INTO registro FROM public.butaca_reservada WHERE id_butaca = codigo;
	IF FOUND THEN
		UPDATE 
			public.butaca_reservada
		SET 
			id_reserva=_id_reserva,
			numero_butaca_reservada=_numero_butaca_reservada
		WHERE 
			id_butaca = codigo;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
