-- Crear tabla de registro de eliminaciones
CREATE TABLE film_deletes_log (
    film_id INTEGER PRIMARY KEY,
    fecha_eliminacion TIMESTAMP NOT NULL
);

-- Crear función para el disparador
CREATE OR REPLACE FUNCTION log_film_delete() 
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO film_deletes_log (film_id, fecha_eliminacion)
    VALUES (OLD.film_id, NOW());
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;


-- Crear disparador que llama a la función después de cada eliminacion en 'film'
CREATE TRIGGER after_film_delete
AFTER DELETE ON film
FOR EACH ROW
EXECUTE FUNCTION log_film_delete();
