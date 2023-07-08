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


/* Question Set 2 - Moderate */

/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

/*Method 1 */
select distinct c.first_name,c.last_name,c.email 
from track t , genre g,invoice_line iv,invoice i,customer c
where c.customer_id=i.customer_id and
i.invoice_id=iv.invoice_id and 
iv.track_id=t.track_id and
g.genre_id=t.genre_id and 
g.genre_id = (select genre_id from genre where name like('Rock')) order by c.email ;




/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */
select distinct ar.artist_id,ar.name,count(t.track_id) as Track_count from track t,album a,artist ar where
t.album_id=a.album_id and 
a.artist_id=ar.artist_id 
and t.genre_id =(select genre_id from genre where name like('Rock')) group by ar.name,ar.artist_id order by Track_count desc limit 10;



/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */
select name,milliseconds from track where milliseconds > (select avg(milliseconds) from track) order by milliseconds desc;



