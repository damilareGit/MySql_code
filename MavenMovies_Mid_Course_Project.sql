use mavenmovies;

/*
1.	We will need a list of all staff members, including their first and last names, 
email addresses, and the store identification number where they work. 
*/ 
select store_id, first_name, last_name, 
	email
from staff;

/*
2.	We will need separate counts of inventory items held at each of your two stores. 
*/ 
select store_id,
	count(inventory_id) as 'inventory_items_in_store'
from inventory
group by 1;

/*
3.	We will need a count of active customers for each of your stores. Separately, please. 
*/
select store_id, 
	count(case when active = 1 then store_id else null end) as 'active_customers'
from customer
group by store_id;

/*
4.	In order to assess the liability of a data breach, we will need you to provide a count 
of all customer email addresses stored in the database. 
*/
select count(email) as 'emails'
from customer;

/*
5.	We are interested in how diverse your film offering is as a means of understanding how likely 
you are to keep customers engaged in the future. Please provide a count of unique film titles 
you have in inventory at each store and then provide a count of the unique categories of films you provide. 
*/
select 
	store_id, 
    count(distinct film_id) as unique_films
from inventory
group by 
	store_id; 
	
select 
	count(distinct name) as unique_categories
from category;

/*
6.	We would like to understand the replacement cost of your films. 
Please provide the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry. ``	
*/
select
	min(replacement_cost) as 'least_expensive',
    max(replacement_cost) as 'most_expensive',
    avg(replacement_cost) as 'average_cost'
from film;

/*
7.	We are interested in having you put payment monitoring systems and maximum payment 
processing restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you process, as well as the maximum payment you have processed.
*/
select
	avg(amount) as 'average_payment_processed',
    max(amount) as 'maximum_payment_processed'
from payment;

/*
8.	We would like to better understand what your customer base looks like. 
Please provide a list of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/
select customer_id,
	count(rental_id) as 'number_of_rentals'
from rental
group by 1
order by 2 desc;
