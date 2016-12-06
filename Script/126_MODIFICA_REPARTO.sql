CREATE OR REPLACE FUNCTION public.MODIFICA_REPARTO
(
	_id_reparto integer,
	_id_persona integer,
	_id_rol_reparto integer,
	_nombre_personaje character varying(100)
)  RETURNS boolean AS
$BODY$
DECLARE
	codigo ALIAS FOR $1;
	registro public.reparto%ROWTYPE;
BEGIN
	SELECT * INTO registro FROM public.reparto WHERE id_reparto = codigo;
	IF FOUND THEN
		UPDATE 
			public.reparto
		SET 
			id_reparto = _id_reparto,
			id_persona = _id_persona,
			id_rol_reparto = _id_rol_reparto,
			nombre_personaje = _nombre_personaje
		WHERE 
			id_reparto = codigo;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
