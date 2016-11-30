CREATE OR REPLACE FUNCTION public.INSERTA_RESERVA
(
	_id_funcion integer,
	_fecha_reserva date,
	_vigente boolean,
	_fecha_estado date
) RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
	public.reserva
	(
		id_reserva,
		id_funcion,
		fecha_reserva,
		vigente,
		fecha_estado
	)
    VALUES 
	(
		nextval('id_reserva_seq'),
		_id_funcion,
		_fecha_reserva,
		_vigente,
		_fecha_estado
	);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.inserta_reserva(integer, date, boolean, date)
  OWNER TO sa;
