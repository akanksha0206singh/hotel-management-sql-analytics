{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Total payments per guest\
\
SELECT b.guest_id,b.booking_id,p.amount,p.payment_date,\
    SUM(p.amount) OVER (PARTITION BY b.guest_id ORDER BY p.payment_date) AS cumulative_payment\
FROM payments p\
JOIN bookings b ON p.booking_id = b.booking_id\
ORDER BY b.guest_id, p.payment_date;\
\
SELECT \
    guest_id,\
    booking_id,\
    total_amount,\
    ROW_NUMBER() OVER (PARTITION BY guest_id ORDER BY total_amount DESC) AS rank_per_guest\
FROM bookings;\
\
-- Find top 2 most expensive bookings per hotel.\
SELECT \
    h.hotel_id,\
    r.room_id,\
    b.booking_id,\
    total_amount,\
    RANK() OVER (PARTITION BY h.hotel_id ORDER BY total_amount DESC) AS booking_rank,\
    DENSE_RANK() OVER (PARTITION BY h.hotel_id ORDER BY total_amount DESC) AS Sequence_Ranking\
FROM bookings b\
JOIN rooms r ON b.room_id = r.room_id\
JOIN hotels h ON r.hotel_id = h.hotel_id;\
\
-- Total revenue per hotel\
Select h.hotel_id, h.name AS hotel_name,\
sum(b.total_amount) AS total_revenue\
from bookings b\
join rooms r on b.room_id = r.room_id\
join hotels h on r.hotel_id = h.hotel_id\
group by h.hotel_id, h.name\
order by total_revenue desc;\
\
\
-- List guests who have paid more than \uc0\u8377 1,00,000\
\
Select g.first_name, g.last_name,\
 sum(p.amount) AS total_paid from guests g\
join bookings b on g.guest_id= b.guest_id\
join payments p on b.booking_id = p.booking_id\
group by g.guest_id\
having total_paid>100000;\
\
-- previous booking amount per guest.\
SELECT \
    g.guest_id,g.first_name,b.booking_id,b.total_amount,\
    LAG(b.total_amount) OVER (PARTITION BY g.guest_id ORDER BY b.check_in_date) AS prev_booking_amount\
FROM bookings b\
JOIN guests g ON b.guest_id = g.guest_id;\
\
-- All hotel details \
\
SELECT \
    h.hotel_id,\
    h.name AS hotel_name,\
    SUM(b.total_amount) AS total_revenue\
FROM hotels h\
LEFT JOIN rooms r ON r.hotel_id = h.hotel_id\
LEFT JOIN bookings b ON b.room_id = r.room_id\
GROUP BY h.hotel_id, h.name\
ORDER BY total_revenue DESC;\
\
-- Revenue per Hotel / Per Month / Per Year\
SELECT \
    h.hotel_id,\
    h.name AS hotel_name,\
    YEAR(b.check_in_date) AS year,\
    MONTH(b.check_in_date) AS month,\
    SUM(b.total_amount) AS monthly_revenue\
FROM bookings b\
JOIN rooms r ON b.room_id = r.room_id\
JOIN hotels h ON r.hotel_id = h.hotel_id\
GROUP BY h.hotel_id, year, month\
ORDER BY h.hotel_id, year, month;\
\
-- Top Paying Guests\
SELECT \
    g.guest_id,\
    g.first_name,\
    g.last_name,\
    SUM(p.amount) AS total_paid\
FROM guests g\
JOIN bookings b ON g.guest_id = b.guest_id\
JOIN payments p ON b.booking_id = p.booking_id\
GROUP BY g.guest_id\
ORDER BY total_paid DESC\
LIMIT 10;\
\
-- Average Room Occupancy Rate per Hotel\
SELECT \
    h.hotel_id,\
    h.name AS hotel_name,\
    COUNT(b.booking_id)/COUNT(r.room_id)*100 AS occupancy_rate\
FROM hotels h\
JOIN rooms r ON h.hotel_id = r.hotel_id\
LEFT JOIN bookings b ON r.room_id = b.room_id\
GROUP BY h.hotel_id;\
\
-- Most used payment methods, revenue by method\
select p.method,\
count(p.payment_id) AS total_transaction,\
sum(p.amount) AS total_amount\
from payments p\
group by p.method\
order by total_amount desc; \
\
-- Guest Loyalty: Number of Bookings per Guest\
SELECT \
    g.guest_id,\
    g.first_name,\
    g.last_name,\
    COUNT(b.booking_id) AS total_bookings,\
    SUM(b.total_amount) AS total_spent\
FROM guests g\
JOIN bookings b ON g.guest_id = b.guest_id\
GROUP BY g.guest_id, g.first_name, g.last_name\
ORDER BY total_bookings DESC, total_spent DESC;\
\
-- Average Stay Duration per Guest\
SELECT \
    g.guest_id,\
    g.first_name,\
    g.last_name,\
    AVG(DATEDIFF(b.check_out_date, b.check_in_date)) AS avg_stay_days\
FROM guests g\
JOIN bookings b ON g.guest_id = b.guest_id\
GROUP BY g.guest_id, g.first_name, g.last_name\
ORDER BY avg_stay_days DESC;\
\
-- Hotel Performance Metrics\
SELECT \
    h.hotel_id,\
    h.name AS hotel_name,\
    rt.type_name,\
    SUM(b.total_amount) AS revenue_per_room_type\
FROM hotels h\
JOIN rooms r ON h.hotel_id = r.hotel_id\
JOIN room_types rt ON r.type_id = rt.type_id\
JOIN bookings b ON r.room_id = b.room_id\
GROUP BY h.hotel_id, rt.type_name\
ORDER BY h.hotel_id, revenue_per_room_type DESC;\
\
SELECT\
    h.hotel_id,\
    h.name AS hotel_name,\
    YEAR(b.check_in_date) AS year,\
    MONTH(b.check_in_date) AS month,\
    COUNT(b.booking_id)/COUNT(r.room_id)*100 AS occupancy_rate_percentage\
FROM hotels h\
JOIN rooms r ON h.hotel_id = r.hotel_id\
LEFT JOIN bookings b ON r.room_id = b.room_id\
GROUP BY h.hotel_id, year, month\
ORDER BY h.hotel_id, year, month;\
\
-- Star-rating vs. revenue comparison\
SELECT \
    h.star_rating,\
    SUM(b.total_amount) AS total_revenue,\
    COUNT(DISTINCT h.hotel_id) AS total_hotels\
FROM hotels h\
JOIN rooms r ON h.hotel_id = r.hotel_id\
JOIN bookings b ON r.room_id = b.room_id\
GROUP BY h.star_rating\
ORDER BY h.star_rating DESC;\
\
-- High-value vs. low-value guests\
SELECT \
    g.guest_id,\
    g.first_name,\
    g.last_name,\
    SUM(p.amount) AS total_paid,\
    CASE \
        WHEN SUM(p.amount) > 80000 THEN 'High-Value'\
        ELSE 'Low-Value'\
    END AS guest_segment\
FROM guests g\
JOIN bookings b ON g.guest_id = b.guest_id\
JOIN payments p ON b.booking_id = p.booking_id\
GROUP BY g.guest_id;\
\
-- Staff allocation per department vs. hotel size\
SELECT \
    h.hotel_id,\
    h.name AS hotel_name,\
    d.dept_name,\
    COUNT(e.emp_id) AS staff_count\
FROM employees e\
JOIN hotels h ON e.hotel_id = h.hotel_id\
JOIN departments d ON e.dept_id = d.dept_id\
GROUP BY h.hotel_id, d.dept_name\
ORDER BY h.hotel_id, staff_count DESC;\
\
-- Cancellation / Booking  Analysis\
SELECT \
    h.hotel_id,\
    h.name AS hotel_name,\
    COUNT(CASE WHEN b.status='cancelled' THEN 1 END)*100.0/COUNT(b.booking_id) AS cancel_percentage\
FROM hotels h\
JOIN rooms r ON h.hotel_id = r.hotel_id\
JOIN bookings b ON r.room_id = b.room_id\
GROUP BY h.hotel_id;\
\
-- Peak booking month\
SELECT \
    YEAR(check_in_date) AS year,\
    MONTH(check_in_date) AS month,\
    COUNT(booking_id) AS total_bookings\
FROM bookings\
GROUP BY year, month\
ORDER BY total_bookings DESC\
LIMIT 1;\
}