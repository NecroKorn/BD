CREATE OR REPLACE FUNCTION public.MODIFICA_RESERVA
(
	_id_reserva integer,
	_id_funcion integer,
	_fecha_reserva date,
	_vigente boolean,
	_fecha_estado date
)  RETURNS boolean AS
$BODY$
DECLARE
	codigo ALIAS FOR _id_reserva;
	registro public.reserva%ROWTYPE;
BEGIN
	SELECT * INTO registro FROM public.reserva WHERE id_reserva = codigo;
	IF FOUND THEN
		UPDATE 
			public.reserva
		SET 
			id_funcion = _id_funcion,
			fecha_reserva = _fecha_reserva,
			vigente = _vigente,
			fecha_estado = _fecha_estado
		WHERE 
			id_reserva = codigo;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
