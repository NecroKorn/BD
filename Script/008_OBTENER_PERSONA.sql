CREATE OR REPLACE FUNCTION public.obtener_persona(integer DEFAULT NULL)
  RETURNS SETOF persona AS
$BODY$
DECLARE

BEGIN
     IF $1 IS NULL THEN
         RETURN QUERY
	 SELECT 
		id_persona, 
		nombre_persona, 
		apellido_paterno, 
		apellido_materno
	 FROM public.persona;
     ELSE
         RETURN QUERY
	 SELECT 
		id_persona, 
		nombre_persona, 
		apellido_paterno, 
		apellido_materno
	 FROM public.persona where id_persona=$1;
     END IF; 
	 
 END      	 
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100
  ROWS 1000;
