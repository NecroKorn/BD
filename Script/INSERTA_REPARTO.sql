CREATE OR REPLACE FUNCTION public.INSERTA_REPARTO
(
	_id_persona integer,
	_id_rol_reparto integer,
	_nombre_personaje character varying(100)
) RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
	public.reparto
	(
		id_reparto,
		id_persona,
		id_rol_reparto,
		nombre_personaje
	)
    VALUES 
	(
		NEXTVAL('id_reparto_seq'),
		_id_persona,
		_id_rol_reparto,
		_nombre_personaje
	);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
ALTER FUNCTION public.INSERTA_REPARTO(integer, integer, character varying)
  OWNER TO sa;
