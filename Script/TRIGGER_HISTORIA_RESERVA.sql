CREATE OR REPLACE FUNCTION TRIGGER_HISTORIA_RESERVA() RETURNS TRIGGER AS $AUDITA_HISTORIA_RESERVA$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
		--SELECT INSERTA_HISTORIA_RESERVA('D', now(), OLD.id_reserva);
		INSERT INTO public.historia_reserva
			(id_historia, operacion, fecha_proceso, id_reserva)
			VALUES (NEXTVAL('id_historia_seq'), 'D', current_date, OLD.id_reserva);
		RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
		--SELECT INSERTA_HISTORIA_RESERVA('U', now(), NEW.id_reserva);
		INSERT INTO public.historia_reserva
			(id_historia, operacion, fecha_proceso, id_reserva)
			VALUES (NEXTVAL('id_historia_seq'), 'U', current_date, NEW.id_reserva);
		RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
		--SELECT INSERTA_HISTORIA_RESERVA('I', now(), CURRVAL('id_reserva_seq'));
		INSERT INTO public.historia_reserva
			(id_historia, operacion, fecha_proceso, id_reserva)
			VALUES (NEXTVAL('id_historia_seq'), 'I', current_date, CURRVAL('id_reserva_seq'));
		RETURN NEW;
        END IF;
        RETURN NULL;
    END;
$AUDITA_HISTORIA_RESERVA$ LANGUAGE plpgsql;

CREATE TRIGGER AUDITA_HISTORIA_RESERVA
AFTER INSERT OR UPDATE OR DELETE ON RESERVA
    FOR EACH ROW EXECUTE PROCEDURE TRIGGER_HISTORIA_RESERVA();