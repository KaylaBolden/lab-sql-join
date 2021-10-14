-- 1.List number of films per category.
select c.name
,count(*)
from sakila.film_category fc
left join sakila.category c
on fc.category_id=c.category_id
group by
c.name;

-- 2.Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address 
from sakila.staff s
inner join sakila.address a 
on s.address_id=a.address_id;

-- 3.Display the total amount rung up by each staff member in August of 2005.
select s.first_name, sum(amount)
from sakila.staff s 
inner join sakila.payment p
on s.staff_id=p.staff_id
group by s.first_name;

-- 4.List each film and the number of actors who are listed for that film.
select f.title, count(fa.actor_id) as actorCount
from sakila.film f
inner join sakila.film_actor fa
on f.film_id = fa.film_id
group by f.title
order by actorCount desc;

-- 5.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.customer_id, c.first_name, c.last_name, sum(p.amount)
from sakila.customer c
inner join sakila.payment p
on c.customer_id=p.customer_id
group by c.customer_id, c.first_name, c.last_name
order by c.last_name;