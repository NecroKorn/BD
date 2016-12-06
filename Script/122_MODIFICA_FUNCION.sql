CREATE OR REPLACE FUNCTION public.modifica_funcion
(
	integer, 
	integer, 
	integer,
	date
)  RETURNS boolean AS
$BODY$
DECLARE
	codigo ALIAS FOR $1;
	registro public.funcion%ROWTYPE;
BEGIN
	SELECT * INTO registro FROM public.funcion WHERE id_funcion = codigo;
	IF FOUND THEN
		UPDATE 
			public.funcion
		SET 
			id_pelicula=$2,
			id_sala=$3,
			fecha_funcion=$4
		WHERE 
			id_funcion = $1;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
ALTER FUNCTION public.modifica_funcion(integer, integer, integer, date)
  OWNER TO sa;
