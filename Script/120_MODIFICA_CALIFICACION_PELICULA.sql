CREATE OR REPLACE FUNCTION public.modifica_calificacion_pelicula(
    integer,
    character varying)
  RETURNS boolean AS
$BODY$
DECLARE
	codigo ALIAS FOR $1;
	registro public.calificacion_pelicula%ROWTYPE;
BEGIN
	SELECT * INTO registro FROM public.calificacion_pelicula WHERE id_calificacion_pelicula = codigo;
	IF FOUND THEN
		UPDATE 
			public.calificacion_pelicula
		SET 
			nombre_calificacion_pelicula=$2
		WHERE 
			id_calificacion_pelicula = $1;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
