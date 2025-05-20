PRAGMA foreign_key = ON;

CREATE TABLE IF NOT EXISTS departments(
    department_id INTEGER PRIMARY KEY AUTOINCREMENT,
    department VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS roles(
    role_id INTEGER PRIMARY KEY AUTOINCREMENT,
    role VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS employees (
    employee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INTEGER,
    role_id INTEGER,

    FOREIGN KEY(department_id) REFERENCES departments(department_id),
    FOREIGN KEY(role_id) REFERENCES roles(role_id)
);



CREATE TABLE IF NOT EXISTS relationships(
    relationship_id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee_id_1 INTEGER,
    employee_id_2 INTEGER,
    start_date DATE,

    FOREIGN KEY (employee_id_1) REFERENCES employees(employee_id),
    FOREIGN KEY (employee_id_2) REFERENCES employees(employee_id)
);



CREATE TABLE IF NOT EXISTS performance_rating(
    performance_id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee_id INTEGER,
    score REAL CHECK(score >= 0 AND score <= 10),
    review_date DATE,
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);


CREATE TABLE IF NOT EXISTS office_parties(
    party_id INTEGER PRIMARY KEY AUTOINCREMENT,
    party_name VARCHAR(150),
    party_date DATE,
    budget REAL,
    location_type TEXT
);

CREATE TABLE IF NOT EXISTS party_attendance(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee_id INTEGER,
    party_id INTEGER,
    checkin_time TIMESTAMP,
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY(party_id) REFERENCES office_parties(party_id)
);

INSERT INTO departments (department)
VALUES
    ('Sales'),
    ('Reception'),
    ('Warehouse'),
    ('Accounting'),
    ('Management'),
    ('Product Oversight');

INSERT INTO roles (role)
VALUES
    ('Regional Manager'),
    ('Assistant Regional Manager'),
    ('Sales Representative'),
    ('Receptionist'),
    ('Customer Service Representative'),
    ('Head of Accounting'),
    ('Warehouse Staff'),
    ('Temp');

INSERT INTO employees (first_name, last_name, department_id, role_id)
VALUES 
    ('Michael', 'Scott', 5, 1),
    ('Dwight', 'Schrute', 1, 2),
    ('Jim', 'Halpert', 1, 3),
    ('Pam', 'Beesly', 2, 4),
    ('Kelly', 'Kapoor', 6, 5),
    ('Angela', 'Martin', 4, 6),
    ('Roy', 'Anderson', 3, 7);


INSERT INTO relationships (employee_id_1, employee_id_2, start_date) VALUES (7, 4, '2020-02-05');
INSERT INTO employees (first_name, last_name, department_id, role_id) VALUES ('Ryan', 'Howard', 2, 8);

INSERT INTO office_parties(party_name, party_date, budget, location_type) VALUES ('Staff-Chill', '2024-08-02', 100.00, 'onsite');

INSERT INTO performance_rating(employee_id, score, review_date) VALUES (2, 9.0, '2025-02-08');
INSERT INTO performance_rating(employee_id, score, review_date) VALUES (3, 4.2, '2025-06-02');

UPDATE performance_rating
SET score = 9.0
WHERE performance_id = 1;

UPDATE performance_rating
SET score = 9.3
WHERE performance_id = 2;

UPDATE employees
SET role_id = 2
WHERE employee_id = 3;

UPDATE employees
SET department_id = 1, role_id = 3
WHERE employee_id = 8;

INSERT INTO office_parties(party_name, party_date, budget, location_type) VALUES ('Get together', '2024-11-15', 200, 'Onsite');

INSERT INTO relationships(employee_id_1, employee_id_2, start_date) VALUES (6, 2, '2023-11-18');
INSERT INTO performance_rating(employee_id, score, review_date) VALUES(6, 6.2, DATE('now'));
INSERT INTO relationships(employee_id_1, employee_id_2, start_date) VALUES (8, 5, DATE('now'));

INSERT INTO office_parties(party_name, party_date, budget, location_type) VALUES ('Get Along', '2024-11-11', 50, 'Onsite');

DELETE FROM performance_rating WHERE performance_id = 2;
DELETE FROM relationships WHERE relationship_id = 1;

INSERT INTO performance_rating(employee_id, score, review_date) VALUES(4, 7.6, DATE('now'));

UPDATE performance_rating
SET score = 8.7
WHERE performance_id = 1;

DELETE FROM relationships WHERE relationship_id = 3;

UPDATE employees
SET role_id = 3
WHERE employee_id = 3;

INSERT INTO employees (first_name, last_name, department_id, role_id) VALUES ('Karen', 'Filippeli', 1, 3);
INSERT INTO relationships(employee_id_1, employee_id_2, start_date) VALUES (3, 9, DATE('now'));
INSERT INTO office_parties(party_name, party_date, budget, location_type) VALUES ('Get going', Date('now'), 120, 'Onsite');

DELETE FROM office_parties WHERE party_id = 4;

INSERT INTO office_parties(party_name, party_date, budget, location_type) VALUES ('Get going', Date('now'), 300, 'Offsite');

UPDATE relationships
SET employee_id_2 = 4
WHERE employee_id_1 = 3;