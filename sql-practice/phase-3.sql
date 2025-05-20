-- Your code here
INSERT INTO customers (name, phone_number)VALUES ('Rachel', 111111111);

UPDATE customers
SET points = points + 1
WHERE name = 'Rachel';

INSERT INTO coffee_orders (customer_id) SELECT id FROM customers WHERE name = 'Rachel';

INSERT INTO customers (name, phone_number, email_address)
VALUES 
    ('Monica', 222222222, 'monica@friends.show'),
    ('Phoebe', 333333333, 'phoebe@friends.show');

UPDATE customers
SET points = points + 3
WHERE name = 'Phoebe';

UPDATE customers
SET points = points + 4
WHERE name = 'Rachel';

UPDATE customers
SET points = points + 4
WHERE name = 'Monica';

INSERT INTO coffee_orders (customer_id) SELECT id FROM customers WHERE name = 'Phoebe';
INSERT INTO coffee_orders (customer_id) SELECT id FROM customers WHERE name = 'Rachel';
INSERT INTO coffee_orders (customer_id) SELECT id FROM customers WHERE name = 'Monica';

SELECT points FROM customers WHERE name = 'Monica';

UPDATE customers
SET points = 0
WHERE name = 'Rachel';

UPDATE coffee_orders
SET is_redeemed = true
WHERE customer_id = 1;

INSERT INTO customers (name, email_address)
VALUES
    ('Joey', 'joey@friends.show'),
    ('Chandler', 'chandler@friends.show'),
    ('Ross', 'ross@friends.show');

UPDATE customers
SET points = points + 6
WHERE name = 'Ross';

INSERT INTO coffee_orders (customer_id) SELECT id FROM customers WHERE name = 'Ross';

UPDATE customers
SET points = points + 3
WHERE name = 'Monica';

UPDATE customers
SET points = points + 1
WHERE name = 'Phoebe';

INSERT INTO coffee_orders (customer_id) SELECT id FROM customers WHERE name = 'Phoebe';

UPDATE customers
SET points = points - 2
WHERE name = 'Ross';

DELETE FROM coffee_orders WHERE customer_id = 6;

UPDATE customers
SET points = points + 2
WHERE name = 'Joey';

INSERT INTO coffee_orders (customer_id) SELECT id FROM customers WHERE name = 'Joey';

UPDATE customers
SET points = points - 10
WHERE name = 'Monica';

UPDATE coffee_orders
SET is_redeemed = true
WHERE customer_id = 2;

DELETE FROM customers WHERE name = 'Chandler';

UPDATE customers
SET points = points + 1
WHERE name = 'Ross';

INSERT INTO coffee_orders (customer_id) SELECT id FROM customers WHERE name = 'Ross';

UPDATE customers
SET points = points + 1
WHERE name = 'Joey';

INSERT INTO coffee_orders (customer_id) SELECT id FROM customers WHERE name = 'Joey';

UPDATE customers
SET email_address = 'p_as_in_phoebe@friends.show'
WHERE name = 'Phoebe';