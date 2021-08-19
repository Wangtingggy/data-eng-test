-- Creation of CUSTOMER table
CREATE TABLE IF NOT EXISTS customer (
    customer_id INT NOT NULL,
    name varchar(250) NOT NULL,
    phone INT NOT NULL,
    PRIMARY KEY (customer_id)
);

-- Creation of MANUFACTURER table
CREATE TABLE IF NOT EXISTS manufacturer (
    manufacturer_id INT NOT NULL,
    manufacturer_name varchar(450) NOT NULL,
    PRIMARY KEY (manufacturer_id)
);

-- Creation of SALESPERSON table
CREATE TABLE IF NOT EXISTS salesperson (
    salesperson_id INT NOT NULL,
    salesperson_name varchar(450) NOT NULL,
    PRIMARY KEY (salesperson_id)
);

-- Creation of CAR table
CREATE TABLE IF NOT EXISTS car (
    serial_number varchar(250) NOT NULL,
    model_name varchar(250) NOT NULL,
    car_weight FLOAT NOT NULL,
    price FLOAT NOT NULL,
    manufacturer_id INT NOT NULL,
    PRIMARY KEY (serial_number),
    CONSTRAINT fk_manufacturer
        FOREIGN KEY(manufacturer_id) 
        REFERENCES manufacturer(manufacturer_id)
);

-- Creation of TRANSACTION table
CREATE TABLE IF NOT EXISTS transaction (
    transaction_id INT NOT NULL,
    customer_id INT NOT NULL,
    salesperson_id INT NOT NULL,
    serial_number varchar(250) NOT NULL,
    date_time TIMESTAMP NOT NULL,
    PRIMARY KEY (transaction_id),
    CONSTRAINT fk_customer
        FOREIGN KEY(customer_id) 
	    REFERENCES customer(customer_id),
    CONSTRAINT fk_salesperson
        FOREIGN KEY(salesperson_id) 
	    REFERENCES salesperson(salesperson_id),
    CONSTRAINT fk_car
        FOREIGN KEY(serial_number) 
	    REFERENCES car(serial_number)
);

