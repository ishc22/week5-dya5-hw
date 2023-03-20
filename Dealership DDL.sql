CREATE TABLE customer(
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  address VARCHAR(100)
);

CREATE TABLE sales_person(
  sales_person_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50)NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  id_number INTEGER NOT NULL
);

CREATE TABLE new_car(
  new_car_id SERIAL PRIMARY KEY,
  make VARCHAR(100) NOT NULL,
  model VARCHAR(100) NOT NULL,
  year VARCHAR,
  color VARCHAR(100),
  cost NUMERIC(8,2) NOT NULL
);

CREATE TABLE invoice(
  invoice_id SERIAL PRIMARY KEY,
  stock_number VARCHAR(50) NOT NULL,
  total_cost NUMERIC(8,2) NOT NULL,
  date DATE,
  customer_id INTEGER NOT NULL,
  sales_person_id INTEGER NOT NULL,
  new_car_id INTEGER NOT NULL,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY(sales_person_id) REFERENCES sales_person(sales_person_id),
  FOREIGN KEY(new_car_id) REFERENCES new_car(new_car_id)
  );
  
 CREATE TABLE service_record(
  service_record_id SERIAL PRIMARY KEY,
  miles INTEGER NOT NULL,
  extended_warranty BOOLEAN default FALSE,
  service_summary VARCHAR(500)
);

CREATE TABLE mechanic(
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(100),
  id_number INTEGER
);
  
  CREATE TABLE service_car(
  service_car_id SERIAL PRIMARY KEY,
  make VARCHAR(50),
  model VARCHAR(100),
  year VARCHAR(100),
  color VARCHAR(100),
  vin VARCHAR(100) NOT NULL,
  service_record_id INTEGER,
  Foreign Key (service_record_id) REFERENCES service_record(service_record_id)
);

CREATE TABLE service_car_mechanic(
  mechanic_id INTEGER,
  service_car_id INTEGER,
  FOREIGN KEY (service_car_id) REFERENCES service_car(service_car_id),
  FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE TABLE service_invoice(
  service_invoice_id SERIAL PRIMARY KEY,
  vin VARCHAR(50), 
  service_total NUMERIC(8,2),
  customer_id INTEGER,
  service_car_id INTEGER,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (service_car_id) REFERENCES service_car(service_car_id)
);