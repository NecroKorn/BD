CREATE OR REPLACE FUNCTION public.INSERTA_HISTORIA_RESERVA
(
	_operacion char(1),
	_fecha_proceso date,
	_id_reserva integer
)
  RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
	public.Historia_Reserva
	(
		id_historia, 
		operacion,	
		fecha_proceso,
		id_reserva 
	)
    VALUES 
	(
		nextval('id_historia_seq'),
		_operacion,
		_fecha_proceso,
		_id_reserva
	);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
