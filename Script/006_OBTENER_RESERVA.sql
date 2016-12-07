DROP FUNCTION IF EXISTS OBTENER_RESERVA();

CREATE FUNCTION OBTENER_RESERVA()
RETURNS SETOF public.reserva AS
$BODY$
	SELECT 
		id_reserva, 
		id_funcion, 
		fecha_reserva, 
		vigente, 
		fecha_estado
	FROM public.reserva;
$BODY$
LANGUAGE 'sql';
