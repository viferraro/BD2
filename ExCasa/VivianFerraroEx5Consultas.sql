#Exercícios de revisão No 5
USE sakila;

#a
select c.first_name, c.last_name, a.first_name, a.last_name
from customer c left outer join actor a
on c.first_name = a.first_name and c.last_name = a.last_name;

#b
select c.first_name, c.last_name, a.first_name, a.last_name
from customer c right outer join actor a
on c.first_name = a.first_name and c.last_name = a.last_name;

#c
select a.first_name, a.last_name, c.first_name, c.last_name
from actor a inner join customer c
on c.last_name = a.last_name;

#d
select c.city, co.country
from city c left outer join country co
on c.country_id = co.country_id;

#e
select f.title, f.description, f.release_year, l.name
from film f left outer join language l
on f.language_id = l.language_id;

#f
select s.first_name, s.last_name, a.address, c.city, a.district, a.postal_code
from staff s inner join address a
on s.address_id = a.address_id
inner join city c
on a.city_id = c.city_id;
