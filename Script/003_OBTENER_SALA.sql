DROP FUNCTION IF EXISTS OBTENER_SALA();

CREATE FUNCTION OBTENER_SALA()
RETURNS SETOF public.sala AS
$BODY$
	SELECT 
		id_sala,
		id_cine,
		numero_sala,
		cantidad_butacas
  FROM public.sala;
$BODY$
LANGUAGE 'sql'
