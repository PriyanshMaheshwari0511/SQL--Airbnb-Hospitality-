show databases;

use fingertips;

#Q1 Import Data from both the .CSV files to create tables, Listings and Booking Details.
show tables;
select * from listings;
select * from booking_details;

#Q2 Write a query to show names from Listings table
select name from Listings;

#Q3 Write a query to fetch total listings from the listings table
select count(id) from listings;

#Q4 Write a query to fetch total listing_id from the booking_details table
select count(listing_id) from booking_details;

#Q5 Write a query to fetch host ids from listings table
select host_id from listings;

#Q6 Write a query to fetch all unique host name from listings table
select distinct host_name from listings;

#Q7 Write a query to show all unique neighbourhood_group from listings table
select distinct neighbourhood_group  from listings;

#Q8 Write a query to show all unique neighbourhood from listings table
select distinct neighbourhood  from listings;

#Q9 Write a query to fetch unique room_type from listings tables
select distinct room_type from listings;

#Q10 Write a query to show all values of Brooklyn & Manhattan from listings tables
select * from listings where neighbourhood_group in ('Brooklyn','Manhattan');

#Q11 Write a query to show maximum price from booking_details table
select max(price) from booking_details;

#Q12 Write a query to show minimum price fron booking_details table
select min(price) from booking_details; 

#Q13 Write a query to show average price from booking_details table
select avg(price) from booking_details;

#Q14 Write a query to show minimum value of  minimum_nights from booking_details table
select min(minimum_nights) from booking_details;

#Q15 Write a query to show maximum value of minimum_nights from booking_details table
select max(minimum_nights) from booking_details;

#Q16 Write a query to show average availability_365 
select avg(availability_365) from booking_details;

#Q17 Write a query to show id , availability_365 and all availability_365 values greater than 300
select listing_id , availability_365 from booking_details where availability_365 >300;

#Q18 Write a query to show count of id where price is in between 300 to 400
select count(listing_id) from booking_details where price between 300 and 400;

#Q19 Write a query to show count of id  where minimum_nights spend is less than 5
select count(listing_id) from booking_details where minimum_nights <5;

#Q20 Write a query to show count where minimum_nights spend is greater than 100
select count(listing_id) from booking_details where minimum_nights >100;

#Q21 Write a query to show all data of listings & booking_details
select * from listings inner join booking_details on listings.id = booking_details.listing_id;

#Q22 Write a query to show host name and price 
select listings.host_name , booking_details.price 
from listings inner join booking_details on listings.id = booking_details.listing_id;

#Q23 Write a query to show room_type and price
select  listings.room_type,booking_details.price 
from listings inner join booking_details on listings.id = booking_details.listing_id;

#Q24 Write a query to show neighbourhood_group & minimum_nights spend
select  listings.neighbourhood_group ,booking_details.minimum_nights 
from listings inner join booking_details on listings.id = booking_details.listing_id;

#Q25 Write a query to show neighbourhood & availability_365
select  listings.neighbourhood ,booking_details.availability_365 
from listings inner join booking_details on listings.id = booking_details.listing_id;

#Q26 Write a query to show total price by neighbourhood_group
select  listings.neighbourhood_group, sum(booking_details.price) Total_price 
from listings inner join booking_details on listings.id = booking_details.listing_id 
group by listings.neighbourhood_group;

#Q27 Write a query to show maximum price by neighbourhood_group
select  listings.neighbourhood_group,max(booking_details.price) max_price  
from listings inner join booking_details on listings.id = booking_details.listing_id
group by listings.neighbourhood_group;

#Q28 Write a query to show maximum night spend by neighbourhood_group
select  listings.neighbourhood_group, max(booking_details.minimum_nights) Max_night
from listings inner join booking_details on listings.id = booking_details.listing_id 
group by listings.neighbourhood_group;

#Q29 Write a query to show maximum reviews_per_month spend by neighbourhood
select  listings.neighbourhood ,max(booking_details.reviews_per_month) max_review  
from listings inner join booking_details on listings.id = booking_details.listing_id 
group by listings.neighbourhood;

#Q30 Write a query to show maximum price by room type
select  listings.room_type ,max(booking_details.price)max_price  
from listings inner join booking_details on listings.id = booking_details.listing_id 
group by listings.room_type;

#Q31 Write a query to show average number_of_reviews by room_type
select  listings.room_type ,avg(booking_details.number_of_reviews) Average_no_reviews
from listings inner join booking_details on listings.id = booking_details.listing_id 
group by listings.room_type;

#Q32 Write a query to show average price by room type
select  listings.room_type ,avg(booking_details.price) average_price 
from listings inner join booking_details on listings.id = booking_details.listing_id
group by listings.room_type;

#Q33 Write a query to show average night spend by room type
select  listings.room_type ,avg(booking_details.minimum_nights) average_nights 
from listings inner join booking_details on listings.id = booking_details.listing_id
group by listings.room_type;

#Q34 Write a query to show average price by room type but average price is less than 100
select  listings.room_type ,avg(booking_details.price) average_price 
from listings inner join booking_details on listings.id = booking_details.listing_id  
group by listings.room_type having average_price <100 ;

#Q35 Write a query to show average night by neighbourhood and average_nights is greater than 5
select listings.neighbourhood , avg(booking_details.minimum_nights) average_nights 
from listings inner join booking_details on listings.id = booking_details.listing_id 
group by listings.neighbourhood_group having average_nights > 5;

#Q36 Write a query to show all data from listings where price is greater than 200 using sub-query.
select * from listings where id in (select id from booking_details where Price  > 200);

#Q37 Write a query to show all values from booking_details table where host id is 314941 using sub-query.
select * from booking_details where listing_id in ( select listing_id from listings where host_id = 314941);

#Q38 Find all pairs of id having the same host id, each pair coming once only.
select distinct l1.id , l1.host_id from listings l1, listings l2
where  l1.host_id = l2.host_id and l1.id  <> l2.id  order by host_id;

#Q39 Write an sql query to show fetch all records that have the term cozy in name 
select * from listings where name like '%cozy%'

#Q40 Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group
select n1.id , n1.host_name , n1.neighbourhood_group ,n2.price 
from listings n1 inner join booking_details n2 on n1.id = n2.listing_id
where n1.neighbourhood_group ='Manhattan'


#Q41 Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100
select n1.id , n1.host_name , n1.neighbourhood ,n2.price 
from listings n1 inner join booking_details n2 on n1.id = n2.listing_id
where n1.neighbourhood in ('Upper West Side','Williamsburg') and n2.price >100;

#Q42 Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant
select n1.id , n1.host_name , n1.neighbourhood, n2.price 
from listings n1 inner join booking_details n2 on n1.id = n2.listing_id
where n1.host_name = 'Elise' and n1.neighbourhood = 'Bedford-Stuyvesant'; 

#Q43 Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights
select n1.id , n1.host_name ,n2.availability_365, n2.minimum_nights 
from listings n1 inner join booking_details n2 on n1.id = n2.listing_id
where n2.availability_365  >100 and n2.minimum_nights > 100;

#Q44 write query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+
select n1.id , n1.host_name ,n2.number_of_reviews,n2.reviews_per_month
from listings n1 inner join booking_details n2 on n1.id = n2.listing_id
where n2.number_of_reviews  >500 and n2.reviews_per_month > 5;

#Q45 Write a query to show neighbourhood_group which have  most  total number of review 
select n1.neighbourhood_group, sum(n2.number_of_reviews) Total_review
from listings n1 inner join booking_details n2 on n1.id = n2.listing_id
group by n1.neighbourhood_group order by Total_review desc limit 1;

#Q46 Write a query to show host name which have most cheaper total price 
select n1.host_name, sum(n2.price) Total_price
from listings n1 inner join booking_details n2 on n1.id = n2.listing_id
group by n1.host_name order by Total_price asc limit 1;


#Q47 Write a query to show host name which have most costly total price 
select n1.host_name, sum(n2.price) Total_price
from listings n1 inner join booking_details n2 on n1.id = n2.Listing_id
group by n1.host_name order by Total_price desc limit 1;

#Q48 Write a query to show host name which have max price using sub-query
select n1.host_name ,n2.price
from listings n1 inner join booking_details n2 on n1.id = n2.listing_id
where n2.price in (select max(price) from booking_details);

#Q49 Write a query to show neighbourhood_group where price is less than 100
select n1.neighbourhood_group , n2.price 
from listings n1 inner join booking_details n2 on n1.id = n2.listing_id
where n1.id in (select id from booking_details where price <100);

#Q50 Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price
select n1.room_type ,n1.neighbourhood_group , max(n2.price)maximum_price , avg(n2.availability_365) average
from listings n1 inner join booking_details n2 on n1.id = n2.listing_id
group by n1.room_type order by maximum_price asc;


















