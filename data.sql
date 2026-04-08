{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Insert  global and Indian hotel chains\
INSERT INTO hotel_chains (name, founded_year, headquarters) VALUES\
('Taj Hotels',1903,'Mumbai'),\
('Marriott International',1927,'USA'),\
('Hilton Hotels',1919,'USA'),\
('Hyatt Hotels',1957,'Chicago'),\
('Radisson Hotels',1909,'Minnesota'),\
('Oberoi Hotels',1934,'Delhi'),\
('ITC Hotels',1975,'Kolkata'),\
('Accor Hotels',1967,'Paris'),\
('Holiday Inn',1952,'Atlanta'),\
('Best Western',1946,'Arizona'),\
('Westin Hotels',1930,'Seattle'),\
('Four Seasons',1961,'Toronto'),\
('Sheraton Hotels',1937,'Massachusetts'),\
('Leela Palaces',1986,'Mumbai'),\
('Ramada Hotels',1953,'Kentucky'),\
('Park Plaza',1986,'London'),\
('Trident Hotels',1973,'Delhi'),\
('Novotel',1967,'Paris'),\
('Fairmont Hotels',1907,'San Francisco'),\
('Rosewood Hotels',1979,'Texas'),\
('Lemon Tree Hotels',2002,'Delhi'),\
('Treebo Hotels',2015,'Bangalore'),\
('OYO Rooms',2013,'Gurgaon'),\
('FabHotels',2014,'Gurgaon'),\
('Club Mahindra',1996,'Mumbai');\
\
-- Hotels belonging to different chains across cities\
INSERT INTO hotels (chain_id, name, city, country, star_rating) VALUES\
(1,'Taj Mahal Palace','Mumbai','India',5),\
(1,'Taj Lake Palace','Udaipur','India',5),\
(2,'Marriott Downtown','New York','USA',5),\
(2,'Marriott Whitefield','Bangalore','India',5),\
(3,'Hilton Garden Inn','Dubai','UAE',4),\
(3,'Hilton Times Square','New York','USA',4),\
(4,'Hyatt Regency','Delhi','India',5),\
(4,'Grand Hyatt','Singapore','Singapore',5),\
(5,'Radisson Blu','Berlin','Germany',4),\
(5,'Radisson Blu Plaza','Delhi','India',5),\
(6,'Oberoi Amarvilas','Agra','India',5),\
(6,'Oberoi Udaivilas','Udaipur','India',5),\
(7,'ITC Grand Chola','Chennai','India',5),\
(7,'ITC Maurya','Delhi','India',5),\
(8,'Novotel City Center','Dubai','UAE',4),\
(9,'Holiday Inn Express','London','UK',4),\
(10,'Best Western Plus','Toronto','Canada',4),\
(11,'Westin Beach Resort','Goa','India',5),\
(12,'Four Seasons Resort','Bali','Indonesia',5),\
(13,'Sheraton Grand','Tokyo','Japan',5),\
(14,'Leela Palace','Delhi','India',5),\
(15,'Ramada Plaza','Bangkok','Thailand',4),\
(16,'Park Plaza Westminster','London','UK',4),\
(17,'Trident Nariman Point','Mumbai','India',5),\
(18,'Novotel Mumbai','Mumbai','India',4);\
\
-- Departments inside hotels where employees work\
INSERT INTO departments (dept_name) VALUES\
('Front Office'),\
('Housekeeping'),\
('Food and Beverage'),\
('Maintenance'),\
('Human Resources'),\
('Finance'),\
('Security'),\
('Sales'),\
('Marketing'),\
('IT Support'),\
('Spa and Wellness'),\
('Laundry'),\
('Guest Relations'),\
('Kitchen'),\
('Banquet Services'),\
('Room Service'),\
('Concierge'),\
('Transport'),\
('Purchasing'),\
('Event Management'),\
('Recreation'),\
('Bar Management'),\
('Cleaning Services'),\
('Technical Support'),\
('Administration');\
\
SELECT * FROM hotel_chains;\
\
SELECT * FROM hotels;\
\
SELECT * FROM departments;\
\
-- Different room types for hotels  and base prices\
INSERT INTO room_types (hotel_id, type_name, capacity, base_price) VALUES\
(1,'Deluxe',2,12000),\
(1,'Suite',4,25000),\
(1,'Standard',2,8000),\
(2,'Presidential Suite',4,45000),\
(2,'Luxury',3,22000),\
(3,'Standard',2,10000),\
(3,'Deluxe',2,15000),\
(4,'Suite',4,28000),\
(4,'Executive',2,18000),\
(5,'Standard',2,9000),\
(5,'Business',2,13000),\
(6,'Luxury Suite',4,30000),\
(6,'Royal Suite',4,45000),\
(7,'Deluxe',2,16000),\
(7,'Standard',2,12000),\
(8,'Suite',3,24000),\
(9,'Standard',2,11000),\
(9,'Deluxe',2,16000),\
(10,'Business',2,14000),\
(10,'Standard',2,10000),\
(11,'Presidential',4,50000),\
(12,'Suite',3,27000),\
(12,'Standard',2,13000),\
(13,'Deluxe',2,20000),\
(14,'Royal Suite',4,50000);\
\
-- Individual rooms, attached to hotels and room types\
INSERT INTO rooms (hotel_id, type_id, room_number, floor, price_per_night, status) VALUES\
(1,1,'101',1,12000,'available'),\
(1,2,'102',1,25000,'occupied'),\
(1,3,'103',1,8000,'available'),\
(2,4,'201',2,40000,'available'),\
(2,5,'202',2,22000,'available'),\
(3,6,'301',3,10000,'occupied'),\
(3,7,'302',3,15000,'available'),\
(4,8,'401',4,28000,'available'),\
(4,9,'402',4,18000,'occupied'),\
(5,10,'501',5,9000,'available'),\
(5,11,'502',5,13000,'available'),\
(6,12,'601',6,30000,'available'),\
(6,13,'602',6,45000,'occupied'),\
(7,14,'701',7,16000,'available'),\
(7,15,'702',7,12000,'available'),\
(8,16,'801',8,24000,'occupied'),\
(9,17,'901',9,11000,'available'),\
(9,18,'902',9,16000,'available'),\
(10,19,'1001',10,14000,'available'),\
(10,20,'1002',10,10000,'occupied'),\
(11,21,'1101',11,50000,'available'),\
(12,22,'1201',12,27000,'available'),\
(12,23,'1202',12,13000,'occupied'),\
(13,24,'1301',13,18000,'available'),\
(14,25,'1401',14,42000,'available');\
\
SELECT * FROM room_types;\
\
SELECT * FROM rooms;\
\
-- Guests with their names, emails, and phones\
INSERT INTO guests (first_name, last_name, email, phone) VALUES\
('Aarav','Sharma','aarav.sharma@gmail.com','9876543210'),\
('Diya','Patel','diya.patel@yahoo.com','9876543211'),\
('Rohan','Verma','rohan.verma@hotmail.com','9876543212'),\
('Ananya','Mehta','ananya.mehta@gmail.com','9876543213'),\
('Vivaan','Gupta','vivaan.gupta@gmail.com','9876543214'),\
('Isha','Singh','isha.singh@gmail.com','9876543215'),\
('Kabir','Khan','kabir.khan@gmail.com','9876543216'),\
('Sara','Kapoor','sara.kapoor@gmail.com','9876543217'),\
('Aryan','Reddy','aryan.reddy@gmail.com','9876543218'),\
('Maya','Joshi','maya.joshi@gmail.com','9876543219'),\
('Neil','D\'92Souza','neil.dsouza@gmail.com','9876543220'),\
('Tara','Chawla','tara.chawla@gmail.com','9876543221'),\
('Aditya','Malhotra','aditya.malhotra@gmail.com','9876543222'),\
('Anika','Desai','anika.desai@gmail.com','9876543223'),\
('Karan','Bansal','karan.bansal@gmail.com','9876543224'),\
('Rhea','Shah','rhea.shah@gmail.com','9876543225'),\
('Shaurya','Trivedi','shaurya.trivedi@gmail.com','9876543226'),\
('Kiara','Nair','kiara.nair@gmail.com','9876543227'),\
('Yash','Agarwal','yash.agarwal@gmail.com','9876543228'),\
('Aanya','Saxena','aanya.saxena@gmail.com','9876543229'),\
('Ritik','Verma','ritik.verma@gmail.com','9876543230'),\
('Saanvi','Chopra','saanvi.chopra@gmail.com','9876543231'),\
('Dev','Gupta','dev.gupta@gmail.com','9876543232'),\
('Nisha','Rao','nisha.rao@gmail.com','9876543233'),\
('Arjun','Mehta','arjun.mehta@gmail.com','9876543234');\
\
-- Employees assigned to hotels and departments\
INSERT INTO employees (hotel_id, dept_id, first_name, last_name, position, email, hire_date, salary) VALUES\
(1,1,'Rahul','Sharma','Front Desk Manager','rahul.sharma@taj.com','2020-01-15',50000),\
(1,2,'Simran','Kaur','Housekeeping Supervisor','simran.kaur@taj.com','2019-05-20',35000),\
(1,3,'Vikram','Singh','F&B Manager','vikram.singh@taj.com','2018-03-10',60000),\
(2,1,'Aditi','Patel','Front Desk Executive','aditi.patel@marriott.com','2021-07-12',30000),\
(2,2,'Kunal','Verma','Housekeeping Staff','kunal.verma@marriott.com','2020-06-01',25000),\
(3,4,'Rohit','Gupta','Maintenance Engineer','rohit.gupta@hilton.com','2019-08-15',40000),\
(3,1,'Neha','Sharma','Receptionist','neha.sharma@hilton.com','2021-01-05',28000),\
(4,3,'Anjali','Joshi','F&B Supervisor','anjali.joshi@hyatt.com','2018-11-11',45000),\
(4,2,'Tarun','Mehta','Housekeeping Staff','tarun.mehta@hyatt.com','2020-02-20',25000),\
(5,1,'Pooja','Rao','Front Desk Manager','pooja.rao@radisson.com','2017-09-10',50000),\
(5,5,'Siddharth','Kapoor','HR Executive','siddharth.kapoor@radisson.com','2019-12-01',40000),\
(6,1,'Ishaan','Khan','Receptionist','ishaan.khan@oberoi.com','2021-05-15',28000),\
(6,3,'Ritu','Malhotra','F&B Staff','ritu.malhotra@oberoi.com','2020-03-12',30000),\
(7,4,'Ansh','Sharma','Maintenance','ansh.sharma@itc.com','2018-07-20',35000),\
(7,2,'Meera','Singh','Housekeeping','meera.singh@itc.com','2019-01-18',25000),\
(8,1,'Nikhil','Verma','Front Desk Executive','nikhil.verma@accor.com','2021-04-01',30000),\
(8,3,'Rashmi','Joshi','F&B Supervisor','rashmi.joshi@accor.com','2018-06-25',45000),\
(9,1,'Aarohi','Patel','Receptionist','aarohi.patel@holidayinn.com','2020-09-05',28000),\
(9,4,'Kabir','Shah','Maintenance','kabir.shah@holidayinn.com','2019-03-15',35000),\
(10,5,'Tanvi','Gupta','HR Manager','tanvi.gupta@bestwestern.com','2017-11-01',50000),\
(10,2,'Rohan','Mehta','Housekeeping','rohan.mehta@bestwestern.com','2021-02-20',25000),\
(11,1,'Vanya','Singh','Front Desk','vanya.singh@westin.com','2020-01-12',30000),\
(12,3,'Arnav','Malhotra','F&B Staff','arnav.malhotra@fourseasons.com','2018-08-30',35000),\
(13,1,'Kiara','Joshi','Receptionist','kiara.joshi@sheraton.com','2021-06-14',28000);\
\
SELECT * FROM guests;\
\
SELECT * FROM employees;\
\
-- Bookings for different guests and rooms\
-- Bookings (matching existing room_id 1-25)\
INSERT INTO bookings (guest_id, room_id, check_in_date, check_out_date, total_amount, status, created_at) VALUES\
(1, 1, '2026-04-01', '2026-04-05', 48000, 'confirmed', CURRENT_TIMESTAMP),\
(2, 2, '2026-04-02', '2026-04-04', 50000, 'checked_in', CURRENT_TIMESTAMP),\
(3, 3, '2026-04-03', '2026-04-06', 24000, 'confirmed', CURRENT_TIMESTAMP),\
(4, 4, '2026-04-05', '2026-04-10', 200000, 'confirmed', CURRENT_TIMESTAMP),\
(5, 5, '2026-04-06', '2026-04-08', 44000, 'cancelled', CURRENT_TIMESTAMP),\
(6, 6, '2026-04-07', '2026-04-09', 20000, 'checked_out', CURRENT_TIMESTAMP),\
(7, 7, '2026-04-08', '2026-04-12', 60000, 'confirmed', CURRENT_TIMESTAMP),\
(8, 8, '2026-04-09', '2026-04-11', 56000, 'confirmed', CURRENT_TIMESTAMP),\
(9, 9, '2026-04-10', '2026-04-14', 72000, 'checked_in', CURRENT_TIMESTAMP),\
(10, 10, '2026-04-11', '2026-04-13', 18000, 'confirmed', CURRENT_TIMESTAMP),\
(11, 11, '2026-04-12', '2026-04-15', 65000, 'confirmed', CURRENT_TIMESTAMP),\
(12, 12, '2026-04-13', '2026-04-16', 90000, 'confirmed', CURRENT_TIMESTAMP),\
(13, 13, '2026-04-14', '2026-04-17', 75000, 'confirmed', CURRENT_TIMESTAMP),\
(14, 14, '2026-04-15', '2026-04-18', 48000, 'confirmed', CURRENT_TIMESTAMP),\
(15, 15, '2026-04-16', '2026-04-20', 48000, 'confirmed', CURRENT_TIMESTAMP),\
(16, 16, '2026-04-17', '2026-04-21', 96000, 'checked_in', CURRENT_TIMESTAMP),\
(17, 17, '2026-04-18', '2026-04-22', 66000, 'confirmed', CURRENT_TIMESTAMP),\
(18, 18, '2026-04-19', '2026-04-23', 128000, 'confirmed', CURRENT_TIMESTAMP),\
(19, 19, '2026-04-20', '2026-04-24', 196000, 'confirmed', CURRENT_TIMESTAMP),\
(20, 20, '2026-04-21', '2026-04-25', 100000, 'checked_out', CURRENT_TIMESTAMP),\
(21, 21, '2026-04-22', '2026-04-26', 250000, 'confirmed', CURRENT_TIMESTAMP),\
(22, 22, '2026-04-23', '2026-04-27', 108000, 'confirmed', CURRENT_TIMESTAMP),\
(23, 23, '2026-04-24', '2026-04-28', 26000, 'checked_in', CURRENT_TIMESTAMP),\
(24, 24, '2026-04-25', '2026-04-29', 180000, 'confirmed', CURRENT_TIMESTAMP),\
(25, 25, '2026-04-26', '2026-04-30', 42000, 'confirmed', CURRENT_TIMESTAMP);\
\
SELECT booking_id, guest_id, room_id, total_amount FROM bookings;\
\
SET SQL_SAFE_UPDATES = 0;\
\
\
\
SET SQL_SAFE_UPDATES = 1; \
\
DELETE FROM payments; \
\
DELETE FROM bookings;  \
\
ALTER TABLE bookings AUTO_INCREMENT = 1;\
\
\
-- Payments linked to bookings\
INSERT INTO payments (booking_id, amount, payment_date, method, created_at) VALUES\
(1, 48000, '2026-04-01 12:00:00', 'Credit Card', CURRENT_TIMESTAMP),\
(2, 50000, '2026-04-02 15:00:00', 'Debit Card', CURRENT_TIMESTAMP),\
(3, 24000, '2026-04-03 11:30:00', 'UPI', CURRENT_TIMESTAMP),\
(4, 200000, '2026-04-05 16:00:00', 'Cash', CURRENT_TIMESTAMP),\
(5, 44000, '2026-04-06 14:00:00', 'Credit Card', CURRENT_TIMESTAMP),\
(6, 20000, '2026-04-07 10:00:00', 'Debit Card', CURRENT_TIMESTAMP),\
(7, 60000, '2026-04-08 13:00:00', 'UPI', CURRENT_TIMESTAMP),\
(8, 56000, '2026-04-09 12:00:00', 'Cash', CURRENT_TIMESTAMP),\
(9, 72000, '2026-04-10 17:00:00', 'Credit Card', CURRENT_TIMESTAMP),\
(10, 18000, '2026-04-11 15:00:00', 'Debit Card', CURRENT_TIMESTAMP),\
(11, 65000, '2026-04-12 14:30:00', 'UPI', CURRENT_TIMESTAMP),\
(12, 90000, '2026-04-13 12:00:00', 'Cash', CURRENT_TIMESTAMP),\
(13, 75000, '2026-04-14 16:30:00', 'Credit Card', CURRENT_TIMESTAMP),\
(14, 48000, '2026-04-15 11:00:00', 'Debit Card', CURRENT_TIMESTAMP),\
(15, 48000, '2026-04-16 13:00:00', 'UPI', CURRENT_TIMESTAMP),\
(16, 96000, '2026-04-17 15:00:00', 'Cash', CURRENT_TIMESTAMP),\
(17, 66000, '2026-04-18 12:00:00', 'Credit Card', CURRENT_TIMESTAMP),\
(18, 128000, '2026-04-19 14:00:00', 'Debit Card', CURRENT_TIMESTAMP),\
(19, 196000, '2026-04-20 10:00:00', 'UPI', CURRENT_TIMESTAMP),\
(20, 100000, '2026-04-21 13:00:00', 'Cash', CURRENT_TIMESTAMP),\
(21, 250000, '2026-04-22 15:00:00', 'Credit Card', CURRENT_TIMESTAMP),\
(22, 108000, '2026-04-23 14:00:00', 'Debit Card', CURRENT_TIMESTAMP),\
(23, 26000, '2026-04-24 12:30:00', 'UPI', CURRENT_TIMESTAMP),\
(24, 180000, '2026-04-25 13:00:00', 'Cash', CURRENT_TIMESTAMP),\
(25, 42000, '2026-04-26 11:00:00', 'Credit Card', CURRENT_TIMESTAMP);\
\
-- Reviews for completed bookings\
INSERT INTO reviews (booking_id, guest_id, rating, comment) VALUES\
(6,6,5,'Excellent stay, very clean rooms.'),\
(14,14,4,'Good service, but breakfast could improve.'),\
(18,18,5,'Loved the hospitality and staff friendliness.'),\
(21,21,3,'Average experience, room service was slow.'),\
(12,12,4,'Nice stay, location is convenient.'),\
(16,16,5,'Superb hotel, highly recommended!'),\
(19,19,4,'Comfortable stay, but noisy at night.'),\
(1,1,5,'Perfect experience, will visit again.'),\
(3,3,4,'Rooms were clean, overall good stay.'),\
(7,7,5,'Front desk staff were very helpful.'),\
(9,9,5,'Loved the amenities and ambiance.'),\
(10,10,4,'Good stay, breakfast was delicious.'),\
(13,13,5,'Excellent location and service.'),\
(15,15,4,'Comfortable stay, but could be cheaper.'),\
(2,2,3,'Average, rooms were small.'),\
(5,5,4,'Clean and well maintained hotel.'),\
(8,8,2,'Booking was cancelled, disappointed.'),\
(11,11,4,'Staff were courteous and helpful.'),\
(17,17,5,'Amazing stay, everything perfect.'),\
(20,20,3,'Could improve hygiene and cleanliness.'),\
(22,22,5,'Great hotel, highly recommended!'),\
(24,24,4,'Comfortable rooms, nice view.'),\
(25,25,5,'Fantastic service and hospitality.'),\
(4,4,2,'Booking was pending, had to wait.'),\
(23,23,1,'Booking cancelled, very unhappy.');\
}