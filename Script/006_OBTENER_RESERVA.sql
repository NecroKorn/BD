CREATE OR REPLACE FUNCTION public.obtener_reserva(integer DEFAULT NULL)
  RETURNS SETOF reserva AS
$BODY$
DECLARE

BEGIN
     IF $1 IS NULL THEN
        RETURN QUERY
	SELECT 
		id_reserva, 
		id_funcion, 
		fecha_reserva, 
		vigente, 
		fecha_estado
	FROM public.reserva;
     ELSE
        RETURN QUERY
	SELECT 
		id_reserva, 
		id_funcion, 
		fecha_reserva, 
		vigente, 
		fecha_estado
	FROM public.reserva where id_reserva=$1;
     END IF;
END     		
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
