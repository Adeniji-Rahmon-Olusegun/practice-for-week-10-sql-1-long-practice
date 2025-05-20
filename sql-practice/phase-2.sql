-- Your code here
DROP TABLE IF EXISTS customers;

CREATE TABLE IF NOT EXISTS customers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    phone_number NUMERIC(10, 0) UNIQUE,
    email_address VARCHAR(255) UNIQUE,
    points INTEGER DEFAULT 5 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

DROP TABLE IF EXISTS coffee_orders;

CREATE TABLE IF NOT EXISTS coffee_orders (
    id INTEGER PRIMARY KEY,
    is_redeemed BOOLEAN DEFAULT false,
    ordered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);