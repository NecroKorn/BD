CREATE OR REPLACE FUNCTION public.MODIFICA_SALA
(
	_id_sala integer,
	_id_cine integer,
	_numero_sala integer,
	_cantidad_butacas integer
)  RETURNS boolean AS
$BODY$
DECLARE
	codigo ALIAS FOR _id_sala;
	registro public.sala%ROWTYPE;
BEGIN
	SELECT * INTO registro FROM public.sala WHERE id_sala = codigo;
	IF FOUND THEN
		UPDATE 
			public.sala
		SET 
			id_cine = _id_cine,
			numero_sala = _numero_sala,
			cantidad_butacas = _cantidad_butacas
		WHERE 
			id_sala = _id_sala;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
ALTER FUNCTION public.MODIFICA_SALA(integer, integer, integer, integer)
  OWNER TO sa;
