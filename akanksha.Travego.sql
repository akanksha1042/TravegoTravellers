CREATE SCHEMA Travego;
CREATE TABLE Passenger (
    Passenger_id INT,
    Passenger_name VARCHAR(50),
    Category VARCHAR(50),
    Gender VARCHAR(50),
    Boarding_City VARCHAR(50),
    Destination_City VARCHAR(50),
    Distance INT,
    Bus_Type VARCHAR(50),
    PRIMARY KEY (Passenger_id)
);
CREATE TABLE Price (
    id INT,
    Bus_type VARCHAR(50),
    Distance INT,
    Price INT,
    PRIMARY KEY (id)
);
INSERT INTO Passenger (Passenger_id, Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type)
VALUES
    (1, 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
    (2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
    (3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
    (4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
    (5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
    (6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
    (7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
    (8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
    (9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

INSERT INTO Price (id, Bus_type, Distance, Price)
VALUES
    (1, 'Sleeper', 350, 770),
    (2, 'Sleeper', 500, 1100),
    (3, 'Sleeper', 600, 1320),
    (4, 'Sleeper', 700, 1540),
    (5, 'Sleeper', 1000, 2200),
    (6, 'Sleeper', 1200, 2640),
    (7, 'Sleeper', 1500, 2700),
    (8, 'Sitting', 500, 620),
    (9, 'Sitting', 600, 744),
    (10, 'Sitting', 700, 868),
    (11, 'Sitting', 1000, 1240),
    (12, 'Sitting', 1200, 1488),
    (13, 'Sitting', 1500, 1860);
-- Count the number of females and males who traveled a minimum distance of 600 KMs
SELECT Gender, COUNT(*) AS PassengerCount 
FROM Passenger 
WHERE Distance >= 600 
GROUP BY Gender;

-- Find the minimum ticket price of a Sleeper Bus
SELECT MIN(Price) AS MinimumTicketPrice
FROM Price
WHERE Bus_type = 'Sleeper';

-- Select passenger names starting with 'S'
SELECT * FROM Passenger 
WHERE Passenger_name LIKE 'S%';

-- Calculate price charged for each passenger and display the details
SELECT P.Passenger_name, P.Boarding_City, P.Destination_City, P.Bus_Type, Pr.Price
FROM Passenger as P
JOIN Price as Pr ON P.Bus_Type = Pr.Bus_type AND P.Distance = Pr.Distance; 

-- Passenger name(s) and ticket price for those who traveled 1000 KMs Sitting in a bus
SELECT Passenger_name, Price 
FROM Passenger AS P 
JOIN Price AS Pr ON P.Bus_Type = Pr.Bus_type AND P.Distance = Pr.Distance
Where P.Distance = 1000 And P.Bus_Type = 'Sitting';

-- Sitting and Sleeper bus charges for Pallavi to travel from Bangalore to Panaji
SELECT DISTINCT p1.Passenger_name, p1.Boarding_city as Destination_city, p1.Destination_city as Boardng_city, p1.Bus_type, p2.Price 
FROM passenger p1, price p2 
WHERE Passenger_name = 'Pallavi' and p1.Distance = p2.Distance;

-- List unique distances from the Passenger table in descending order
SELECT DISTINCT Distance 
From Passenger 
ORDER BY Distance DESC;

-- the total distance traveled by all passengers
SELECT SUM(Distance) AS TotalDistance
FROM Passenger;

-- Display passenger name and percentage of distance traveled
SELECT Passenger_name, (Distance / (SELECT SUM(Distance) FROM Passenger)) * 100 AS DistancePercentage
FROM Passenger;
