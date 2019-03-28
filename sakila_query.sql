-- 1. What query would you run to get all the customers inside city_id = 312? Your query should return customer first name, last name, email, and address.

SELECT customer.first_name, customer.last_name, customer.email, CONCAT(address, ' ', city, ', ', country) AS address
FROM customer
JOIN address 
ON address.address_id = customer.address_id
JOIN city
ON city.city_id = address.city_id
JOIN country
ON country.country_id = city.country_id
WHERE address.city_id = 312;

-- 2. What query would you run to get all comedy films? Your query should return film title, description, release year, rating, special features, and genre (category).

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genre
FROM film_category
JOIN film
ON film.film_id = film_category.film_id
JOIN category
ON category.category_id = film_category.category_id
WHERE category.name = "Comedy";

-- 3. What query would you run to get all the films joined by actor_id=5? Your query should return the actor id, actor name, film title, description, and release year.

SELECT actor.actor_id, CONCAT(actor.first_name, ' ', actor.last_name) AS actor, film.title, film.description, film.release_year
FROM film_actor
JOIN film
ON film.film_id = film_actor.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id = 5;

-- 4. What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)? Your query should return customer first name, last name, email, and address.

SELECT customer.first_name, customer.last_name, customer.email, CONCAT(address, ' ', city, ', ', country) AS address
FROM customer
JOIN address 
ON address.address_id = customer.address_id
JOIN city
ON city.city_id = address.city_id
JOIN country
ON country.country_id = city.country_id
JOIN store
ON store.store_id = customer.store_id
WHERE store.store_id = 1
ORDER BY customer.last_name ASC;

-- 5. What query would you run to get all the films with a "rating = G" and "special feature = behind the scenes", joined by actor_id = 15? Your query should return the film title, description, release year, rating, and special feature. Hint: You may use LIKE function in getting the 'behind the scenes' part.

SELECT film.title, film.description, film.release_year, film.rating, film.special_features
FROM film_actor
JOIN film
ON film.film_id = film_actor.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE film.rating = "G" AND film.special_features LIKE "%behind the scenes%" AND actor.actor_id = 15;

-- 6. What query would you run to get all the actors that joined in the film_id = 369? Your query should return the film_id, title, actor_id, and actor_name.

SELECT film.film_id, film.title, actor.actor_id, CONCAT(actor.first_name, ' ', actor.last_name) AS actor
FROM film_actor
JOIN film
ON film.film_id = film_actor.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE film.film_id = 369;

-- 7. What query would you run to get all drama films with a rental rate of 2.99? Your query should return film title, description, release year, rating, special features, and genre (category).

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genre
FROM film_category
JOIN film
ON film.film_id = film_category.film_id
JOIN category
ON category.category_id = film_category.category_id
WHERE category.name = "Drama" AND film.rental_rate = 2.99;

-- 8. What query would you run to get all the action films which are joined by SANDRA KILMER? Your query should return film title, description, release year, rating, special features, genre (category), and actor's first name and last name.

SELECT film.title, film.description, film.release_year, film.special_features, category.name AS genre, actor.first_name, actor.last_name
FROM film_category
JOIN film
ON film.film_id = film_category.film_id
JOIN category
ON category.category_id = film_category.category_id
JOIN film_actor
ON film_category.film_id = film_actor.film_id
-- JOIN film
-- ON film.film_id = film_actor.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE category.name = "action" AND actor.first_name = 'SANDRA' AND actor.last_name = 'KILMER';


