CREATE OR REPLACE FUNCTION public.modifica_persona
(
	_id_persona integer,
	_nombre_persona character varying(100),
	_apellido_paterno character varying(100),
	_apellido_materno character varying(100)
) RETURNS boolean AS
$BODY$
DECLARE
	codigo ALIAS FOR _id_persona;
	registro public.persona%ROWTYPE;
BEGIN
	SELECT * INTO registro FROM public.persona WHERE id_persona = codigo;
	IF FOUND THEN
		UPDATE 
			public.persona
		SET 
			nombre_persona = _nombre_persona,
			apellido_paterno = _apellido_paterno,
			apellido_materno = _apellido_materno
		WHERE 
			id_persona = codigo;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
ALTER FUNCTION public.modifica_persona(integer, character varying(100), character varying(100), character varying(100))
  OWNER TO sa;
