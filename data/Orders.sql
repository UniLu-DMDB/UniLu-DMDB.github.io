-- preparatory, in case the tables have already been created
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;


-- Data Definition

CREATE TABLE Customers (
	CID integer primary key,
	Name varchar(100),
	City varchar(100),
	Balance real,
	Discount real
);

CREATE TABLE Products (
   PID integer CHECK (PID > 0) PRIMARY KEY,
   Label varchar(30) NOT NULL UNIQUE,
   EAN varchar(30),
   Location varchar (100),
   Weight real CHECK (Weight > 0.0),
   Price real
);

CREATE TABLE Orders (
   OID integer primary key,
   Date_M integer,
   Date_D integer,
   CID integer REFERENCES Customers(CID) ON DELETE CASCADE,
   PID integer REFERENCES Products (PID) ON DELETE CASCADE,
   Amount integer,
   OrderSum real,
   Status varchar(30)
);


INSERT INTO Customers VALUES (1, 'Smith', 'Geneva', -1080, 0.1);
INSERT INTO Customers VALUES (2, 'Davis', 'Basel', -800, 0.2);
INSERT INTO Customers VALUES (3, 'Muller', 'Basel', 0, 0.1);
INSERT INTO Customers VALUES (4, 'Jones', 'Geneva', 0, 0.1);
INSERT INTO Customers VALUES (5, 'Williams', 'London', 0, 0.05);
INSERT INTO Customers VALUES (6, 'Wood', 'Paris', 0, 0.05);
INSERT INTO Customers VALUES (7, 'Meyer-Meier', 'London', 10, 0.0);


INSERT INTO Products VALUES (1, 'Paper', '4 0039...3', 'Basel', 0.5, 10);
INSERT INTO Products VALUES (2, 'HardDisk', '4 0039...4', 'Paris', 1.0, 200);
INSERT INTO Products VALUES (3, 'Printer', '4 0039...5', 'Geneva', 6.0, 100);
INSERT INTO Products VALUES (4, 'Monitor', '4 0039...6', 'Geneva', 5.0, 300);
INSERT INTO Products VALUES (5, 'Keyboard', '4 0039...7', 'London', 1.0, 80);
INSERT INTO Products VALUES (6, 'Mouse', '4 0039...8', NULL, 0.2, 60);

INSERT INTO Orders VALUES (1, 7, 16, 1, 1, 100, 1000, 'delivered');
INSERT INTO Orders VALUES (2, 7, 21, 1, 1, 100, 1000, 'delivered');
INSERT INTO Orders VALUES (3, 9, 30, 2, 2, 4, 800, 'delivered');
INSERT INTO Orders VALUES (4, 9, 30, 4, 3, 1, 100, 'paid');
INSERT INTO Orders VALUES (5, 9, 30, 3, 4, 10, 30000, 'canceled');
INSERT INTO Orders VALUES (6, 10, 15, 2, 5, 50, 4000, 'paid');
INSERT INTO Orders VALUES (7, 10, 28, 3, 2, 2, 400, 'paid');
INSERT INTO Orders VALUES (8, 11, 2, 1, 4, 5, 1200, 'delivered');
INSERT INTO Orders VALUES (9, 10, 26, 5, 1, 100, 1000, 'paid');
INSERT INTO Orders VALUES (10, 11, 2, 2, 5, 3, 240, 'new');
INSERT INTO Orders VALUES (11, 9, 28, 2, 2, 10, 2000, 'new');



-- Queries

SELECT * FROM Customers WHERE Balance < 0.0 ORDER BY Name DESC;

SELECT Name FROM Customers, Orders WHERE Date_M < 10 AND Status <> 'paid' AND Customers.CID = Orders.CID;

( SELECT * FROM Orders WHERE OrderSum > 300 AND Date_M <= 6 ) UNION ALL ( SELECT * FROM Orders WHERE OrderSum > 200 AND Date_M > 6 );

SELECT * FROM Customers WHERE Balance < ( SELECT Balance FROM Customers WHERE CID = 4 );

SELECT Name, Label FROM Customers, Orders, Products WHERE City = 'Geneva' AND Date_M > 9 AND Status <> 'new' AND Location = 'Geneva' AND Customers.CID = Orders.CID AND Orders.PID = Products.PID;

SELECT q.OID, q.difference FROM (SELECT OID, (OrderSum - Amount * Price) AS difference FROM Orders o NATURAL JOIN Products p) AS q WHERE q.difference < 0;

SELECT Amount * Price * (1.0 - Discount) AS ComputedPrice FROM Customers c, Orders o, Products p WHERE OID = 8 AND o.PID = p.PID AND o.CID = c.CID;

SELECT Amount * Price * (1.0 - Discount) AS ComputedPrice FROM Orders o NATURAL JOIN Customers c NATURAL JOIN Products p WHERE OID = 8;

SELECT c1.Name, c2.Name FROM Customers c1, Customers c2 WHERE c1.City = c2.City AND c1.CID < c2.CID;

SELECT * FROM Customers WHERE Discount BETWEEN 0.10 AND 0.20;

SELECT * FROM Customers WHERE Name LIKE 'M__er-%';

SELECT * FROM Products WHERE Location IS NULL;

SELECT * FROM Customers WHERE City NOT IN ('Basel', 'Lucerne', 'Zurich');

SELECT * FROM Customers WHERE CID IN ( SELECT CID FROM Orders WHERE Status <> 'paid' AND Date_M < 10 );

SELECT * FROM Customers c1 WHERE City IN ( SELECT City FROM Customers c2 WHERE c2.CID <> c1.CID );

SELECT * FROM Customers c WHERE EXISTS ( SELECT * FROM Orders WHERE Status <> 'paid' AND Date_M < 10 AND Orders.CID = c.CID );

SELECT * FROM Customers WHERE NOT EXISTS ( SELECT * FROM Orders WHERE Orders.CID = Customers.CID );

SELECT MAX(Discount), MIN(Discount) FROM Customers;

SELECT COUNT(DISTINCT Location) FROM Products;

SELECT * FROM Customers WHERE Discount < ( SELECT AVG(Discount) FROM Customers );

SELECT PID, SUM(Amount) FROM Orders WHERE Date_M >= 11 GROUP BY PID;

SELECT PID, SUM(Amount) FROM Orders WHERE Date_M >= 9 GROUP BY PID HAVING SUM(Amount) > 10;

SELECT City, AVG(Discount) FROM Customers GROUP BY City HAVING COUNT(*) >= 2 ORDER BY 2 DESC;

SELECT p.Label, ( SELECT AVG(p.Weight * o.Amount) FROM Orders o WHERE p.PID = o.PID ) FROM Products p;

SELECT AVG (X.SumPerCustomer) FROM ( SELECT CID, SUM(OrderSum) as SumPerCustomer FROM Orders o GROUP BY CID ) as X;

SELECT PID, CASE WHEN Weight <= 1.0 THEN 'light' WHEN Weight > 1.0 THEN 'heavy' END FROM Products;

SELECT Label FROM Products ORDER BY Weight LIMIT 3;

SELECT * FROM ( SELECT Label, Location, RANK() OVER (PARTITION BY Location ORDER BY Price) AS Location_Rank FROM Products ) AS Ranks WHERE Location_Rank <= 2;

CREATE VIEW Heaviest AS SELECT Label FROM Products ORDER BY Weight LIMIT 100;