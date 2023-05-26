-- Maven movies database analysis file 1
-- AGGREGATION, CASE STATEMENTS, JOINS USED

use mavenmovies;

SELECT 
    *
FROM
    Rental;

SELECT 
    *
FROM
    inventory;

SELECT 
    first_name, last_name, email
FROM
    customer;
    
SELECT 
    *
FROM
    film;

SELECT DISTINCT
    rental_duration
FROM
    film;

SELECT 
    *
FROM
    payment;

SELECT 
    payment_id, customer_id, amount, payment_date
FROM
    payment
WHERE
    amount = 0.99;

SELECT 
    payment_id, customer_id, amount, payment_date
FROM
    payment
WHERE
    payment_date > '2006-01-01';

SELECT 
    payment_id, customer_id, rental_id amount, payment_date
FROM
    payment
WHERE
    customer_id < '100';

SELECT 
    *
FROM
    payment
WHERE
    customer_id < 100;

SELECT 
    *
FROM
    payment
WHERE
    customer_id BETWEEN 1 AND 100;

SELECT 
    *
FROM
    PAYMENT
WHERE
    AMOUNT = 0.99
        AND PAYMENT_DATE > 2005 - 05 - 25;

SELECT 
    CUSTOMER_ID, PAYMENT_ID, AMOUNT, PAYMENT_DATE
FROM
    PAYMENT
WHERE
    CUSTOMER_ID < 101 AND AMOUNT >= 5
        AND PAYMENT_DATE > 2006 - 01 - 01;

SELECT 
    CUSTOMER_ID, PAYMENT_ID, AMOUNT, RENTAL_ID, PAYMENT_DATE
FROM
    PAYMENT
WHERE
    AMOUNT > 5 OR CUSTOMER_ID = 42
        OR CUSTOMER_ID = 53
        OR CUSTOMER_ID = 60
        OR CUSTOMER_ID = 75;

SELECT 
    CUSTOMER_ID, PAYMENT_ID, AMOUNT, RENTAL_ID, PAYMENT_DATE
FROM
    PAYMENT
WHERE
    AMOUNT > 5
        OR CUSTOMER_ID IN (42 , 53, 60, 75);

SELECT 
    title, special_features
FROM
    film
WHERE
    special_features LIKE '%Behind the Scenes%';

SELECT 
    rating, COUNT(film_id)
FROM
    FILM
GROUP BY rating;
 
SELECT 
    *
FROM
    film;
 
SELECT 
    title, COUNT(film_id)
FROM
    film
GROUP BY title;
 
 -- ASSIGNMENT
 
SELECT 
    RENTAL_DURATION,
    COUNT(TITLE) AS 'FILM WITH THIS RENTAL DURATION'
FROM
    FILM
GROUP BY RENTAL_DURATION;
 
SELECT 
    *
FROM
    FILM;

SELECT 
    rating, COUNT(film_id), COUNT(film_id) AS ALIAS
FROM
    FILM
GROUP BY rating;
 
SELECT 
    *
FROM
    film;
 
SELECT 
    rating,
    rental_duration,
    COUNT(film_id) AS 'FILM WITH THIS DURATION'
FROM
    film
GROUP BY rating , rental_duration;

SELECT 
    RATING,
    RENTAL_DURATION,
    COUNT(FILM_ID) AS 'FILM ID',
    MIN(LENGTH) AS 'SHORTEST FILM',
    MAX(LENGTH) AS 'LONGEST FILM',
    AVG(RENTAL_DURATION) AS 'AVG RENTAL DURATION LENGTH',
    SUM(LENGTH) AS 'TOTAL LENGTH'
FROM
    FILM
GROUP BY RATING , RENTAL_DURATION;

-- ASSIGNMENT

SELECT 
    COUNT(FILM_ID),
    REPLACEMENT_COST,
    MIN(RENTAL_RATE) AS 'cheapest cost',
    MAX(RENTAL_RATE) AS 'higher cost',
    AVG(RENTAL_RATE) AS 'average cost'
FROM
    FILM
GROUP BY REPLACEMENT_COST;

SELECT 
    customer_id, COUNT(rental_id) AS 'total rentals'
FROM
    rental
GROUP BY customer_id
HAVING COUNT(rental_id) < 30;

SELECT 
    customer_id, COUNT(rental_id) AS 'total rental'
FROM
    rental
GROUP BY customer_id
HAVING COUNT(rental_id) < 15;

SELECT 
    CUSTOMER_ID, RENTAL_ID, PAYMENT_ID, AMOUNT
FROM
    PAYMENT
ORDER BY CUSTOMER_ID DESC;

SELECT 
    CUSTOMER_ID, SUM(AMOUNT) AS 'TOTAL AMOUNT'
FROM
    PAYMENT
GROUP BY CUSTOMER_ID
ORDER BY SUM(AMOUNT) DESC;

SELECT 
    *
FROM
    FILM;

SELECT 
    TITLE, LENGTH, RENTAL_RATE
FROM
    FILM
ORDER BY LENGTH DESC;

SELECT DISTINCT
    TITLE,
    CASE
        WHEN RENTAL_DURATION >= 4 THEN 'TOO SHORT PERIOD'
        WHEN RENTAL_RATE > 3.99 THEN 'TOO EXPENSIVE'
        WHEN RATING IN ('NC-17' , 'R') THEN 'FOR ADULTS'
        WHEN LENGTH BETWEEN 60 AND 90 THEN 'TOO SHORT OR TOO LONG'
        WHEN DESCRIPTION LIKE '%Shark%' THEN 'SHARK MOVIE SO NO'
        ELSE 'GOOD MOVIE TO WATCH'
    END AS 'FIT FOR RECOMMENDATION'
FROM
    FILM;

SELECT 
    *
FROM
    CUSTOMER;

SELECT DISTINCT
    FIRST_NAME,
    LAST_NAME,
    CASE
        WHEN STORE_ID = 1 AND ACTIVE = 1 THEN 'STORE 1 ACTIVE'
        WHEN STORE_ID = 1 AND ACTIVE = 0 THEN 'STORE 1 INACTIVE'
        WHEN STORE_ID = 2 AND ACTIVE = 1 THEN 'STORE 2 ACTIVE'
        WHEN STORE_ID = 2 AND ACTIVE = 0 THEN 'STORE 2 INACTIVE'
        ELSE 'CHECK LOGIC'
    END AS 'ACTIVE AND INACTIVE USER'
FROM
    CUSTOMER;

SELECT 
    *
FROM
    CUSTOMER;

SELECT 
    STORE_ID,
    COUNT(CASE
        WHEN ACTIVE = 1 THEN CUSTOMER_ID
        ELSE NULL
    END) AS 'ACTIVE',
    COUNT(CASE
        WHEN ACTIVE = 0 THEN CUSTOMER_ID
        ELSE NULL
    END) AS 'INACTIVE'
FROM
    CUSTOMER
GROUP BY STORE_ID;


SELECT DISTINCT
    inventory.inventory_id,
    rental_date,
    customer_id,
    film_id,
    store_id
FROM
    inventory
        JOIN
    rental ON inventory.inventory_id = rental.inventory_id;

SELECT 
    inventory_id, store_id, title, description
FROM
    inventory
        JOIN
    film ON film.film_id = inventory.film_id;

SELECT 
    inventory_id, store_id, film.title, film.description
FROM
    inventory
        INNER JOIN
    film ON inventory.film_id = film.film_id;

-- store_id common, from customer store table, bring last_update
-- first name , last name , email,active

SELECT 
    store.store_id,
    store.last_update AS 'store last update',
    customer.last_update AS 'customer last update',
    customer.active,
    customer.first_name,
    customer.last_name,
    customer.email
FROM
    store
        JOIN
    customer ON store.store_id = customer.store_id
LIMIT 5000;

/* Inner join
Inner join: You would use an inner join when you want to 
retrieve only the matching rows between two tables.
for example :- tables customer | payment , so with these 2 tables i can find out
payment history, rental history (payment) with customer name email , etc*/

SELECT 
    *
FROM
    customer;

SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active,
    customer.last_update,
    payment.payment_id,
    payment.amount,
    payment.payment_date,
    payment.last_update
FROM
    customer
        JOIN
    payment ON customer.customer_id = payment.customer_id;
-- limit 5;
-- join payment on customer.last_update = payment.last_update;


SELECT 
    CITY.CITY_ID, CITY.CITY, COUNTRY.COUNTRY_ID, COUNTRY.COUNTRY
FROM
    CITY
        LEFT JOIN
    COUNTRY ON COUNTRY.COUNTRY_ID = CITY.COUNTRY_ID;


/* RIGHT join
RIGHT join: You would use a RIGHT join when you want to retrieve all the rows 
from the RIGHT table and any matching rows from the LEFT table
RIGHT JOIN = INNER JOIN + REMAINING RECORDS FROM RIGHT TABLE
HERE WE HAVE CONNECTED/JOIN PAYMENT COL. WITH RENTAL TABLE
JOINED STAFF_ID AND RETURN_DATE WITH PAYMENT TABLE */

SELECT 
    RENTAL.RENTAL_ID,
    RENTAL.STAFF_ID,
    RENTAL.RETURN_DATE,
    PAYMENT.PAYMENT_ID,
    PAYMENT.STAFF_ID,
    PAYMENT.CUSTOMER_ID,
    PAYMENT.AMOUNT
FROM
    RENTAL
        RIGHT JOIN
    PAYMENT ON RENTAL.RENTAL_ID = PAYMENT.RENTAL_ID;

/*Full outer join: You would use a full outer join when you want to 
retrieve all rows from both tables, whether they have a match or not.
 This means that any rows in either table that do not have a match in the
 other table will still be included in the result set.
 FULL OUTER JOIN = INNER JOIN
   + INNER JOIN + REMAINING RECORDS FROM RIGHT TABLE
   + INNER JOIN + REMAINING RECORDS FROM LEFT TABLE
   JOIN STAFF TABLE WITH STORE TABLE*/
   
SELECT 
    s.STAFF_ID,
    s.FIRST_NAME,
    s.LAST_NAME,
    s.PICTURE,
    s.ACTIVE,
    st.STORE_ID,
    st.MANAGER_STAFF_ID,
    st.ADDRESS_ID,
    st.LAST_UPDATE
FROM
    STAFF s
        LEFT JOIN
    STORE st ON s.STAFF_ID = st.MANAGER_STAFF_ID 
UNION ALL SELECT 
    s.STAFF_ID,
    s.FIRST_NAME,
    s.LAST_NAME,
    s.PICTURE,
    s.ACTIVE,
    st.STORE_ID,
    st.MANAGER_STAFF_ID,
    st.ADDRESS_ID,
    st.LAST_UPDATE
FROM
    STORE st
        LEFT JOIN
    STAFF s ON st.MANAGER_STAFF_ID = s.STAFF_ID
WHERE
    s.STAFF_ID IS NULL;

-- MYSQL DO NOT SUPPORT FULL OUTER JOIN INSTED WE USE UNION AS A JOIN

SELECT 
    f.title, COUNT(fa.actor_id) AS 'Number of actors'
FROM
    film f
        RIGHT JOIN
    film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title;

-- Bridging the tables

SELECT 
    a.first_name, a.last_name, f.title
FROM
    actor a
        JOIN
    film_actor fa ON a.actor_id = fa.actor_id
        JOIN
    film f ON f.film_id = fa.film_id
ORDER BY a.first_name ASC;

/*MULTI CONDITION JOIN
if you ever come across a situation where you only want to
make the join happen for some very specific conditions which have multiple criteria.
YOU CAN USE MULTIPLE 'AND' & 'OR' CONDTITION

ASSIGMENT ON MULTI CONDITION JOIN

YOU want to pull a list of the distinct titles and their descriptions, 
which are currently available in inventory at store 2.*/

SELECT DISTINCT
    F.TITLE, F.DESCRIPTION
FROM
    FILM F
        JOIN
    INVENTORY I ON F.FILM_ID = I.FILM_ID AND I.STORE_ID = 2
ORDER BY F.TITLE;

/* UNION AND UNION ALL

UNION
WE CAN USE UNION TO COMBINE TWO TABLES. Union returns all data from your first table 
via your first select statement.And then all data from your second table appended to 
the end. instead of combining a left table and a right table, you're basically stacking 
two results on top of each other.
UNION DO NOT ALLOW DUPLICATION IN RECORD
FOR DUPLICATE RECORD TO ENTER INTO THE RESULT UNION ALL IS USED
CONDITIONS
keep in mind your two select statements are going to need to have the same number of columns.
Those columns need to be in the same order.
And the columns in each table that you're selecting from are going to need to have the 
same data type*/

SELECT 
    'ADVISOR' TYPE, A.FIRST_NAME, A.LAST_NAME
FROM
    ADVISOR A 
UNION SELECT 
    'INVESTOR' TYPE, I.FIRST_NAME, I.LAST_NAME
FROM
    INVESTOR I;

/* ASSIGMENT ON UNION 
Uncle Jimmy, says you're going to be hosting a meeting with all of your staff
and advisers, and he needs a list of all of their names and wants a column noting 
whether they're a staff member or an adviser*/

SELECT 
    'ADVISOR' AS MEMBER, FIRST_NAME, LAST_NAME
FROM
    ADVISOR 
UNION SELECT 
    'STAFF' AS MEMBER, FIRST_NAME, LAST_NAME
FROM
    STAFF;

