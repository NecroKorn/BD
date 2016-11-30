CREATE OR REPLACE FUNCTION public.INSERTA_BUTACA_RESERVADA
(
	_id_reserva integer, 
	_numero_butaca_reservada integer
) RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
	public.butaca_reservada
	(
		id_butaca, 
		id_reserva, 
		numero_butaca_reservada
	)
    VALUES 
	(
		nextval('id_butaca_seq'),
		_id_reserva,
		_numero_butaca_reservada
	);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
