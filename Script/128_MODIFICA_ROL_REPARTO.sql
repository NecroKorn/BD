CREATE OR REPLACE FUNCTION public.MODIFICA_ROL_REPARTO
(
	_id_rol_reparto integer, 
	_nombre_rol character varying(100)
)  RETURNS boolean AS
$BODY$
DECLARE
	codigo ALIAS FOR _id_rol_reparto;
	registro public.rol_reparto%ROWTYPE;
BEGIN
	SELECT * INTO registro FROM public.rol_reparto WHERE id_rol_reparto = codigo;
	IF FOUND THEN
		UPDATE 
			public.rol_reparto
		SET 
			nombre_rol = _nombre_rol
		WHERE 
			id_rol_reparto = codigo;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
ALTER FUNCTION public.MODIFICA_ROL_REPARTO(integer, character varying)
  OWNER TO sa;
