CREATE OR REPLACE FUNCTION public.obtener_cine(integer DEFAULT NULL)
  RETURNS SETOF cine AS $$
DECLARE

BEGIN
      IF $1 IS NULL THEN
         RETURN QUERY
	 SELECT id_cine, direccion, nombre_cine FROM cine; 
      ELSE
         RETURN QUERY
      	 SELECT id_cine, direccion, nombre_cine FROM cine  where id_cine = $1; 
      END IF;	

END
$$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100
  ROWS 1000;
