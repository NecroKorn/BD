CREATE OR REPLACE FUNCTION public.inserta_pelicula
(
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
) RETURNS void AS
$BODY$
BEGIN
    INSERT INTO 
		public.pelicula
		(
			id_pelicula, 					
			id_calificacion_pelicula, 
			id_genero_pelicula, 
			id_reparto, 
			titulo_distribucion, 
			titulo_original, 
			idioma_original, 
			subtitulos_espanol, 
			ano_produccion, 
			duracion_minutos, 
			fecha_estreno, 
			resumen
		)
		VALUES 
		(
			NEXTVAL('id_pelicula_seq'),
			_id_calificacion_pelicula, 
			_id_genero_pelicula, 
			_id_reparto, 
			_titulo_distribucion, 
			_titulo_original, 
			_idioma_original, 
			_subtitulos_espanol, 
			_ano_produccion, 
			_duracion_minutos, 
			_fecha_estreno, 
			_resumen
		);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
ALTER FUNCTION public.inserta_pelicula(integer, integer, integer, character varying(100), character varying(100), character varying(100),boolean,numeric,integer,date,character varying(500))
  OWNER TO sa;
