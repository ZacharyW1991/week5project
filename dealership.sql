CREATE TABLE IF NOT EXISTS staff(
	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS car(
	serial_num SERIAL PRIMARY KEY,
	year_made NUMERIC(4),
	make VARCHAR(50),
	model VARCHAR(50),
	color VARCHAR(50),
	in_inventory BOOLEAN
);

CREATE TABLE IF NOT EXISTS ticket(
	tic_num SERIAL PRIMARY KEY,
	serial_num INTEGER,
	FOREIGN KEY(serial_num) REFERENCES car(serial_num),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE IF NOT EXISTS invoice(
	inv_num SERIAL PRIMARY KEY,
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	staff_id INTEGER,
	FOREIGN KEY(staff_id) REFERENCES staff(staff_id),
	car_id INTEGER,
	FOREIGN KEY(car_id) REFERENCES car(serial_num)
);

INSERT INTO customer(first_name, last_name) VALUES ('Zachary', 'White');
INSERT INTO customer(first_name, last_name) VALUES ('Abigail', 'Peacock');
INSERT INTO customer(first_name, last_name) VALUES ('Alex', 'Layton');

SELECT * FROM customer c ;

INSERT INTO staff(first_name, last_name) VALUES ('Willie', 'Loman');
INSERT INTO staff(first_name, last_name) VALUES ('Ryo', 'Fukui');

SELECT * FROM staff s ;

INSERT INTO car(year_made, make, model, color, in_inventory) VALUES (2004, 'Toyota', 'Matrix', 'Silver', False);
INSERT INTO car(year_made, make, model, color, in_inventory) VALUES (2005, 'Chevrolet', 'Cavalier', 'Blue', True);
INSERT INTO car(year_made, make, model, color, in_inventory) VALUES (2006, 'Chevrolet', 'Cavalier', 'Red', True);
INSERT INTO car(year_made, make, model, color, in_inventory) VALUES (2012, 'Jeep', 'Wrangler', 'Yellow', False);
INSERT INTO car(year_made, make, model, color, in_inventory) VALUES (1997, 'Ford', 'Bronco', 'Teal', False);
INSERT INTO car(year_made, make, model, color, in_inventory) VALUES (1997, 'Ford', 'POS', 'Grey', True);

SELECT * FROM car c ;

INSERT INTO invoice (car_id, customer_id, staff_id) VALUES (1, 1, 1);
INSERT INTO invoice (car_id, customer_id, staff_id) VALUES (4, 2, 2);

SELECT * FROM invoice i ;

INSERT INTO ticket(serial_num, customer_id) VALUES (5, 3);
INSERT INTO ticket(serial_num, customer_id) VALUES (1, 1);
INSERT INTO ticket(serial_num, customer_id) VALUES (5, 3);

