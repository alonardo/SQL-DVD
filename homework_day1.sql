-- 1. How many actors are there with the last name ‘Wahlberg’? 

SELECT COUNT(actor)
FROM actor
WHERE last_name = 'Wahlberg';
-- Answer: 2

-- 2. How many payments were made between $3.99 and $5.99? 

SELECT COUNT(amount)
FROM payment
WHERE amount >= 3.99 and amount <= 5.99;
-- Answer: 5602

-- 3. What film does the store have the most of? (search in inventory) 

SELECT film.title, inventory.film_id, COUNT(inventory.film_id) as num_in_inventory
FROM film, inventory
WHERE film.film_id = inventory.film_id
GROUP BY inventory.film_id, film.title
HAVING COUNT(inventory.film_id) = 8;
-- Answer: I had a hard time with this one. I need data from two different tables. 
-- Several films are tied for the most amount of inventory in the store.
-- I couldn't get the MAX aggregate to work so I used COUNT = 8 after I was
-- able to filter and see that 8 was the highest amount.

-- 4. How many customers have the last name ‘William’? 

SELECT customer
FROM customer
WHERE last_name = 'William'
-- Answer: 0. 
-- None of the customers have the last name 'William', but some have close variations.

-- 5. What store employee (get the id) sold the most rentals? 

SELECT rental.staff_id, staff.first_name, staff.last_name, COUNT(rental.staff_id)
FROM rental, staff
WHERE rental.staff_id = staff.staff_id
GROUP BY staff.first_name, staff.last_name, rental.staff_id
HAVING COUNT(rental.staff_id) = 8040

-- Answer: Mike Hilyer sold the most rentals. Similar to question 3, I couldn't get
-- the MAX function to work on rental.staff_id.

-- 6. How many different district names are there? 

SELECT COUNT(DISTINCT district)
FROM address

-- Answer 378.

-- 7. What film has the most actors in it? (use film_actor table and get film_id) 

SELECT film_actor.film_id, film.title, COUNT(film_actor.film_id)
FROM film_actor, film
WHERE film.film_id = film_actor.film_id
GROUP BY film_actor.film_id, film.title
HAVING COUNT(film_actor.film_id) = 15

-- Answer: 'Lambs Cincinatti' has the most actors in it (15).
-- Same thing as before, I can't get the MAX function to work!

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 

SELECT store_id, COUNT(last_name)
FROM customer
WHERE last_name LIKE '_%es' AND store_id = 1
GROUP BY store_id;

-- Answer: 13

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  
   -- with ids between 380 and 430? (use group by and having > 250) 

SELECT amount, COUNT(customer_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(customer_id) > 250;

-- Answer: 3. 

-- 10. Within the film table, how many rating categories are there? 
-- And what rating has the most movies total?

SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;

--Answer: 5 rating categories, PG-13 has the most movies.
