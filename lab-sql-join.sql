use sakila;

-- 1. List the number of films per category.
select cat.name, sum(f_cat.category_id) as 'number of films'
from sakila.category as cat
join sakila.film_category f_cat
on cat.category_id = f_cat.category_id
group by cat.name
order by cat.name;

-- 2. Display the first and the last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address
from sakila.staff s
join sakila.address a
on s.address_id = a.address_id;

-- 3. Display the total amount rung up by each staff member in August 2005.
select s.staff_id, s.first_name, s.last_name, sum(p.amount) as 'amount rung up'
from sakila.staff s
join sakila.payment p
on s.staff_id = p.staff_id
where month(p.payment_date) = 8 and year(p.payment_date) = 2005
group by s.staff_id, s.first_name, s.last_name;

-- 4. List all films and the number of actors who are listed for each film.
select f.film_id, f.title, sum(f_act.actor_id) as 'number of actors'
from sakila.film f
join film_actor f_act
on f.film_id = f_act.film_id
group by f.film_id, f.title;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select c.customer_id, c.first_name, c.last_name, sum(p.amount) as 'total amount paid'
from sakila.customer c
join sakila.payment p
on c.customer_id = p.customer_id
group by c.customer_id, c.first_name, c.last_name
order by c.last_name;