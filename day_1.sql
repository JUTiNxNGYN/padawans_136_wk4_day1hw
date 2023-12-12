-- this is a comment!
-- the same shortcuts still work

-- Our "hello world!" sql version:

SELECT * 
FROM actor;


SELECT first_name, last_name
FROM actor;


SELECT first_name, last_name
FROM actor
WHERE first_name = 'Bob';
-- STRINGS in sql --->  use SINGLE QUOTES   double quotes are for database identifiers
-- SINGLE quotes = strings
-- DOUBLE quotes = DB


-- WHERE clause
--  let's us filter the table's results with a condition
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE "Bob"; -- double quotes here throw an error

-- LIKE  is used WHERE 
--  now we can use things other than a literal string


-- MODULO:
-- this % is a true wildcard for strings in sql
-- ANY number of characters


SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'B%';

-- UNDERSCORE:
-- _    is the wildcard for exactly one character

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'B___%';

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'B__';


-- Comparison operators

--    =   and LIKE as shown above
--     Greater  >    less   <
--      with equals?  yep    >=     or   <=
--     NOT equal <>


SELECT * 
FROM payment;

SELECT customer_id, amount
FROM payment
WHERE amount > 0;

SELECT customer_id, amount
FROM payment
WHERE amount < 0;

SELECT customer_id, amount
FROM payment
WHERE amount <= -411.01; -- INCLUSIVE


SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2 AND 200;

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN -500 AND -400;

SELECT customer_id, amount
FROM payment
WHERE amount > 200 or amount < -400

SELECT customer_id, amount
FROM payment
WHERE amount > 2
ORDER BY amount DESC  -- ASC by default but put descending in

SELECT customer_id, amount
FROM payment
WHERE amount <> -406.01
ORDER BY amount DESC

-- Let's reiterate- ORDER MATTERS!!!!

-- select
-- from 
-- where
-- order by

SELECT customer_id, amount
FROM payment
WHERE amount <> -406.01  --NOT equal  this is the sql version of != in python
ORDER BY amount DESC


select * 
from payment

select * 
from payment
where amount > 200
ORDER BY amount

select * 
from customer



select first_name, last_name, email
from customer
where customer_id = 1


-- AGGREGATIONS
-- SUM(), AVG(), COUNT(), MIN(), MAX()


select * from payment

SELECT SUM(amount)
FROM payment;

SELECT AVG(amount)
FROM payment
where amount < -400


SELECT COUNT(amount)
FROM payment
where amount = -411.01;

SELECT MAX(amount)
FROM payment

SELECT MIN(amount)
FROM payment


SELECT COUNT(DISTINCT amount) -- counts unique values
FROM payment
where amount > 2;

SELECT COUNT(DISTINCT amount) AS unique_pos_value --aliasing
FROM payment
where amount > 2;

-- GROUP BY
-- any column selected not in aggregate must be in group by
-- used with aggregates to modify how the rows go together

SELECT amount, COUNT(amount), SUM(amount)
from payment
GROUP BY amount
ORDER BY SUM(amount) DESC


SELECT amount
FROM payment
WHERE amount = -416.00

SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY COUNT(amount) DESC



select *
FROM customer
WHERE email LIKE '%.white@%.org'

SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE '%.white@%.org'
GROUP BY email
HAVING COUNT(customer_id) > 0  -- having is like where, but for aggregates.  it HAS to be in this order




SELECT customer_id, SUM(amount)  -- what columns do we want to see/use?
FROM payment                    -- from what table?
                -- these are our basic building blocks!
WHERE customer_id BETWEEN 1 and 198  -- how? or filter for our columns
GROUP BY customer_id            -- using aggregates with other columns???
HAVING SUM(amount) < 0          -- filtering based on an aggregate
                                -- CAN'T come before the group by
ORDER BY customer_id            -- changing how our returned table looks
-- constraints?

LIMIT 5  -- just a constraint on results
OFFSET 5  -- chops off the number of rows specified, very niche and kinda rare



-- where allows us to modify/filter the results of the select 
-- specifically with our normal columns 

-- we have another clause that allows us to similarly filter the results of an aggregates 
-- HAVING lets us apply a conditional filtering an aggregate
-- WHERE is to SELECTING a normal column like HAVING is to an AGGREGATE
-- a having clause would appear directly after a group by 


-- ORDER OF CLAUSES IF USING EVERYTHING:
-- select <columns> <aggregates>
-- from <table>
-- where <conditional>
-- group by <columns>
-- having <conditional>
-- order by <column>
-- constraints 