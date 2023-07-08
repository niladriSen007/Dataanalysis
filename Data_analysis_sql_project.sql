/* Q1: Who is the senior most employee based on job title? */

SELECT title, last_name, first_name 
FROM employee
ORDER BY levels DESC
LIMIT 1;



/* Q2: Which countries have the most Invoices? */
select billing_country,count(customer_id) c from invoice group by billing_country order by c desc limit 1;


/* Q3: What are top 3 values of total invoice? */
select total from invoice order by total desc limit 3;


/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */
select billing_country,count(customer_id) Invoice_total from invoice group by billing_country order by Invoice_total desc limit 1;


/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/
-- select * from invoice;
-- select * from customer;
select c.customer_id,c.first_name,c.last_name,sum(total) as Total_spend from customer c , invoice i where c.customer_id = i.customer_id group by c.customer_id order by Total_spend desc limit 1;


