CREATE DATABASE RandomCharacterCreator_WFRP;
USE RandomCharacterCreator_WFRP;

CREATE TABLE Species (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    InitialPercentage INT NOT NULL,
    MaxPercentage INT NOT NULL
);

CREATE TABLE Class (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Career (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    ClassID INT NOT NULL,
    FOREIGN KEY (ClassID) REFERENCES Class(ID)
);

CREATE TABLE SpeciesCareer (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    InitialPercentage INT NOT NULL,
    MaxPercentage INT NOT NULL,
    SpeciesID INT NOT NULL,
    CareerID INT NOT NULL,
    FOREIGN KEY (SpeciesID) REFERENCES Species(ID),
    FOREIGN KEY (CareerID) REFERENCES Career(ID)
);

CREATE TABLE Skills (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE SpeciesSkills (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    SpeciesID INT NOT NULL,
    SkillID INT NOT NULL,
    FOREIGN KEY (SpeciesID) REFERENCES Species(ID),
    FOREIGN KEY (SkillID) REFERENCES Skills(ID)
);

CREATE TABLE CareerSkills (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CareerID INT NOT NULL,
    SkillID INT NOT NULL,
    FOREIGN KEY (CareerID) REFERENCES Career(ID),
    FOREIGN KEY (SkillID) REFERENCES Skills(ID)
);

CREATE TABLE Talents (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE SpeciesTalents (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    SpeciesID INT NOT NULL,
    TalentID INT NOT NULL,
    FOREIGN KEY (SpeciesID) REFERENCES Species(ID),
    FOREIGN KEY (TalentID) REFERENCES Talents(ID)
);

CREATE TABLE CareerTalents (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CareerID INT NOT NULL,
    TalentID INT NOT NULL,
    FOREIGN KEY (CareerID) REFERENCES Career(ID),
    FOREIGN KEY (TalentID) REFERENCES Talents(ID)
);

CREATE TABLE Attributes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE SpeciesAttributes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    SpeciesID INT NOT NULL,
    AttributesID INT NOT NULL,
    AdditionalAdjustment INT NOT NULL,
    FOREIGN KEY (SpeciesID) REFERENCES Species(ID),
    FOREIGN KEY (AttributesID) REFERENCES Attributes(ID)
);

CREATE TABLE CareerAttributes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CareerID INT NOT NULL,
    AttributesID INT NOT NULL,
    CareerLevel INT NOT NULL,
    FOREIGN KEY (CareerID) REFERENCES Career(ID),
    FOREIGN KEY (AttributesID) REFERENCES Attributes(ID)
);

CREATE TABLE CareerTalents (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CareerID INT NOT NULL,
    TalentID INT NOT NULL,
    CareerLevel INT NOT NULL,
    FOREIGN KEY (CareerID) REFERENCES Career(ID),
    FOREIGN KEY (TalentID) REFERENCES Talents(ID)
);

INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Human', 1, 88);
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Halfling', 89, 92);
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Dwarf', 93, 96);
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Ogre', 97, 97);
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Gnome', 98, 98);
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('High Elf', 99, 99);
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Wood Elf', 100, 100);

INSERT INTO Class (Name) VALUES ('Academics');
INSERT INTO Class (Name) VALUES ('Burghers');
INSERT INTO Class (Name) VALUES ('Courtiers');
INSERT INTO Class (Name) VALUES ('Peasants');
INSERT INTO Class (Name) VALUES ('Rangers');
INSERT INTO Class (Name) VALUES ('Riverfolk');
INSERT INTO Class (Name) VALUES ('Rogues');
INSERT INTO Class (Name) VALUES ('Warriors');

INSERT INTO Career (Name, ClassID) VALUES ('Apothecary', 1);
INSERT INTO Career (Name, ClassID) VALUES ('Engineer', 1);
INSERT INTO Career (Name, ClassID) VALUES ('Lawyer', 1);
INSERT INTO Career (Name, ClassID) VALUES ('Nun', 1);
INSERT INTO Career (Name, ClassID) VALUES ('Physician', 1);
INSERT INTO Career (Name, ClassID) VALUES ('Priest', 1);
INSERT INTO Career (Name, ClassID) VALUES ('Scholar', 1);
INSERT INTO Career (Name, ClassID) VALUES ('Wizard', 1);
INSERT INTO Career (Name, ClassID) VALUES ('Agitator', 2);
INSERT INTO Career (Name, ClassID) VALUES ('Artisan', 2);
INSERT INTO Career (Name, ClassID) VALUES ('Beggar', 2);
INSERT INTO Career (Name, ClassID) VALUES ('Investigator', 2);
INSERT INTO Career (Name, ClassID) VALUES ('Merchant', 2);
INSERT INTO Career (Name, ClassID) VALUES ('Rat Catcher', 2);
INSERT INTO Career (Name, ClassID) VALUES ('Townsman', 2);
INSERT INTO Career (Name, ClassID) VALUES ('Watchman', 2);
INSERT INTO Career (Name, ClassID) VALUES ('Advisor', 3);
INSERT INTO Career (Name, ClassID) VALUES ('Artist', 3);
INSERT INTO Career (Name, ClassID) VALUES ('Duellist', 3);
INSERT INTO Career (Name, ClassID) VALUES ('Envoy', 3);
INSERT INTO Career (Name, ClassID) VALUES ('Noble', 3);
INSERT INTO Career (Name, ClassID) VALUES ('Servant', 3);
INSERT INTO Career (Name, ClassID) VALUES ('Spy', 3);
INSERT INTO Career (Name, ClassID) VALUES ('Warden', 3);
INSERT INTO Career (Name, ClassID) VALUES ('Bailiff', 4);
INSERT INTO Career (Name, ClassID) VALUES ('Hedge Witch', 4);
INSERT INTO Career (Name, ClassID) VALUES ('Herbalist', 4);
INSERT INTO Career (Name, ClassID) VALUES ('Hunter', 4);
INSERT INTO Career (Name, ClassID) VALUES ('Miner', 4);
INSERT INTO Career (Name, ClassID) VALUES ('Mystic', 4);
INSERT INTO Career (Name, ClassID) VALUES ('Scout', 4);
INSERT INTO Career (Name, ClassID) VALUES ('Villager', 4);
INSERT INTO Career (Name, ClassID) VALUES ('Bounty Hunter', 5);
INSERT INTO Career (Name, ClassID) VALUES ('Coachman', 5);
INSERT INTO Career (Name, ClassID) VALUES ('Entertainer', 5);
INSERT INTO Career (Name, ClassID) VALUES ('Flagellant', 5);
INSERT INTO Career (Name, ClassID) VALUES ('Messenger', 5);
INSERT INTO Career (Name, ClassID) VALUES ('Pedlar', 5);
INSERT INTO Career (Name, ClassID) VALUES ('Road Warden', 5);
INSERT INTO Career (Name, ClassID) VALUES ('Witch Hunter', 5);
INSERT INTO Career (Name, ClassID) VALUES ('Boatman', 6);
INSERT INTO Career (Name, ClassID) VALUES ('Huffer', 6);
INSERT INTO Career (Name, ClassID) VALUES ('Riverwarden', 6);
INSERT INTO Career (Name, ClassID) VALUES ('Riverwoman', 6);
INSERT INTO Career (Name, ClassID) VALUES ('Seaman', 6);
INSERT INTO Career (Name, ClassID) VALUES ('Smuggler', 6);
INSERT INTO Career (Name, ClassID) VALUES ('Stevedore', 6);
INSERT INTO Career (Name, ClassID) VALUES ('Wrecker', 6);
INSERT INTO Career (Name, ClassID) VALUES ('Bawd', 7);
INSERT INTO Career (Name, ClassID) VALUES ('Charlatan', 7);
INSERT INTO Career (Name, ClassID) VALUES ('Fence', 7);
INSERT INTO Career (Name, ClassID) VALUES ('Grave Robber', 7);
INSERT INTO Career (Name, ClassID) VALUES ('Outlaw', 7);
INSERT INTO Career (Name, ClassID) VALUES ('Racketeer', 7);
INSERT INTO Career (Name, ClassID) VALUES ('Thief', 7);
INSERT INTO Career (Name, ClassID) VALUES ('Witch', 7);
INSERT INTO Career (Name, ClassID) VALUES ('Cavalryman', 8);
INSERT INTO Career (Name, ClassID) VALUES ('Guard', 8);
INSERT INTO Career (Name, ClassID) VALUES ('Knight', 8);
INSERT INTO Career (Name, ClassID) VALUES ('Pit Fighter', 8);
INSERT INTO Career (Name, ClassID) VALUES ('Protagonist', 8);
INSERT INTO Career (Name, ClassID) VALUES ('Soldier', 8);
INSERT INTO Career (Name, ClassID) VALUES ('Slayer', 8);
INSERT INTO Career (Name, ClassID) VALUES ('Warrior Priest', 8);

INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (1, 1, 1, 1);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (2, 2, 1, 2);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (3, 3, 1, 3);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (4, 5, 1, 4);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (6, 6, 1, 5);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (7, 11, 1, 6);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (12, 13, 1, 7);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (14, 14, 1, 8);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (15, 15, 1, 9);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (16, 17, 1, 10);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (18, 19, 1, 11);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (20, 20, 1, 12);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (21, 21, 1, 13);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (22, 23, 1, 14);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (24, 26, 1, 15);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (27, 27, 1, 16);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (28, 28, 1, 17);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (29, 29, 1, 18);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (30, 30, 1, 19);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (31, 31, 1, 20);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (32, 32, 1, 21);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (33, 35, 1, 22);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (36, 36, 1, 23);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (37, 37, 1, 24);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (38, 38, 1, 25);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (39, 39, 1, 26);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (40, 40, 1, 27);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (41, 42, 1, 28);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (43, 43, 1, 29);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (44, 44, 1, 30);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (45, 45, 1, 31);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (46, 50, 1, 32);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (51, 51, 1, 33);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (52, 52, 1, 34);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (53, 54, 1, 35);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (55, 56, 1, 36);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (57, 57, 1, 37);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (58, 58, 1, 38);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (59, 59, 1, 39);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (60, 60, 1, 40);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (61, 62, 1, 41);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (63, 63, 1, 42);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (64, 65, 1, 43);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (66, 68, 1, 44);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (69, 70, 1, 45);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (71, 71, 1, 46);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (72, 73, 1, 47);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (74, 74, 1, 48);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (75, 76, 1, 49);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (77, 77, 1, 50);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (78, 78, 1, 51);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (79, 79, 1, 52);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (80, 83, 1, 53);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (84, 84, 1, 54);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (85, 87, 1, 55);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (88, 88, 1, 56);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (89, 90, 1, 57);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (91, 92, 1, 58);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (93, 93, 1, 59);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (94, 94, 1, 60);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (95, 95, 1, 61);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (96, 99, 1, 62);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (100, 100, 1, 64);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (1, 1, 2, 1);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (2, 4, 2, 2);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (5, 6, 2, 3);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (7, 7, 2, 5);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (8, 9, 2, 7);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (10, 11, 2, 9);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (12, 17, 2, 10);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (18, 18, 2, 11);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (19, 20, 2, 12);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (21, 24, 2, 13);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (25, 25, 2, 14);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (26, 31, 2, 15);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (32, 34, 2, 16);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (35, 36, 2, 17);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (37, 37, 2, 18);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (38, 38, 2, 19);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (39, 40, 2, 20);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (41, 41, 2, 21);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (42, 42, 2, 22);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (43, 43, 2, 23);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (44, 45, 2, 24);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (46, 47, 2, 25);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (48, 49, 2, 28);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (50, 54, 2, 29);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (55, 55, 2, 31);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (56, 56, 2, 32);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (57, 60, 2, 33);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (61, 61, 2, 34);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (62, 63, 2, 35);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (64, 65, 2, 37);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (66, 67, 2, 38);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (68, 69, 2, 41);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (70, 70, 2, 42);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (71, 72, 2, 44);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (73, 73, 2, 45);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (74, 75, 2, 46);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (76, 77, 2, 47);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (78, 78, 2, 48);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (79, 79, 2, 51);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (80, 82, 2, 53);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (83, 83, 2, 54);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (84, 84, 2, 55);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (85, 87, 2, 58);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (88, 90, 2, 60);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (91, 93, 2, 61);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (94, 96, 2, 62);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (97, 100, 2, 64);
-- Continuar a partir dos Halflings