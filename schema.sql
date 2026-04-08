{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 CREATE DATABASE hotel_management;\
\
USE hotel_management;\
\
SHOW DATABASES;\
\
-- HOTEL CHAINS\
CREATE TABLE hotel_chains (\
    chain_id INT AUTO_INCREMENT PRIMARY KEY,\
    name VARCHAR(100) NOT NULL UNIQUE,\
    founded_year INT,\
    headquarters VARCHAR(100)\
);\
\
-- HOTELS\
CREATE TABLE hotels (\
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,\
    chain_id INT,\
    name VARCHAR(100) NOT NULL,\
    city VARCHAR(50),\
    country VARCHAR(50),\
    star_rating DECIMAL(2,1),\
\
    FOREIGN KEY (chain_id) REFERENCES hotel_chains(chain_id)\
);\
\
-- ROOM TYPES\
CREATE TABLE room_types (\
    type_id INT AUTO_INCREMENT PRIMARY KEY,\
    hotel_id INT,\
    type_name VARCHAR(50),\
    capacity INT,\
    base_price DECIMAL(10,2),\
\
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)\
);\
\
-- rooms\
\
CREATE TABLE rooms (\
    room_id INT AUTO_INCREMENT PRIMARY KEY,\
    hotel_id INT,\
    type_id INT,\
    room_number VARCHAR(10),\
    floor INT,\
    price_per_night DECIMAL(10,2),\
    status VARCHAR(20) DEFAULT 'available',\
\
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id),\
    FOREIGN KEY (type_id) REFERENCES room_types(type_id)\
);\
\
-- GUESTS\
CREATE TABLE guests (\
    guest_id INT AUTO_INCREMENT PRIMARY KEY,\
    first_name VARCHAR(50),\
    last_name VARCHAR(50),\
    email VARCHAR(100) UNIQUE,\
    phone VARCHAR(20),\
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP\
);\
\
-- Departments(housekeeping,receptio,etc)\
CREATE TABLE departments (\
    dept_id INT AUTO_INCREMENT PRIMARY KEY,\
    dept_name VARCHAR(50)\
);\
\
-- Employees (staff)\
CREATE TABLE employees (\
    emp_id INT AUTO_INCREMENT PRIMARY KEY,\
    hotel_id INT,\
    dept_id INT,\
    first_name VARCHAR(50),\
    last_name VARCHAR(50),\
    position VARCHAR(50),\
    email VARCHAR(100) UNIQUE,\
    hire_date DATE,\
    salary DECIMAL(10,2),\
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\
\
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id),\
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)\
);\
\
-- BOOKINGS\
CREATE TABLE bookings (\
    booking_id INT AUTO_INCREMENT PRIMARY KEY,\
    guest_id INT,\
    room_id INT,\
    check_in_date DATE,\
    check_out_date DATE,\
    total_amount DECIMAL(10,2),\
    status VARCHAR(20) DEFAULT 'confirmed',\
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\
\
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),\
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)\
);\
\
-- PAYMENTS\
CREATE TABLE payments (\
    payment_id INT AUTO_INCREMENT PRIMARY KEY,\
    booking_id INT,\
    amount DECIMAL(10,2),\
    method VARCHAR(50),\
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\
\
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)\
);\
\
\
-- Reviews\
\
CREATE TABLE reviews (\
    review_id INT AUTO_INCREMENT PRIMARY KEY,\
    booking_id INT,\
    guest_id INT,\
    rating SMALLINT CHECK (rating BETWEEN 1 AND 5),\
    comment TEXT,\
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\
\
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),\
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id)\
);\
\
\
CREATE INDEX idx_hotels_city on hotels(city);\
CREATE INDEX idx_rooms_status on rooms(status);\
CREATE INDEX idx_bookings_guest ON bookings(guest_id);\
CREATE INDEX idx_payments_booking ON payments(booking_id);}