SELECT 
    s.store_id AS tienda, 
    CONCAT(ci.city, ', ', co.country) AS ubicacion,
    CONCAT(st.first_name, ' ', st.last_name) AS encargado, 
    SUM(p.amount) AS ventas_totales
FROM 
    payment p
JOIN 
    rental r ON p.rental_id = r.rental_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    store s ON i.store_id = s.store_id
JOIN 
    address a ON s.address_id = a.address_id
JOIN 
    city ci ON a.city_id = ci.city_id
JOIN 
    country co ON ci.country_id = co.country_id
JOIN 
    staff st ON s.manager_staff_id = st.staff_id
GROUP BY 
    s.store_id, ubicacion, encargado
ORDER BY 
    ventas_totales DESC;
