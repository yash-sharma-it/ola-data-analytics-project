create database Ola;
use Ola;


-- 1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings
where Booking_status = 'Success';

-- Q1. Retrieve all successful bookings:
select * from Successful_Bookings
 
-- 2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as avg_distance
from  bookings
group by Vehicle_Type;

-- Q2. Find the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle

-- 3. Get the total number of cancelled rides by customers:

create view cancelled_rides_by_customers as
select count(*) from bookings
where Booking_Status = 'Canceled by Customer';

-- Q3. Get the total number of cancelled rides by customers:
select * from cancelled_rides_by_customers


-- 4. List the top 5 customers who booked the highest number of rides:
create  view top_5_customers as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
Order by total_rides DESC limit 5;

-- Q4. List the top 5 customers who booked the highest number of rides:
select * from top_5_customers



-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_Cancelled_by_Driver_P_C_Issues as
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- Q5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from Rides_Cancelled_by_Driver_P_C_Issues


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_rating as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = 'Prime Sedan';

-- Q6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from max_min_driver_rating



-- 7. Retrieve all rides where payment was made using UPI:
create view UPI_payment as
select* from bookings
where Payment_Method = 'UPI';

-- Q7. Retrieve all rides where payment was made using UPI:
select * from UPI_payment

-- 8. Find the average customer rating per vehicle type:
create view avg_customer_rating as
Select Vehicle_Type , avg(Customer_Rating)
as avg_customer_rating FROM bookings
group by Vehicle_Type;

-- Q8. Find the average customer rating per vehicle type:
select * from avg_customer_rating


 -- 9. Calculate the total booking value of rides completed successfully:
 create view total_successful_ride_value as
 select sum(Booking_Value) as total_successful_ride_value
 from bookings
 where Booking_Status = 'Success';
 
 -- Q9. Calculate the total booking value of rides completed successfully:
 select * from total_successful_ride_value
 
 
 
 
-- 10. List all incomplete rides along with the reason

create view incomplete_rides_reasons as
select Booking_ID ,Incomplete_Rides_Reason 
from bookings
where Incomplete_Rides = 'Yes';

-- Q10. List all incomplete rides along with the reason
select * from incomplete_rides_reasons





