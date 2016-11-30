CREATE OR REPLACE FUNCTION public.INSERTA_ROL_REPARTO
(
	_nombre_rol character varying(100)
) RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
	public.rol_reparto
	(
		id_rol_reparto, 
		nombre_rol
	)
    VALUES 
	(
		nextval('id_rol_reparto_seq'),
		_nombre_rol
	);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.INSERTA_ROL_REPARTO(character varying)
  OWNER TO sa;
