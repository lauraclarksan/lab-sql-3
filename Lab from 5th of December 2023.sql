-- Lab 3 Unit 2
-- 1. How many distinct (different) actors' last names are there?
select count(distinct last_name) as number_of_last_name from actor;

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id) as languages_produced from film;

-- 3. How many movies were released with "PG-13" rating?
select count(rating) from sakila.film where rating = "PG-13";

-- 4. Get 10 the longest movies from 2006.
select * from sakila.film order by length desc limit 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?
select datediff(curdate(), create_date) as operating_days from customer limit 1;

-- 6. Show rental info with additional columns month and weekday. Get 20
select rental_date, date_format(rental_date, "%m") as month, date_format(rental_date, "%W") as weekday from sakila.rental limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week
select rental_date, date_format(rental_date, "%m") as month, date_format(rental_date, "%W") as weekday,
case
when date_format(rental_date, "%W") = "Saturday" then "weekend"
when date_format(rental_date, "%W") = "Sunday" then "weekend"
else "workday"
end as day_type
from sakila.rental;

-- 8. How many rentals were in the last month of activity?
select date_format(max(payment_date), "%m") as last_month_of_activity, date_format(max(payment_date), "%Y") as last_year_of_activity from sakila.payment;
select count(rental_date) from sakila.rental where date_format(rental_date, "%m") = '02' and date_format(rental_date, "%Y") = '2006';