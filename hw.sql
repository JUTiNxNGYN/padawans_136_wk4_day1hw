-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT * from actor

SELECT *
FROM actor
WHERE last_name LIKE 'Wahlberg';
-- 2

-- There are 2 Wahlbergs

-- 2. How many payments were made between $3.99 and $5.99?

SELECT * 
FROM payment
WHERE amount between 3.99 and 5.99;

-- 0

-- There are 0 payments between 3.99 and 5.99

-- 3. What film does the store have the most of? (search in inventory)

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY film_id

-- 1, 31, 69, 73, 86, 91, 103, 109, 127, 174, 193, 199, 200, 206, 220, 231, 239, 266, 295, 301, 331, 341, 350, 356, 358, 361, 369, 378, 382, 403, 412, 418, 434, 444, 460, 468, 489, 500, 525, 531, 559, 572, 586, 598, 609, 621, 638, 683, 697, 702, 730, 738, 745, 748, 753, 764, 767, 773, 789, 835, 846, 849, 856, 870, 873, 880, 893, 897, 911, 945, 973, 1000 have 8 rentals

-- 4. How many customers have the last name ‘William’?

SELECT *
FROM customer
WHERE last_name LIKE 'Williams';


-- 0 last name that ends with 'William', but 1 with last name 'Williams' and 1 last name with 'Williamsom'

-- 5. What store employee (get the id) sold the most rentals?

SELECT *
FROM rental
WHERE staff_id = 1

SELECT *
FROM rental
WHERE staff_id = 2

-- store employee 1: 8040
-- store employee 2: 8004

-- store employee 1 sold more rentals.

-- 6. How many different district names are there?

SELECT district
FROM address

-- There are 603 district names

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
ORDER BY film_id

-- film id 508 has the most actors in it


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT *
FROM customer
WHERE store_id = 1
HAVING last_name like 'es' -- does not work

-- There are 13 customer names having a last name with 'es'


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT amount, count(amount)
FROM payment
WHERE customer_id between 380 and 430
GROUP BY amount
HAVING count(amount) > 250

-- There are 3 payment methods: -415.01, -413.01, -411.01

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

SELECT rating
FROM film

-- There are 5 rating categories: G, PG, PG-13, NC-17, R

SELECT *
FROM film 
WHERE rating = 'G'

SELECT *
FROM film 
WHERE rating = 'PG'

SELECT *
FROM film 
WHERE rating = 'PG-13'

SELECT *
FROM film 
WHERE rating = 'NC-17'

SELECT *
FROM film 
WHERE rating = 'R'

-- 'G' = 178
-- 'PG' = 194
-- 'PG-13' = 224
-- 'NC-17' = 209
-- 'R' = 196

-- PG-13 has the highest movie total with a total of 224
