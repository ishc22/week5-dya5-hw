SELECT *
FROM customer

CREATE OR REPLACE PROCEDURE add_customer(first_name VARCHAR, last_name VARCHAR, email VARCHAR, address VARCHAR)
LANGUAGE plpgsql 
AS $$
BEGIN
	INSERT INTO customer(first_name, last_name, email, address)
	VALUES(first_name, last_name, email, address);
END;
$$;


CALL add_customer('Karen', 'Plankton', 'Karenplankton@hotmail.com', 'Chum Bucket, Bikini Bottom, Pacific Ocean');
CALL add_customer('SpongeBob', 'SquarePants', 'Spongebobsquarepants@gmail.com', '124 Conch Street, Bikini Bottom, Pacific Ocean');
CALL add_customer('Sandra', 'Cheeks', 'Sandycheecks@gmail.com', 'Her treedome, Bikini Bottom, Pacific Ocean');
CALL add_customer('Garold', 'Wilson', 'Garywilson@gmail.com', '1124 Conch Street, Bikini Bottom, Pacific Ocean');
CALL add_customer('Larry', 'Lobster', 'larrylobster@yahoo.com', 'Bikini Bottom Beach, Pacific Ocean');

---------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM sales_person

CREATE OR REPLACE PROCEDURE add_sales_person(first_name VARCHAR, last_name VARCHAR, id_number INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO sales_person(first_name, last_name, id_number)
	VALUES(first_name, last_name, id_number);
END
$$;

CALL add_sales_person('Eugene', 'Krabs', 111);
CALL add_sales_person('Patrick', 'Star', 222);
CALL add_sales_person('Mermaid', 'Man', 333);
CALL add_sales_person('Barnacle', 'Boy', 444);
CALL add_sales_person('Pearl', 'Krabs', 555);

---------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM new_car;

CREATE OR REPLACE PROCEDURE add_new_car(make VARCHAR, model VARCHAR, year VARCHAR, color VARCHAR, cost NUMERIC(8,2))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO new_car(make, model, year, color, cost)
	VALUES(make, model, year, color, cost);
END
$$;

CALL add_new_car('Mercedes', 'AMG', '2023', 'gray', 206450);
CALL add_new_car('BMW', 'M8 competion', '2023', 'green', 151745);
CALL add_new_car('Lamborghini', 'Huracan Evo RWD Spyder', '2022', 'yellow', 259100);
CALL add_new_car('Ferrari', 'F8 Tributo', '2021', 'red', 283888);
CALL add_new_car('Porsche', '911 Turbo S', '2023', 'white', 212000);

---------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM invoice;

CREATE OR REPLACE PROCEDURE add_invoice(stock_number VARCHAR, total_cost NUMERIC(8,2), date DATE, customer_id INTEGER, sales_person_id INTEGER, new_car_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO invoice(stock_number, total_cost, date, customer_id, sales_person_id, new_car_id)
	VALUES(stock_number, total_cost, date, customer_id, sales_person_id, new_car_id);
END
$$;

CALL add_invoice('a232411', 220000, '2023-03-18', 1, 1, 1);
CALL add_invoice('b232412', 170000, '2023-03-18', 2, 2, 2); 
CALL add_invoice('c232413', 280000, '2023-03-18', 3, 3, 3); 
CALL add_invoice('d232414', 300000, '2023-03-18', 4, 4, 4); 
CALL add_invoice('e232415', 225000, '2023-03-18', 5, 5, 5); 

---------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM mechanic;

CREATE OR REPLACE PROCEDURE add_mechanic(first_name VARCHAR, last_name VARCHAR, id_number INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO mechanic(first_name, last_name, id_number)
	VALUES(first_name, last_name, id_number);
END
$$;

CALL add_mechanic('Squidward', 'Tentacles', 99);
CALL add_mechanic('Sheldon', 'Plankton', 88); 
CALL add_mechanic('Patchy', 'The Pirate', 77);
CALL add_mechanic('Bubble', 'Bass', 66);
CALL add_mechanic('Scooter', 'The Surfer', 55);

---------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM service_car;

CREATE OR REPLACE PROCEDURE add_service_car(make VARCHAR, model VARCHAR, year VARCHAR, color VARCHAR, vin VARCHAR, service_record_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_car(make, model, YEAR, color, service_record_id, vin) 
	VALUES(make, model, YEAR, color, service_record_id, vin);
END
$$;


CALL add_service_car('Porsche', '911 T', '1972', 'purple', '9112101280', 1);
CALL add_service_car('Chevrolet', 'Corvette Stingray', '2023', 'orange', '1G1YC3D4XP5114814', 2);
CALL add_service_car('Ferrari', '488 Pista', '2022', 'yellow', 'ZFF91JPA5K0240415', 3);
CALL add_service_car('Lamborghini', 'Aventador S', '2023', 'blue', 'ZHWUF3ZD2NLA05511', 4);
CALL add_service_car('McLaren', '720S Spider', '2021', 'orange', 'SBM14DCA8MW002375', 5);

---------------------------------------------------------------------------------------------------------------------------


SELECT *
FROM service_record;

CREATE OR REPLACE PROCEDURE add_service_record(miles INTEGER, extended_warranty BOOLEAN, service_summary VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_record(miles, extended_warranty, service_summary)
	VALUES(miles, extended_warranty, service_summary);
END
$$;

CALL add_service_record(8357, TRUE, 'Needs an oil change');
CALL add_service_record(300, FALSE, 'All service completed'); 
CALL add_service_record(20000, TRUE, 'Engine light on'); 
CALL add_service_record(3245, FALSE, 'All service completed'); 
CALL add_service_record(1300, TRUE, '4 tire rotation'); 

---------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM service_car_mechanic;

CREATE OR REPLACE PROCEDURE add_service_car_mechanic(mechanic_id INTEGER, service_car_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_car_mechanic(mechanic_id, service_car_id)
	VALUES(mechanic_id, service_car_id);
END
$$;

CALL add_service_car_mechanic(1, 1);
CALL add_service_car_mechanic(2, 2); 
CALL add_service_car_mechanic(3, 3); 
CALL add_service_car_mechanic(4, 4); 
CALL add_service_car_mechanic(5, 5); 

---------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM service_invoice;

CREATE OR REPLACE PROCEDURE add_service_invoice(vin VARCHAR, service_total NUMERIC(8,2), customer_id integer, service_car_id integer)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_invoice(vin, service_total, customer_id, service_car_id)
	VALUES(vin, service_total, customer_id, service_car_id);
END
$$;

CALL add_service_invoice('9112101280', 300, 1, 1);
CALL add_service_invoice('1G1YC3D4XP5114814', 2000, 2, 2); 
CALL add_service_invoice('ZFF91JPA5K0240415', 5000, 3, 4); 
CALL add_service_invoice('ZHWUF3ZD2NLA05511', 0, 4, 5); 
CALL add_service_invoice('SBM14DCA8MW002375', 2000, 5, 6); 








