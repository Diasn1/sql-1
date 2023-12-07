CREATE TABLE Games (
    game_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL
);

INSERT INTO Games (title, genre, price) VALUES
('Game1', 'Action', 49.99),
('Game2', 'Adventure', 39.99),
('Game3', 'Sports', 29.99),
('Game4', 'RPG', 59.99),
('Game5', 'Strategy', 44.99),
('Game6', 'Simulation', 34.99),
('Game7', 'FPS', 54.99),
('Game8', 'Puzzle', 24.99),
('Game9', 'Sports', 29.99),
('Game10', 'Adventure', 39.99),
('Game11', 'Action', 49.99),
('Game12', 'Racing', 39.99),
('Game13', 'Simulation', 34.99),
('Game14', 'RPG', 59.99),
('Game15', 'Strategy', 44.99);

CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

INSERT INTO Customers (name, email) VALUES
('Customer1', 'customer1@example.com'),
('Customer2', 'customer2@example.com'),
('Customer3', 'customer3@example.com'),
('Customer4', 'customer4@example.com'),
('Customer5', 'customer5@example.com'),
('Customer6', 'customer6@example.com'),
('Customer7', 'customer7@example.com'),
('Customer8', 'customer8@example.com'),
('Customer9', 'customer9@example.com'),
('Customer10', 'customer10@example.com'),
('Customer11', 'customer11@example.com'),
('Customer12', 'customer12@example.com'),
('Customer13', 'customer13@example.com'),
('Customer14', 'customer14@example.com'),
('Customer15', 'customer15@example.com');

CREATE TABLE Invoices (
    invoice_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id) ON DELETE CASCADE,
    invoice_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
);

INSERT INTO Invoices (customer_id, invoice_date, total_amount) VALUES
(1, '2023-01-01', 149.97),
(2, '2023-02-01', 79.98),
(3, '2023-03-01', 119.97),
(4, '2023-04-01', 99.96),
(5, '2023-05-01', 89.97),
(6, '2023-06-01', 109.95),
(7, '2023-07-01', 79.98),
(8, '2023-08-01', 69.99),
(9, '2023-09-01', 119.97),
(10, '2023-10-01', 129.96),
(11, '2023-11-01', 149.97),
(12, '2023-12-01', 79.98),
(13, '2024-01-01', 119.97),
(14, '2024-02-01', 139.95),
(15, '2024-03-01', 99.96);

CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    invoice_id INT REFERENCES Invoices(invoice_id) ON DELETE CASCADE,
    game_id INT REFERENCES Games(game_id) ON DELETE CASCADE,
    quantity INT NOT NULL
);

INSERT INTO Transactions (invoice_id, game_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3),
(3, 4, 2),
(4, 5, 1),
(5, 6, 3),
(6, 7, 2),
(7, 8, 1),
(8, 9, 2),
(9, 10, 1),
(10, 11, 3),
(11, 12, 2),
(12, 13, 1),
(13, 14, 2),
(14, 15, 1);
