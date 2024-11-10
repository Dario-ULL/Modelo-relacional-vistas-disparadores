-- Crear tabla de registro de inserciones
CREATE TABLE IF NOT EXISTS film_inserts_log (
    film_id INTEGER PRIMARY KEY,
    fecha_insercion TIMESTAMP NOT NULL
);

-- Crear función para el disparador
CREATE OR REPLACE FUNCTION log_film_insert() 
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO film_inserts_log (film_id, fecha_insercion)
    VALUES (NEW.film_id, NOW());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear disparador que llama a la función después de cada inserción en 'film'
CREATE TRIGGER after_film_insert
AFTER INSERT ON film
FOR EACH ROW
EXECUTE FUNCTION log_film_insert();
