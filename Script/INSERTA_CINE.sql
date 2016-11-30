CREATE OR REPLACE FUNCTION public.inserta_cine
(
	_direccion character varying(100), 
	_nombre_cine character varying(100)
) RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
	public."cine"
	(
		id_cine, 
		direccion, 
		nombre_cine
	)
    VALUES 
	(
		nextval('id_cine_seq'),
		_direccion,
		_nombre_cine
	);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
