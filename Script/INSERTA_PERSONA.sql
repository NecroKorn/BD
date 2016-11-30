CREATE OR REPLACE FUNCTION public.inserta_persona
(
	_nombre_persona character varying(100),
	_apellido_paterno character varying(100),
	_apellido_materno character varying(100)
) RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
		public.persona
		(
			id_persona,
			nombre_persona,
			apellido_paterno,
			apellido_materno
		)
		VALUES 
		(
			NEXTVAL('id_persona_seq'),
			_nombre_persona,
			_apellido_paterno,
			_apellido_materno
		);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
ALTER FUNCTION public.inserta_persona(integer, character varying(100), character varying(100), character varying(100))
  OWNER TO sa;
