SELECT 
    a.actor_id AS id_actor, 
    CONCAT(a.first_name, ' ', a.last_name) AS actor, 
    STRING_AGG(CONCAT(c.name, ': ', f.title), ', ') AS categorias_peliculas
FROM 
    actor a
JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
JOIN 
    film f ON fa.film_id = f.film_id
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id
GROUP BY 
    a.actor_id, actor;
