CREATE OR REPLACE FUNCTION public.INSERTA_SALA
(
	_id_cine integer,
	_numero_sala integer,
	_cantidad_butacas integer
) RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
	public.sala
	(
		id_sala,
		id_cine,
		numero_sala,
		cantidad_butacas
	)
    VALUES 
	(
		nextval('id_sala_seq'),
		_id_cine,
		_numero_sala,
		_cantidad_butacas
	);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
