CREATE OR REPLACE FUNCTION public.INSERTA_FUNCION
(
	_id_pelicula integer, 
	_id_sala integer,
	_fecha_funcion date
) RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
	public.funcion
	(
		id_funcion, 
		id_pelicula, 
		id_sala,
		fecha_funcion
	)
    VALUES 
	(
		NEXTVAL('id_funcion_seq'),
		_id_pelicula, 
		_id_sala,
		_fecha_funcion
	);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
