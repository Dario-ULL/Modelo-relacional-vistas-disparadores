CREATE VIEW view_list_films AS
SELECT 
    f.film_id AS identificador, 
    f.title AS titulo, 
    f.description AS descripcion, 
    c.name AS categoria, 
    f.rental_rate AS precio, 
    f.length AS duracion, 
    f.rating AS clasificacion,
    STRING_AGG(CONCAT(a.first_name, ' ', a.last_name), ', ') AS actores
FROM 
    film f
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id
JOIN 
    film_actor fa ON f.film_id = fa.film_id
JOIN 
    actor a ON fa.actor_id = a.actor_id
GROUP BY 
    f.film_id, f.title, f.description, c.name, f.rental_rate, f.length, f.rating;
