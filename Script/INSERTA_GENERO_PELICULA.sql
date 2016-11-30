CREATE OR REPLACE FUNCTION public.inserta_genero_pelicula
(
	_nombre_genero character varying
) RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
	public.genero_pelicula
	(
		id_genero_pelicula, 
		nombre_genero
	)
    VALUES 
	(
		NEXTVAL('id_genero_pelicula_seq'),
		_nombre_genero
	);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
ALTER FUNCTION public.inserta_genero_pelicula(character varying)
  OWNER TO sa;
