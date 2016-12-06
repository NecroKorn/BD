CREATE OR REPLACE FUNCTION public.modifica_cine
(
	_id_cine integer, 
	_direccion character varying(100), 
	_nombre_cine character varying(100)
)  RETURNS boolean AS
$BODY$
DECLARE
	codigo ALIAS FOR _id_cine;
	registro public.cine%ROWTYPE;
BEGIN
	SELECT * INTO registro FROM public.cine WHERE id_cine = codigo;
	IF FOUND THEN
		UPDATE 
			public.cine
		SET 
			direccion=_direccion,
			nombre_cine=_nombre_cine
		WHERE 
			id_cine = _id_cine;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
