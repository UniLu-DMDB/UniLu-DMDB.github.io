CREATE TABLE CyclingEvent (
	EvID INT PRIMARY KEY,
	EventName VARCHAR(100) NOT NULL,
	Location VARCHAR(100) NOT NULL,
	Year VARCHAR(100) NOT NULL,
	DistanceKM SMALLINT
);

CREATE TABLE Sponsor (
	SpID INT PRIMARY KEY,
	SponsorName VARCHAR(100) NOT NULL,
	EvID INT REFERENCES CyclingEvent(EvID),
	AmountCHF INT
);

CREATE TABLE Cyclist (
	CID INT PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Birthday VARCHAR(100) NOT NULL,
	Gender VARCHAR(1) NOT NULL,
	Club VARCHAR (100) NOT NULL
);

CREATE TABLE StartingList (
	StartNumber INT PRIMARY KEY,
	EvID INT REFERENCES CyclingEvent(EvID),
	CID INT REFERENCES Cyclist(CID)
);


CREATE TABLE Results (
	ResID INT PRIMARY KEY,
	StartNumber INT REFERENCES StartingList(StartNumber),
	Category VARCHAR(30) NOT NULL,
	CyclingTime VARCHAR(30)
);




-- Inserting data into CyclingEvent table
INSERT INTO CyclingEvent (EvID, EventName, Location, Year, DistanceKM)
VALUES
(1, 'Lucerne Fun Ride', 'Lucerne', '2024', 50),
(2, 'Basel Hill Climbing Challenge', 'Basel', '2024', 20),
(3, 'Lucerne Lake Loop', 'Lucerne', '2024', 100),
(4, 'Berne Run Challenge', 'Bern', '2024', 25),
(5, 'Alps Adventure Tour', 'Interlaken', '2024', 150),
(6, 'Rhine Valley Ride', 'Zurich', '2024', 100);

-- Inserting data into Sponsor table
INSERT INTO Sponsor (SpID, SponsorName, EvID, AmountCHF)
VALUES
(1, 'Swiss Chocolate Co.', 1, 15000),
(2, 'Pharma Inc.', 2, 12000),
(3, 'Clock Tower Watches', 3, 10000),
(4, 'Swiss Bank & Trust', 4, 18000),
(5, 'Alpine Adventures', 5, 25000),
(6, 'Zurich Bank', 6, 20000);

-- Inserting data into Cyclist table
INSERT INTO Cyclist (CID, Name, Birthday, Gender, Club)
VALUES
(1, 'Chocolate Charlie', '1992-05-08', 'M', 'Lucerne Sweet Riders'),
(2, 'Hiking Heidi', '1994-09-15', 'F', 'Alpine Adventure Cyclists'),
(3, 'Lakeside Liam', '1991-02-20', 'M', 'Lucerne Lake Lovers'),
(4, 'Cheesehead Chloe', '1993-07-10', 'F', 'Swiss Cheese Cyclers'),
(5, 'Skiing Steve', '1988-11-28', 'M', 'Lucerne Snowy Peaks'),
(6, 'Fondue Fiona', '1990-03-18', 'F', 'Alpine Appetite Riders'),
(7, 'Yodeling Yuri', '1989-06-25', 'M', 'Lucerne Mountain Musicians'),
(8, 'Alphorn Anna', '1995-12-05', 'F', 'Swiss Sound Cyclers'),
(9, 'Cuckoo Clock Carl', '1996-08-20', 'M', 'Lucerne Time Travellers'),
(10, 'Hearty Helga', '1993-04-12', 'F', 'Alpine Heartbeat Riders');

-- Inserting data into StartingList table
INSERT INTO StartingList (StartNumber, EvID, CID)
VALUES
(5, 1, 1),
(6, 1, 2),
(7, 1, 3),
(8, 1, 4),
(9, 2, 5),
(10, 2, 6),
(11, 2, 7),
(12, 2, 8),
(13, 3, 9),
(14, 3, 10),
(15, 4, 2),
(16, 4, 4),
(17, 4, 6),
(18, 4, 8),
(19, 4, 10),
(20, 5, 3),
(21, 5, 5),
(22, 5, 7),
(23, 5, 9),
(24, 5, 1),
(25, 6, 2),
(26, 6, 4),
(27, 6, 6),
(28, 6, 8),
(29, 6, 10);

-- Inserting data into Results table
INSERT INTO Results (ResID, StartNumber, Category, CyclingTime)
VALUES
(5, 5, 'Amateur', '02:30:15'),
(6, 6, 'Professional', '01:40:30'),
(7, 7, 'Amateur', '02:15:45'),
(9, 9, 'Amateur', '02:25:10'),
(10, 10, 'Professional', '01:35:55'),
(11, 11, 'Amateur', '02:20:30'),
(12, 12, 'Professional', '01:55:40'),
(13, 13, 'Amateur', '02:28:20'),
(14, 14, 'Professional', '01:48:10'),
(15, 15, 'Amateur', '02:10:25'),
(17, 17, 'Amateur', '02:20:50'),
(18, 18, 'Professional', '01:45:30'),
(19, 19, 'Amateur', '02:18:15'),
(20, 20, 'Professional', '03:20:45'),
(21, 21, 'Amateur', '04:05:30'),
(22, 22, 'Professional', '02:55:10'),
(23, 23, 'Amateur', '04:10:20'),
(24, 24, 'Professional', '03:00:55'),
(25, 25, 'Amateur', '03:45:20'),
(26, 26, 'Professional', '02:30:45'),
(28, 28, 'Professional', '02:45:30'),
(29, 29, 'Amateur', '03:50:15');