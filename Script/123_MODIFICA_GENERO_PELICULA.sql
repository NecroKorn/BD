CREATE OR REPLACE FUNCTION public.modifica_genero_pelicula
(
	integer, 
	character varying
)  RETURNS boolean AS
$BODY$
DECLARE
	codigo ALIAS FOR $1;
	registro public.genero_pelicula%ROWTYPE;
BEGIN
	SELECT * INTO registro FROM public.genero_pelicula WHERE id_genero_pelicula = codigo;
	IF FOUND THEN
		UPDATE 
			public.genero_pelicula
		SET 
			nombre_genero=$2
		WHERE 
			id_genero_pelicula = $1;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
