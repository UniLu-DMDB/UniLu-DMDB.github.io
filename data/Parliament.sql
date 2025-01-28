DROP TABLE IF EXISTS Parties; 
DROP TABLE IF EXISTS MembersOfParliament; 
DROP TABLE IF EXISTS Sponsors; 
DROP TABLE IF EXISTS Votes; 

-- Create Parties table
CREATE TABLE Parties (
    PID INT PRIMARY KEY,
    Party VARCHAR(255)
);

-- Create MembersOfParliament table
CREATE TABLE MembersOfParliament (
    MID INT PRIMARY KEY,
    FName VARCHAR(255),
    LName VARCHAR(255),
    Age INT,
    PID INT,
    Constituency VARCHAR(255),
    FOREIGN KEY (PID) REFERENCES Parties(PID)
);

-- Create Bills table
CREATE TABLE Bills (
    BID INT PRIMARY KEY,
    Title VARCHAR(255),
    Description TEXT,
    DateOfInt DATE,
    IntBy INT,
    Status VARCHAR(50),
    FOREIGN KEY (IntBy) REFERENCES MembersOfParliament(MID)
);

-- Create Sponsors table
CREATE TABLE Sponsors (
    BID INT,
    MID INT,
    PRIMARY KEY (BID, MID),
    FOREIGN KEY (BID) REFERENCES Bills(BID),
    FOREIGN KEY (MID) REFERENCES MembersOfParliament(MID)
);

-- Create Votes table
CREATE TABLE Votes (
    MID INT,
    BID INT,
    Vote VARCHAR(10),
    PRIMARY KEY (MID, BID),
    FOREIGN KEY (MID) REFERENCES MembersOfParliament(MID),
    FOREIGN KEY (BID) REFERENCES Bills(BID)
);

-- Insert exemplary tuples
INSERT INTO Parties VALUES (4, 'Gravity Party');

INSERT INTO MembersOfParliament VALUES (3, 'Isaac', 'Noodleton', 371, 4, 'Appleton');
INSERT INTO MembersOfParliament VALUES (91, 'Gigglyeye', 'Galilei', 459, 4, 'Bologna');

INSERT INTO Bills VALUES (42, 'The Anti-Gravity Act', 'This bill proposes to outlaw the use of anti-gravity devices, such as levitation boots, hoverboards, and flying carpets, in public spaces.', '2023-05-26', 3, 'pending');

INSERT INTO Sponsors VALUES (42, 91);

INSERT INTO Votes VALUES (3, 42, 'yes');


-- Insert more exemplary tuples
INSERT INTO Parties VALUES (9, 'Brunch Party');
INSERT INTO Parties VALUES (10, 'Muffin Party');
INSERT INTO Parties VALUES (12, 'Waffle Party');
INSERT INTO Parties VALUES (13, 'Pancake Party');

INSERT INTO MembersOfParliament VALUES (25, 'Winston', 'Waffle', 55, 9, 'Appleton');
INSERT INTO MembersOfParliament VALUES (36, 'Samantha', 'Syrup', 28, 9, 'Maple Ridge');
INSERT INTO MembersOfParliament VALUES (48, 'Larry', 'Lettuce', 37, NULL, 'Salad Town');
INSERT INTO MembersOfParliament VALUES (52, 'Fiona', 'Fizzle', 43, 10, 'Maple Ridge');
INSERT INTO MembersOfParliament VALUES (63, 'Harry', 'Hiccup', 34, 12, 'Appleton');
INSERT INTO MembersOfParliament VALUES (71, 'Oliver', 'Onion', 62, 13, 'Salad Town');
INSERT INTO MembersOfParliament VALUES (84, 'Gwendolyn', 'Giraffe', 45, 13, 'Maple Ridge');
INSERT INTO MembersOfParliament VALUES (97, 'Peter', 'Pickle', 39, 9, 'Sugarland');
INSERT INTO MembersOfParliament VALUES (101, 'Emily', 'Eclair', 33, 10, 'Sugarland');
INSERT INTO MembersOfParliament VALUES (114, 'Roger', 'Rocket', 50, 4, 'Salad Town');
INSERT INTO MembersOfParliament VALUES (118, 'Giuseppe', 'Spaghetti', 41, 4, 'Bologna');
INSERT INTO MembersOfParliament VALUES (131, 'Maria', 'Ravioli', 37, 4, 'Bologna');

INSERT INTO Bills VALUES (54, 'The Maple Syrup Act', 'This bill proposes to make maple syrup the official beverage of the nation, with maple trees designated as national monuments.', '2023-11-30', 25, 'introduced');
INSERT INTO Bills VALUES (65, 'The Bubble Wrap Ban', 'This bill suggests banning the use and sale of bubble wrap to reduce environmental waste and promote alternative packaging materials.', '2024-01-10', 52, 'debated');
INSERT INTO Bills VALUES (76, 'The Pickle Preservation Act', 'This bill aims to establish pickle sanctuaries across the country, ensuring the conservation of endangered pickle species.', '2023-09-05', 97, 'passed');
INSERT INTO Bills VALUES (85, 'The Giraffe Height Limitation Act', 'This bill seeks to impose height restrictions on giraffes in public spaces to prevent accidents and ensure pedestrian safety.', '2023-07-18', 84, 'introduced');
INSERT INTO Bills VALUES (92, 'The Onion Breath Regulation Act', 'This bill proposes measures to control and reduce the occurrence of onion breath through mandatory breath mints in public places.', '2023-12-20', 71, 'debated');
INSERT INTO Bills VALUES (103, 'The Rocket Propulsion Initiative', 'This bill aims to allocate funds for research and development of rocket propulsion technology for public transportation.', '2023-08-02', 114, 'failed');
INSERT INTO Bills VALUES (121, 'The Eclair Appreciation Day Act', 'This bill suggests declaring a national holiday to celebrate the deliciousness of eclairs and promote pastry appreciation.', '2024-02-05', 101, 'introduced');
INSERT INTO Bills VALUES (132, 'The Lettuce Liberation Act', 'This bill advocates for the rights of lettuce and proposes measures to end lettuce discrimination in salad preparation.', '2023-10-08', 48, 'passed');
INSERT INTO Bills VALUES (143, 'The Syrup Sipping Incentive', 'This bill proposes tax incentives for citizens who participate in regular syrup tasting events to promote cultural appreciation of maple syrup.', '2023-06-15', 36, 'introduced');
INSERT INTO Bills VALUES (154, 'The Waffle House Establishment Act', 'This bill aims to provide government funding for the establishment of waffle houses in every neighborhood, ensuring access to delicious waffles for all.', '2023-04-27', 25, 'failed');

INSERT INTO Sponsors VALUES (54, 25);
INSERT INTO Sponsors VALUES (65, 114);
INSERT INTO Sponsors VALUES (76, 84);
INSERT INTO Sponsors VALUES (76, 114);
INSERT INTO Sponsors VALUES (85, 84);
INSERT INTO Sponsors VALUES (92, 71);
INSERT INTO Sponsors VALUES (103, 25);
INSERT INTO Sponsors VALUES (121, 101);
INSERT INTO Sponsors VALUES (132, 48);
INSERT INTO Sponsors VALUES (132, 63);
INSERT INTO Sponsors VALUES (132, 71);
INSERT INTO Sponsors VALUES (132, 84);
INSERT INTO Sponsors VALUES (143, 36);
INSERT INTO Sponsors VALUES (154, 114);

INSERT INTO Votes VALUES (3, 103, 'abstention');
INSERT INTO Votes VALUES (25, 103, 'yes');
INSERT INTO Votes VALUES (36, 103, 'no');
INSERT INTO Votes VALUES (48, 103, 'no');
INSERT INTO Votes VALUES (52, 103, 'abstention');
INSERT INTO Votes VALUES (63, 103, 'no');
INSERT INTO Votes VALUES (71, 103, 'no');
INSERT INTO Votes VALUES (84, 103, 'no');
INSERT INTO Votes VALUES (91, 103, 'no');
INSERT INTO Votes VALUES (97, 103, 'no');
INSERT INTO Votes VALUES (101, 103, 'yes');
INSERT INTO Votes VALUES (114, 103, 'abstention');
INSERT INTO Votes VALUES (118, 103, 'no');
INSERT INTO Votes VALUES (3, 154, 'abstention');
INSERT INTO Votes VALUES (25, 154, 'yes');
INSERT INTO Votes VALUES (36, 154, 'yes');
INSERT INTO Votes VALUES (48, 154, 'no');
INSERT INTO Votes VALUES (52, 154, 'no');
INSERT INTO Votes VALUES (63, 154, 'abstention');
INSERT INTO Votes VALUES (71, 154, 'yes');
INSERT INTO Votes VALUES (84, 154, 'no');
INSERT INTO Votes VALUES (91, 154, 'no');
INSERT INTO Votes VALUES (97, 154, 'no');
INSERT INTO Votes VALUES (101, 154, 'no');
INSERT INTO Votes VALUES (114, 154, 'abstention');
INSERT INTO Votes VALUES (118, 154, 'no');
INSERT INTO Votes VALUES (3, 76, 'abstention');
INSERT INTO Votes VALUES (25, 76, 'yes');
INSERT INTO Votes VALUES (36, 76, 'yes');
INSERT INTO Votes VALUES (48, 76, 'yes');
INSERT INTO Votes VALUES (52, 76, 'abstention');
INSERT INTO Votes VALUES (63, 76, 'abstention');
INSERT INTO Votes VALUES (71, 76, 'abstention');
INSERT INTO Votes VALUES (84, 76, 'yes');
INSERT INTO Votes VALUES (91, 76, 'yes');
INSERT INTO Votes VALUES (97, 76, 'yes');
INSERT INTO Votes VALUES (101, 76, 'abstention');
INSERT INTO Votes VALUES (114, 76, 'yes');
INSERT INTO Votes VALUES (118, 76, 'yes');
INSERT INTO Votes VALUES (3, 132, 'abstention');
INSERT INTO Votes VALUES (25, 132, 'abstention');
INSERT INTO Votes VALUES (36, 132, 'no');
INSERT INTO Votes VALUES (48, 132, 'yes');
INSERT INTO Votes VALUES (52, 132, 'no');
INSERT INTO Votes VALUES (63, 132, 'yes');
INSERT INTO Votes VALUES (71, 132, 'yes');
INSERT INTO Votes VALUES (84, 132, 'yes');
INSERT INTO Votes VALUES (91, 132, 'yes');
INSERT INTO Votes VALUES (97, 132, 'yes');
INSERT INTO Votes VALUES (101, 132, 'abstention');
INSERT INTO Votes VALUES (114, 132, 'abstention');
INSERT INTO Votes VALUES (118, 132, 'no');
