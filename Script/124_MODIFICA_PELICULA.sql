CREATE OR REPLACE FUNCTION public.modifica_pelicula
(
	_id_pelicula integer,
	_id_calificacion_pelicula integer,
	_id_genero_pelicula integer,
	_id_reparto integer,
	_titulo_distribucion character varying(100),
	_titulo_original character varying(100),
	_idioma_original character varying(100),
	_subtitulos_espanol boolean,
	_ano_produccion numeric,
	_duracion_minutos integer,
	_fecha_estreno date,
	_resumen character varying(500)
) RETURNS boolean AS
$BODY$
DECLARE
	codigo ALIAS FOR $1;
	registro public.pelicula%ROWTYPE;
BEGIN
	SELECT * INTO registro FROM public.pelicula WHERE id_pelicula = codigo;
	IF FOUND THEN
		UPDATE 
			public.pelicula
		SET 
			id_calificacion_pelicula = _id_calificacion_pelicula,
			id_genero_pelicula = _id_genero_pelicula,
			id_reparto = _id_reparto,
			titulo_distribucion = _titulo_distribucion,
			titulo_original = _titulo_original,
			idioma_original = _idioma_original,
			subtitulos_espanol = _subtitulos_espanol,
			ano_produccion = _ano_produccion,
			duracion_minutos = _duracion_minutos,
			fecha_estreno = _fecha_estreno,
			resumen = _resumen
		WHERE 
			id_pelicula = codigo;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
