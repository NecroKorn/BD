DROP FUNCTION IF EXISTS OBTENER_BUTACA_RESERVADA();

CREATE FUNCTION OBTENER_BUTACA_RESERVADA()
RETURNS SETOF public.butaca_reservada AS
$BODY$
	SELECT id_butaca, id_reserva, numero_butaca_reservada FROM public.butaca_reservada;
$BODY$
LANGUAGE 'sql'
