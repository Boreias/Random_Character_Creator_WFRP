CREATE DATABASE RandomCharacterCreator_WFRP;
USE RandomCharacterCreator_WFRP;


CREATE TABLE Species (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    InitialPercentage INT NOT NULL,
    MaxPercentage INT NOT NULL
);


CREATE TABLE Attributes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
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
    Name VARCHAR(255) NOT NULL,
    IsBasic BOOLEAN NOT NULL,
    AttributeID INT NOT NULL,
    FOREIGN KEY (AttributeID) REFERENCES Attributes(ID)
);


CREATE TABLE GroupSkill (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    SkillID INT NOT NULL,
    FOREIGN KEY (SkillID) REFERENCES Skills(ID)
);


CREATE TABLE SpeciesSkills (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    SkillGroup VARCHAR(255),
    SpeciesID INT NOT NULL,
    SkillID INT NOT NULL,
    FOREIGN KEY (SpeciesID) REFERENCES Species(ID),
    FOREIGN KEY (SkillID) REFERENCES Skills(ID)
);


CREATE TABLE CareerSkills (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CareerLevel INT NOT NULL,
    CareerID INT NOT NULL,
    SkillID INT NOT NULL,
    SkillGroup VARCHAR(255),
    FOREIGN KEY (CareerID) REFERENCES Career(ID),
    FOREIGN KEY (SkillID) REFERENCES Skills(ID)
);


CREATE TABLE CareerTradeSkill (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CareerSkillsID INT NOT NULL,
    FOREIGN KEY (CareerSkillsID) REFERENCES CareerSkills(ID)
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


CREATE TABLE Gods (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);


CREATE TABLE LoreMagic (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);


CREATE TABLE Conditions (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);


CREATE TABLE WeaponCategory (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    IsMelee BOOLEAN NOT NULL
);


CREATE TABLE Symptoms (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);


CREATE TABLE Diseases (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Contraction VARCHAR(255) NOT NULL,
    Incubation VARCHAR(255) NOT NULL,
    Duration VARCHAR(255) NOT NULL,
);


CREATE TABLE DiseaseSymptoms (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    DiseaseID INT NOT NULL,
    SymptomID INT NOT NULL,
    FOREIGN KEY (DiseaseID) REFERENCES Diseases(ID),
    FOREIGN KEY (SymptomID) REFERENCES Symptoms(ID)
);


INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Human', 1, 88); -- 1
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Halfling', 89, 92); -- 2
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Dwarf', 93, 96); -- 3
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Ogre', 97, 97); -- 4
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Gnome', 98, 98); -- 5
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('High Elf', 99, 99); -- 6
INSERT INTO Species (Name, InitialPercentage, MaxPercentage) VALUES ('Wood Elf', 100, 100); -- 7


INSERT INTO Class (Name) VALUES ('Academics');
INSERT INTO Class (Name) VALUES ('Burghers');
INSERT INTO Class (Name) VALUES ('Courtiers');
INSERT INTO Class (Name) VALUES ('Peasants');
INSERT INTO Class (Name) VALUES ('Rangers');
INSERT INTO Class (Name) VALUES ('Riverfolk');
INSERT INTO Class (Name) VALUES ('Rogues');
INSERT INTO Class (Name) VALUES ('Warriors');


INSERT INTO Career (Name, ClassID) VALUES ('Apothecary', 1); -- 1
INSERT INTO Career (Name, ClassID) VALUES ('Engineer', 1); -- 2
INSERT INTO Career (Name, ClassID) VALUES ('Lawyer', 1); -- 3
INSERT INTO Career (Name, ClassID) VALUES ('Nun', 1); -- 4
INSERT INTO Career (Name, ClassID) VALUES ('Physician', 1); -- 5
INSERT INTO Career (Name, ClassID) VALUES ('Priest', 1); -- 6
INSERT INTO Career (Name, ClassID) VALUES ('Scholar', 1); -- 7
INSERT INTO Career (Name, ClassID) VALUES ('Wizard', 1); -- 8
INSERT INTO Career (Name, ClassID) VALUES ('Agitator', 2); -- 9
INSERT INTO Career (Name, ClassID) VALUES ('Artisan', 2); -- 10
INSERT INTO Career (Name, ClassID) VALUES ('Beggar', 2); -- 11
INSERT INTO Career (Name, ClassID) VALUES ('Investigator', 2); -- 12
INSERT INTO Career (Name, ClassID) VALUES ('Merchant', 2); -- 13
INSERT INTO Career (Name, ClassID) VALUES ('Rat Catcher', 2); -- 14
INSERT INTO Career (Name, ClassID) VALUES ('Townsman', 2); -- 15
INSERT INTO Career (Name, ClassID) VALUES ('Watchman', 2); -- 16
INSERT INTO Career (Name, ClassID) VALUES ('Advisor', 3); -- 17
INSERT INTO Career (Name, ClassID) VALUES ('Artist', 3); -- 18
INSERT INTO Career (Name, ClassID) VALUES ('Duellist', 3); -- 19
INSERT INTO Career (Name, ClassID) VALUES ('Envoy', 3); -- 20
INSERT INTO Career (Name, ClassID) VALUES ('Noble', 3); -- 21
INSERT INTO Career (Name, ClassID) VALUES ('Servant', 3); -- 22
INSERT INTO Career (Name, ClassID) VALUES ('Spy', 3); -- 23
INSERT INTO Career (Name, ClassID) VALUES ('Warden', 3); -- 24
INSERT INTO Career (Name, ClassID) VALUES ('Bailiff', 4); -- 25
INSERT INTO Career (Name, ClassID) VALUES ('Hedge Witch', 4); -- 26
INSERT INTO Career (Name, ClassID) VALUES ('Herbalist', 4); -- 27
INSERT INTO Career (Name, ClassID) VALUES ('Hunter', 4); -- 28
INSERT INTO Career (Name, ClassID) VALUES ('Miner', 4); -- 29
INSERT INTO Career (Name, ClassID) VALUES ('Mystic', 4); -- 30
INSERT INTO Career (Name, ClassID) VALUES ('Scout', 4); -- 31
INSERT INTO Career (Name, ClassID) VALUES ('Villager', 4); -- 32
INSERT INTO Career (Name, ClassID) VALUES ('Bounty Hunter', 5); -- 33
INSERT INTO Career (Name, ClassID) VALUES ('Coachman', 5); -- 34
INSERT INTO Career (Name, ClassID) VALUES ('Entertainer', 5); -- 35
INSERT INTO Career (Name, ClassID) VALUES ('Flagellant', 5); -- 36
INSERT INTO Career (Name, ClassID) VALUES ('Messenger', 5); -- 37
INSERT INTO Career (Name, ClassID) VALUES ('Pedlar', 5); -- 38
INSERT INTO Career (Name, ClassID) VALUES ('Road Warden', 5); -- 39
INSERT INTO Career (Name, ClassID) VALUES ('Witch Hunter', 5); -- 40
INSERT INTO Career (Name, ClassID) VALUES ('Boatman', 6); -- 41
INSERT INTO Career (Name, ClassID) VALUES ('Huffer', 6); -- 42
INSERT INTO Career (Name, ClassID) VALUES ('Riverwarden', 6); -- 43
INSERT INTO Career (Name, ClassID) VALUES ('Riverwoman', 6); -- 44
INSERT INTO Career (Name, ClassID) VALUES ('Seaman', 6); -- 45
INSERT INTO Career (Name, ClassID) VALUES ('Smuggler', 6); -- 46
INSERT INTO Career (Name, ClassID) VALUES ('Stevedore', 6); -- 47
INSERT INTO Career (Name, ClassID) VALUES ('Wrecker', 6); -- 48
INSERT INTO Career (Name, ClassID) VALUES ('Bawd', 7); -- 49
INSERT INTO Career (Name, ClassID) VALUES ('Charlatan', 7); -- 50
INSERT INTO Career (Name, ClassID) VALUES ('Fence', 7); -- 51
INSERT INTO Career (Name, ClassID) VALUES ('Grave Robber', 7); -- 52
INSERT INTO Career (Name, ClassID) VALUES ('Outlaw', 7); -- 53
INSERT INTO Career (Name, ClassID) VALUES ('Racketeer', 7); -- 54
INSERT INTO Career (Name, ClassID) VALUES ('Thief', 7); -- 55
INSERT INTO Career (Name, ClassID) VALUES ('Witch', 7); -- 56
INSERT INTO Career (Name, ClassID) VALUES ('Cavalryman', 8); -- 57
INSERT INTO Career (Name, ClassID) VALUES ('Guard', 8); -- 58
INSERT INTO Career (Name, ClassID) VALUES ('Knight', 8); -- 59
INSERT INTO Career (Name, ClassID) VALUES ('Pit Fighter', 8); -- 60
INSERT INTO Career (Name, ClassID) VALUES ('Protagonist', 8); -- 61
INSERT INTO Career (Name, ClassID) VALUES ('Slayer', 8); -- 62
INSERT INTO Career (Name, ClassID) VALUES ('Soldier', 8); -- 63
INSERT INTO Career (Name, ClassID) VALUES ('Warrior Priest', 8); -- 64
-- New Careers
INSERT INTO Career (Name, ClassID) VALUES ('Butcher', 1); -- 65
INSERT INTO Career (Name, ClassID) VALUES ('Rhinox Herder', 4); -- 66
INSERT INTO Career (Name, ClassID) VALUES ('Maneater', 8); -- 67


-- Human
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
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (96, 99, 1, 63);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (100, 100, 1, 64);
-- Halfling
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (1, 1, 2, 1);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (2, 2, 2, 2);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (3, 4, 2, 3);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (5, 6, 2, 5);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (7, 8, 2, 7);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (9, 10, 2, 9);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (11, 15, 2, 10);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (16, 19, 2, 11);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (20, 21, 2, 12);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (22, 25, 2, 13);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (26, 28, 2, 14);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (29, 31, 2, 15);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (32, 33, 2, 16);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (34, 34, 2, 17);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (35, 36, 2, 18);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (37, 37, 2, 20);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (38, 43, 2, 22);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (44, 44, 2, 23);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (45, 46, 2, 24);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (47, 47, 2, 25);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (48, 50, 2, 27);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (51, 52, 2, 28);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (53, 53, 2, 29);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (54, 54, 2, 31);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (55, 57, 2, 32);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (58, 58, 2, 33);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (59, 60, 2, 34);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (61, 63, 2, 35);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (64, 65, 2, 37);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (66, 67, 2, 38);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (68, 68, 2, 39);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (69, 69, 2, 41);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (70, 70, 2, 42);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (71, 71, 2, 43);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (72, 74, 2, 44);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (75, 75, 2, 45);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (76, 79, 2, 46);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (80, 82, 2, 47);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (83, 85, 2, 49);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (86, 86, 2, 50);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (87, 87, 2, 51);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (88, 88, 2, 52);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (89, 89, 2, 53);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (90, 90, 2, 54);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (91, 94, 2, 55);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (95, 96, 2, 58);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (97, 97, 2, 60);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (98, 100, 2, 63);
-- Dwarf
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (1, 1, 3, 1);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (2, 4, 3, 2);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (5, 6, 3, 3);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (7, 7, 3, 5);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (8, 9, 3, 7);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (10, 11, 3, 9);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (12, 17, 3, 10);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (18, 18, 3, 11);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (19, 20, 3, 12);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (21, 24, 3, 13);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (25, 25, 3, 14);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (26, 31, 3, 15);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (32, 34, 3, 16);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (35, 36, 3, 17);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (37, 37, 3, 18);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (38, 38, 3, 19);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (39, 40, 3, 20);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (41, 41, 3, 21);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (42, 42, 3, 22);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (43, 43, 3, 23);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (44, 45, 3, 24);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (46, 47, 3, 25);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (48, 49, 3, 28);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (50, 54, 3, 29);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (55, 55, 3, 31);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (56, 56, 3, 32);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (57, 60, 3, 33);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (61, 61, 3, 34);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (62, 63, 3, 35);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (64, 65, 3, 37);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (66, 67, 3, 38);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (68, 69, 3, 41);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (70, 70, 3, 42);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (71, 72, 3, 44);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (73, 73, 3, 45);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (74, 75, 3, 46);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (76, 77, 3, 47);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (78, 78, 3, 48);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (79, 79, 3, 51);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (80, 82, 3, 53);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (83, 83, 3, 54);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (84, 84, 3, 55);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (85, 87, 3, 58);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (88, 90, 3, 60);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (91, 93, 3, 61);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (94, 96, 3, 62);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (97, 100, 3, 63);
-- Ogre
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (1, 1, 4, 65);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (2, 2, 4, 10);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (3, 4, 4, 11);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (5, 6, 4, 14);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (7, 12, 4, 16);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (13, 13, 4, 22);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (14, 14, 4, 25);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (15, 21, 4, 28);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (22, 23, 4, 29);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (24, 26, 4, 66);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (27, 29, 4, 33);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (30, 32, 4, 35);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (33, 39, 4, 38);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (40, 40, 4, 45);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (41, 43, 4, 47);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (44, 47, 4, 52);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (48, 56, 4, 53);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (57, 61, 4, 54);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (62, 68, 4, 58);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (69, 79, 4, 60);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (80, 84, 4, 61);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (85, 91, 4, 67);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (92, 100, 4, 63);
-- Gnome
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (1, 1, 5, 1);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (2, 2, 5, 3);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (3, 4, 5, 5);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (5, 5, 5, 6);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (6, 7, 5, 7);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (8, 14, 5, 8);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (15, 15, 5, 9);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (16, 17, 5, 10);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (18, 18, 5, 11);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (19, 19, 5, 12);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (20, 21, 5, 13);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (22, 22, 5, 14);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (23, 28, 5, 15);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (29, 29, 5, 16);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (30, 30, 5, 17);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (31, 31, 5, 18);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (32, 32, 5, 20);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (33, 33, 5, 21);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (34, 35, 5, 22);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (36, 40, 5, 23);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (41, 42, 5, 24);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (43, 43, 5, 25);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (44, 44, 5, 27);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (45, 46, 5, 28);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (47, 54, 5, 29);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (55, 58, 5, 31);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (59, 62, 5, 32);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (63, 63, 5, 33);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (64, 68, 5, 35);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (69, 69, 5, 37);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (70, 75, 5, 38);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (76, 76, 5, 41);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (77, 80, 5, 44);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (81, 83, 5, 46);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (84, 85, 5, 49);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (86, 90, 5, 50);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (91, 91, 5, 51);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (92, 92, 5, 53);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (93, 94, 5, 54);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (95, 97, 5, 55);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (98, 98, 5, 58);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (99, 99, 5, 63);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (100, 100, 5, 64);
-- High Elf
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (1, 2, 6, 1);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (3, 6, 6, 3);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (7, 8, 6, 5);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (9, 12, 6, 7);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (13, 16, 6, 8);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (17, 19, 6, 10);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (20, 21, 6, 12);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (22, 26, 6, 13);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (27, 28, 6, 15);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (29, 29, 6, 16);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (30, 31, 6, 17);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (32, 32, 6, 18);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (33, 34, 6, 19);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (35, 37, 6, 20);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (38, 40, 6, 21);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (41, 43, 6, 23);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (44, 45, 6, 24);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (46, 47, 6, 27);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (48, 50, 6, 28);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (51, 56, 6, 31);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (57, 59, 6, 33);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (60, 62, 6, 35);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (63, 63, 6, 37);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (64, 64, 6, 41);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (65, 79, 6, 45);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (80, 80, 6, 46);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (81, 82, 6, 49);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (83, 85, 6, 50);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (86, 88, 6, 53);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (89, 92, 6, 57);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (93, 94, 6, 58);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (95, 95, 6, 60);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (96, 97, 6, 61);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (98, 98, 6, 63);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (99, 100, 6, 63);
-- Wood Elf
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (1, 1, 7, 7);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (2, 5, 7, 8);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (6, 10, 7, 10);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (11, 14, 7, 17);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (15, 18, 7, 18);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (19, 25, 7, 20);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (26, 31, 7, 21);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (32, 35, 7, 23);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (36, 42, 7, 27);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (43, 52, 7, 28);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (53, 57, 7, 30);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (58, 68, 7, 31);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (69, 70, 7, 33);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (71, 75, 7, 35);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (76, 78, 7, 37);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (79, 79, 7, 48);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (80, 85, 7, 53);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (86, 90, 7, 57);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (91, 92, 7, 58);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (93, 94, 7, 59);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (95, 96, 7, 60);
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (97, 100, 7, 63);


-- Attributes
INSERT INTO Attributes (Name) VALUES ('WS'); -- 1
INSERT INTO Attributes (Name) VALUES ('BS'); -- 2
INSERT INTO Attributes (Name) VALUES ('S'); -- 3
INSERT INTO Attributes (Name) VALUES ('T'); -- 4
INSERT INTO Attributes (Name) VALUES ('I'); -- 5
INSERT INTO Attributes (Name) VALUES ('Ag'); -- 6
INSERT INTO Attributes (Name) VALUES ('Dex'); -- 7
INSERT INTO Attributes (Name) VALUES ('Int'); -- 8
INSERT INTO Attributes (Name) VALUES ('WP'); -- 9
INSERT INTO Attributes (Name) VALUES ('Fel'); -- 10


-- Human
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (1, 1, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (1, 2, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (1, 3, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (1, 4, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (1, 5, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (1, 6, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (1, 7, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (1, 8, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (1, 9, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (1, 10, 20);
-- Halfling
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (2, 1, 10);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (2, 2, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (2, 3, 10);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (2, 4, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (2, 5, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (2, 6, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (2, 7, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (2, 8, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (2, 9, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (2, 10, 30);
-- Dwarf
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (3, 1, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (3, 2, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (3, 3, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (3, 4, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (3, 5, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (3, 6, 10);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (3, 7, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (3, 8, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (3, 9, 40);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (3, 10, 10);
-- Ogre
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (4, 1, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (4, 2, 10);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (4, 3, 35);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (4, 4, 35);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (4, 5, 0);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (4, 6, 15);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (4, 7, 10);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (4, 8, 10);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (4, 9, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (4, 10, 10);
-- Gnome
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (5, 1, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (5, 2, 10);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (5, 3, 10);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (5, 4, 15);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (5, 5, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (5, 6, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (5, 7, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (5, 8, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (5, 9, 40);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (5, 10, 15);
-- High Elf
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (6, 1, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (6, 2, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (6, 3, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (6, 4, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (6, 5, 40);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (6, 6, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (6, 7, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (6, 8, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (6, 9, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (6, 10, 20);
-- Wood Elf
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (7, 1, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (7, 2, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (7, 3, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (7, 4, 20);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (7, 5, 40);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (7, 6, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (7, 7, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (7, 8, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (7, 9, 30);
INSERT INTO SpeciesAttributes (SpeciesID, AttributeID, AdditionalAdjustment) VALUES (7, 10, 20);


-- Skills
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Animal Care', FALSE, FALSE, 8); -- 1
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Animal Training', FALSE, TRUE, 8); -- 2
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Art', TRUE, TRUE, 7); -- 3
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Athletics', TRUE, FALSE, 6); -- 4
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Bribery', TRUE, FALSE, 10); -- 5
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Channelling', FALSE, TRUE, 9); -- 6
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Charm', TRUE, FALSE, 10); -- 7
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Charm Animal', TRUE, FALSE, 9); -- 8
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Climb', TRUE, FALSE, 3); -- 9
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Consume Alcohol', TRUE, FALSE, 4); -- 10
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Cool', TRUE, FALSE, 9); -- 11
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Dodge', TRUE, FALSE, 6); -- 12
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Drive', TRUE, FALSE, 6); -- 13
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Endurance', TRUE, FALSE, 4); -- 14
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Entertain', TRUE, TRUE, 10); -- 15
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Evaluate', FALSE, FALSE, 8); -- 16
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Gamble', TRUE, FALSE, 8); -- 17
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Gossip', TRUE, FALSE, 10); -- 18
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Haggle', TRUE, FALSE, 10); -- 19
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Heal', FALSE, FALSE, 8); -- 20
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Intimidate', TRUE, FALSE, 3); -- 21
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Intuition', TRUE, FALSE, 5); -- 22
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Language', FALSE, TRUE, 8); -- 23
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Leadership', TRUE, FALSE, 10); -- 24
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Lore', FALSE, TRUE, 8); -- 25
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Melee', TRUE, TRUE, 1); -- 26
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Navigation', TRUE, FALSE, 5); -- 27
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Outdoor Survival', TRUE, FALSE, 8); -- 28
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Perception', TRUE, FALSE, 5); -- 29
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Perform', FALSE, TRUE, 6); -- 30
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Pick Lock', FALSE, FALSE, 7); -- 31
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Play', FALSE, TRUE, 7); -- 32
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Pray', FALSE, FALSE, 10); -- 33
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Ranged', FALSE, TRUE, 2); -- 34
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Research', FALSE, FALSE, 8); -- 35
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Ride', TRUE, TRUE, 6); -- 36
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Row', TRUE, FALSE, 3); -- 37
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Sail', FALSE, TRUE, 6); -- 38
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Secret Signs', FALSE, TRUE, 8); -- 39
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Set Trap', FALSE, FALSE, 7); -- 40
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Sleight of Hand', FALSE, FALSE, 7); -- 41
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Stealth', TRUE, TRUE, 6); -- 42
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Swim', FALSE, FALSE, 3); -- 43
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Track', FALSE, FALSE, 5); -- 44
INSERT INTO Skills (Name, IsBasic, IsGrouped, AttributeID) VALUES ('Trade', FALSE, TRUE, 7); -- 45


-- Human
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 1, 1); -- 1
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 1, 7); -- 2
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 1, 11); -- 3
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 1, 16); -- 4
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 1, 18); -- 5
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 1, 19); -- 6
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Bretonnian', 1, 23); -- 7
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Wastelander', 1, 23); -- 8
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 1, 24); -- 9
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Reikland', 1, 25); -- 10
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Basic', 1, 26); -- 11
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Bow', 1, 34); -- 12
-- Halflings
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 2, 7); -- 13
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 2, 10); -- 14
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 2, 12); -- 15
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 2, 17); -- 16
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 2, 19); -- 17
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 2, 22); -- 18
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Mootish', 2, 23); -- 19
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Reikland', 2, 25); -- 20
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 2, 29); -- 21
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 2, 41); -- 22
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Any', 2, 42); -- 23
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Cook', 2, 45); -- 24
-- Dwarfs
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 3, 10); -- 25
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 3, 11); -- 26
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 3, 14); -- 27
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Storytelling', 3, 15); -- 28
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 3, 16); -- 29
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 3, 21); -- 30
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Khazalid', 3, 23); -- 31
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Dwarfs', 3, 25); -- 32
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Geology', 3, 25); -- 33
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Metallurgy', 3, 25); -- 34
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Basic', 3, 26); -- 35
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Any', 3, 45); -- 36
-- Ogres
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 4, 4); -- 37
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 4, 10); -- 38
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 4, 14); -- 39
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Storytelling', 4, 15); -- 40
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 4, 21); -- 41
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Grumbarth', 4, 23); -- 42
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Ogres', 4, 25); -- 43
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Basic', 4, 26); -- 44
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Brawling', 4, 26); -- 45
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 4, 27); -- 46
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 4, 28); -- 47
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 4, 44); -- 48
-- Gnomes
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Ulgu', 5, 6); -- 49
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 5, 7); -- 50
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 5, 10); -- 51
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 5, 12); -- 52
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Any', 5, 15); -- 53
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 5, 18); -- 54
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 5, 19); -- 55
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Ghassally', 5, 23); -- 56
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Magick', 5, 23); -- 57
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Wastelander', 5, 23); -- 58
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 5, 28); -- 59
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Any', 5, 42); -- 60
-- High Elves
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 6, 11); -- 61
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Sing', 6, 15); -- 62
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 6, 16); -- 63
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Eltharin', 6, 23); -- 64
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 6, 24); -- 65
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Basic', 6, 26); -- 66
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 6, 27); -- 67
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 6, 29); -- 68
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Any', 6, 32); -- 69
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Bow', 6, 34); -- 70
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 6, 38); -- 71
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 6, 43); -- 72
-- Wood Elves
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 7, 4); -- 73
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 7, 9); -- 74
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 7, 14); -- 75
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Sing', 7, 15); -- 76
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 7, 21); -- 77
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Eltharin', 7, 23); -- 78
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Basic', 7, 26); -- 79
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 7, 28); -- 80
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 7, 29); -- 81
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Bow', 7, 34); -- 82
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES ('Rural', 7, 42); -- 83
INSERT INTO SpeciesSkills (SkillGroup, SpeciesID, SkillID) VALUES (NULL, 7, 44); -- 84


INSERT INTO GroupSkills (Name, SkillID) VALUES ('Cartography', 3);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Engraving', 3);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Mosaics', 3);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Painting', 3);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Sculpture', 3);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Tattoo', 3);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Weaving', 3);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Writing', 3);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Calligraphy', 3);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Aqshy', 6);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Azyr', 6);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Chamon', 6);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Dhar', 6);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Ghur', 6);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Ghyran', 6);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Hysh', 6);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Shyish', 6);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Ulgu', 6);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Acting', 15);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Comedy', 15);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Singing', 15);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Storytelling', 15);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Speeches', 15);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Lecture', 15);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Rhetoric', 15);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Fortune Telling', 15);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Prophecy', 15);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Taunt', 15);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Battle Tongue', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Bretonnian', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Classical', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Guilder', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Khazalid', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Magick', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Tilean', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Elthárin', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Estalian', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Gospodarinyi', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Kislevarin', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Kislevite', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Grumbarth', 23);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Art', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Engineering', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Geology', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Heraldry', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('History', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Law', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Magick', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Metallurgy', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Science', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Theology', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Chemistry', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Geography', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Folklore', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Medicine', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Politics', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Warfare', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Genealogy', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Herbs', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Spirits', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Astrology', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Prophecy', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Riverways', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Anatomy', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Torture', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Witches', 25);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Basic', 26);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Brawling', 26);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Cavalry', 26);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Fencing', 26);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Flail', 26);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Parry', 26);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Pole-Arm', 26);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Two-Handed', 26);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Fist', 26);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Acrobatics', 30);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Clowning', 30);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Dancing', 30);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Firebreathing', 30);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Juggling', 30);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Miming', 30);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Rope Walking', 30);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Fight', 30);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Bagpipe', 32);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Lute', 32);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Harpsichord', 32);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Horn', 32);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Violin', 32);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Blackpowder', 34);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Bow', 34);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Crossbow', 34);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Engineering', 34);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Entangling', 34);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Explosives', 34);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Sling', 34);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Throwing', 34);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Demigryph', 36);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Great Wolf', 36);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Griffon', 36);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Horse', 36);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Pegasus', 36);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Barge', 38);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Caravel', 38);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Cog', 38);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Frigate', 38);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Wolfship', 38);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Grey Order', 39);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Guild (any one)', 39);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Ranger', 39);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Scout', 39);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Thief', 39);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Vagabond', 39);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Guilder', 39);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Forbidden Cults', 39);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Rural', 42);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Underground', 42);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Urban', 42);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Apothecary', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Calligrapher', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Chandler', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Carpenter', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Cook', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Embalmer', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Smith', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Tanner', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Engineering', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Explosives', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Blacksmith', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Poisoner', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Brewer', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Vintner', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Barber', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Writing', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Printing', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Gunsmith', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Charms', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Cartographer', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Boatbuilding', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Engraver', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Farrier', 45);
INSERT INTO GroupSkills (Name, SkillID) VALUES ('Farmer', 45);


-- Apothecary
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 1, 10); -- 1
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 1, 20); -- 2
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 1, 23, 'Classical'); -- 3
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 1, 25, 'Chemistry'); -- 4
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 1, 25, 'Medicine'); -- 5
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 1, 25, 'Plants'); -- 6
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 1, 45, 'Apothecary'); -- 7
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 1, 45, 'Poisoner'); -- 8
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 1, 7); -- 9
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 1, 19); -- 10
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 1, 25, 'Science'); -- 11
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 1, 18); -- 12
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 1, 23, 'Guilder'); -- 13
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 1, 29); -- 14
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 1, 22); -- 15
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 1, 24); -- 16
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 1, 35); -- 17
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 1, 39, 'Guilder'); -- 18
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 1, 21); -- 19
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 1, 36,  'Horse'); -- 20
-- Engineer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 2, 10); -- 21
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 2, 11); -- 22
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 2, 14); -- 23
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 2, 23, 'Classical'); -- 24
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 2, 25, 'Engineering'); -- 25
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 2, 29); -- 26
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 2, 34, 'Blackpowder'); -- 27
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 2, 45, 'Engineer'); -- 28
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 2, 13); -- 29
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 2, 12); -- 30
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 2, 27); -- 31
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 2, 34, 'Engineering'); -- 32
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 2, 35); -- 33
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 2, 23, 'Guilder'); -- 34
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 2, 23, 'Khazalid'); -- 35
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 2, 24); -- 36
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 2, 36, 'Horse'); -- 37
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 2, 39, 'Guilder'); -- 38
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 2, 23, 'Any'); -- 39
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 2, 25, 'Any'); -- 40
-- Lawyer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 3, 10); -- 41
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 3, 14); -- 42
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 3, 19); -- 43
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 3, 23, 'Classical'); -- 44
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 3, 25, 'Law'); -- 45
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 3, 25, 'Theology'); -- 46
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 3, 29); -- 47
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 3, 35); -- 48
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 3, 5); -- 49
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 3, 7); -- 50
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 3, 18); -- 51
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 3, 22); -- 52
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 3, 23, 'Guilder'); -- 53
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 3, 39, 'Guilder'); -- 54
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 3, 3, 'Writing'); -- 55
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 3, 15, 'Speeches'); -- 56
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 3, 21); -- 57
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 3, 25, 'Any'); -- 58
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 3, 11); -- 59
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 3, 25, 'Any'); -- 60
-- Nun
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 4, 3, 'Calligraphy'); -- 61
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 4, 11); -- 62
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 4, 14); -- 63
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 4, 15, 'Storyteller'); -- 64
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 4, 18); -- 65
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 4, 20); -- 66
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 4, 25, 'Theology'); -- 67
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 4, 33); -- 68
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 4, 7); -- 69
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 4, 26, 'Any'); -- 70
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 4, 35); -- 71
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 4, 45, 'Brewer'); -- 72
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 4, 45, 'Herbalist'); -- 73
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 4, 45, 'Vintner'); -- 74
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 4, 24); -- 75
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 4, 25, 'Local'); -- 76
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 4, 25, 'Politics'); -- 77
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 4, 29); -- 78
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 4, 23, 'Any'); -- 79
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 4, 25, 'Any'); -- 80
-- Physician
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 5, 5); -- 81
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 5, 11); -- 82
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 5, 13); -- 83
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 5, 14); -- 84
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 5, 18); -- 85
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 5, 20); -- 86
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 5, 29); -- 87
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 5, 41); -- 88
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 5, 7); -- 89
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 5, 19); -- 90
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 5, 23, 'Guilder'); -- 91
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 5, 25, 'Anatomy'); -- 92
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 5, 25, 'Medicine'); -- 93
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 5, 45, 'Barber'); -- 94
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 5, 10); -- 95
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 5, 21); -- 96
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 5, 24); -- 97
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 5, 35); -- 98
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 5, 25, 'Noble'); -- 99
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 5, 30, 'Dancing'); -- 100
-- Priest
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 6, 4); -- 101
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 6, 11); -- 102
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 6, 14); -- 103
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 6, 22); -- 104
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 6, 25, 'Theology'); -- 105
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 6, 29); -- 106
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 6, 33); -- 107
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 6, 35); -- 108
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 6, 7); -- 109
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 6, 15, 'Storytelling'); -- 110
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 6, 18); -- 111
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 6, 20); -- 112
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 6, 21); -- 113
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 6, 26, 'Basic'); -- 114
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 6, 3, 'Writing'); -- 115
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 6, 15, 'Speeches'); -- 116
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 6, 24); -- 117
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 6, 25, 'Heraldry'); -- 118
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 6, 23, 'Any'); -- 119
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 6, 25, 'Politics'); -- 120
-- Scholar
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 7, 10); -- 121
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 7, 15, 'Storytelling'); -- 122
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 7, 17); -- 123
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 7, 18); -- 124
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 7, 19); -- 125
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 7, 23, 'Classical'); -- 126
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 7, 25, 'Any'); -- 127
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 7, 35); -- 128
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 7, 3, 'Writing'); -- 129
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 7, 22); -- 130
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 7, 23, 'Any'); -- 131
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 7, 25, 'Any'); -- 132
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 7, 29); -- 133
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 7, 45, 'Any'); -- 134
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 7, 15, 'Lecture'); -- 135
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 7, 21); -- 136
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 7, 23, 'Any'); -- 137
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 7, 25, 'Any'); -- 138
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 7, 15, 'Rhetoric'); -- 139
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 7, 25, 'Any'); -- 140
-- Wizard
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 8, 6, 'Any'); -- 141
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 8, 12); -- 142
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 8, 22); -- 143
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 8, 23, 'Magick'); -- 144
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 8, 25, 'Magic'); -- 145
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 8, 26, 'Basic'); -- 146
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 8, 26, 'Polearm'); -- 147
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 8, 29); -- 148
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 8, 7); -- 149
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 8, 11); -- 150
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 8, 18); -- 151
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 8, 21); -- 152
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 8, 23, 'Battle'); -- 153
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 8, 23, 'Any'); -- 154
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 8, 1); -- 155
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 8, 16); -- 156
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 8, 25, 'Warfare'); -- 157
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 8, 36, 'Horse'); -- 158
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 8, 23, 'Any'); -- 159
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 8, 25, 'Any'); -- 160
-- Agitator
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 9, 3, 'Writing'); -- 161
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 9, 5); -- 162
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 9, 7); -- 163
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 9, 10); -- 164
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 9, 18); -- 165
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 9, 19); -- 166
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 9, 25, 'Politics'); -- 167
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 9, 45, 'Printing'); -- 168
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 9, 11); -- 169
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 9, 12); -- 170
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 9, 15, 'Storytelling'); -- 171
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 9, 17); -- 172
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 9, 22); -- 173
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 9, 24); -- 174
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 9, 4); -- 175
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 9, 21); -- 176
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 9, 26, 'Brawling'); -- 177
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 9, 29); -- 178
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 9, 25, 'Heraldry'); -- 179
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 9, 36, 'Horse'); -- 180
-- Artisan
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 10, 4); -- 181
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 10, 11); -- 182
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 10, 10); -- 183
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 10, 12); -- 184
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 10, 14); -- 185
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 10, 16); -- 186
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 10, 42, 'Urban'); -- 187
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 10, 45, 'Any'); -- 188
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 10, 7); -- 189
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 10, 19); -- 190
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 10, 25, 'Local'); -- 191
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 10, 18); -- 192
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 10, 23, 'Guilder'); -- 193
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 10, 29); -- 194
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 10, 22); -- 195
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 10, 24); -- 196
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 10, 35); -- 197
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 10, 39, 'Guilder'); -- 198
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 10, 5); -- 199
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 10, 21); -- 200
-- Beggar
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 11, 4); -- 201
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 11, 7); -- 202
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 11, 10); -- 203
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 11, 11); -- 204
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 11, 12); -- 205
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 11, 14); -- 206
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 11, 22); -- 207
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 11, 42, 'Urban'); -- 208
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 11, 15, 'Acting'); -- 209
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 11, 15, 'Any'); -- 210
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 11, 18); -- 211
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 11, 19); -- 212
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 11, 29); -- 213
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 11, 41); -- 214
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 11, 8); -- 215
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 11, 24); -- 216
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 11, 25, 'Local'); -- 217
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 11, 39, 'Vagabond'); -- 218
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 11, 5); -- 219
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 11, 21); -- 220
-- Investigator
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 12, 7); -- 221
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 12, 9); -- 222
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 12, 11); -- 223
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 12, 18); -- 224
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 12, 22); -- 225
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 12, 29); -- 226
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 12, 42, 'Urban'); -- 227
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 12, 44); -- 228
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 12, 10); -- 229
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 12, 12); -- 230
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 12, 25, 'Law'); -- 231
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 12, 26, 'Brawling'); -- 232
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 12, 31); -- 233
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 12, 41); -- 234
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 12, 5); -- 235
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 12, 16); -- 236
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 12, 24); -- 237
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 12, 25, 'Any'); -- 238
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 12, 21); -- 239
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 12, 25, 'Any'); -- 240
-- Merchant
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 13, 1); -- 241
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 13, 5); -- 242
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 13, 7); -- 243
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 13, 10); -- 244
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 13, 13); -- 245
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 13, 17); -- 246
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 13, 18); -- 247
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 13, 19); -- 248
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 13, 16); -- 249
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 13, 22); -- 250
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 13, 23, 'Any'); -- 251
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 13, 23, 'Guilder'); -- 252
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 13, 25, 'Local'); -- 253
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 13, 29); -- 254
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 13, 11); -- 255
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 13, 23, 'Classical'); -- 256
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 13, 27); -- 257
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 13, 39, 'Guilder'); -- 258
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 13, 25, 'Any'); -- 259
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 13, 21); -- 260
-- Rat Catcher
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 14, 4); -- 261
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 14, 2, 'Dog'); -- 262
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 14, 8); -- 263
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 14, 10); -- 264
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 14, 14); -- 265
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 14, 26, 'Basic'); -- 266
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 14, 34, 'Sling'); -- 267
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 14, 42, 'Underground'); -- 268
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 14, 42, 'Urban'); -- 269
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 14, 1); -- 270
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 14, 18); -- 271
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 14, 19); -- 272
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 14, 25, 'Poison'); -- 273
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 14, 29); -- 274
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 14, 40); -- 275
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 14, 9); -- 276
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 14, 11); -- 277
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 14, 12); -- 278
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 14, 34, 'Crossbow Pistol'); -- 279
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 14, 24); -- 280
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 14, 44); -- 281
-- Townsman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 7); -- 282
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 9); -- 283
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 10); -- 284
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 13); -- 285
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 12); -- 286
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 17); -- 287
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 18); -- 288
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 19); -- 289
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 15, 5); -- 290
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 15, 16); -- 291
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 15, 22); -- 292
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 15, 25, 'Local'); -- 293
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 15, 26, 'Brawling'); -- 294
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 15, 32, 'Any'); -- 295
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 15, 11); -- 296
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 15, 25, 'Law'); -- 297
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 15, 29); -- 298
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 15, 35); -- 299
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 15, 25, 'Politics'); -- 300
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 15, 21); -- 301
-- Watchman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 4); -- 302
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 9); -- 303
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 10); -- 304
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 12); -- 305
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 14); -- 306
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 17); -- 307
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 16, 26, 'Any'); -- 308
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 29); -- 309
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 16, 7); -- 310
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 16, 11); -- 311
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 16, 18); -- 312
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 16, 21); -- 313
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 16, 22); -- 314
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 16, 25, 'Local'); -- 315
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 16, 15, 'Storytelling'); -- 316
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 16, 19); -- 317
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 16, 24); -- 318
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 16, 25, 'Law'); -- 319
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 16, 25, 'Politics'); -- 320
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 16, 36, 'Horse'); -- 321
-- Advisor
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 5); -- 322
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 10); -- 323
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 14); -- 324
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 18); -- 325
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 19); -- 326
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 17, 23, 'Classical'); -- 327
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 17, 25, 'Politics'); -- 328
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 29); -- 329
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 17, 7); -- 330
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 17, 11); -- 331
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 17, 16); -- 332
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 17, 17); -- 333
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 17, 22); -- 334
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 17, 25, 'Local'); -- 335
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 17, 15, 'Storytelling'); -- 336
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 17, 24); -- 337
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 17, 23, 'Any'); -- 338
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 17, 25, 'Any'); -- 339
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 17, 25, 'Heraldry'); -- 340
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 17, 36, 'Horse'); -- 341
-- Artist
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 18, 3, 'Any'); -- 342
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 11); -- 343
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 10); -- 344
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 16); -- 345
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 14); -- 346
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 18); -- 347
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 29); -- 348
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 18, 42, 'Urban'); -- 349
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 18, 9); -- 350
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 18, 17); -- 351
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 18, 19); -- 352
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 18, 22); -- 353
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 18, 23, 'Classical'); -- 354
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 18, 45, 'Art Supplies'); -- 355
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 18, 7); -- 356
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 18, 24); -- 357
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 18, 25, 'Art'); -- 358
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 18, 25, 'Heraldry'); -- 359
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 18, 35); -- 360
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 18, 36, 'Horse'); -- 361
-- Duellist
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 4); -- 362
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 12); -- 363
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 14); -- 364
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 20); -- 365
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 22); -- 366
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 19, 23, 'Classical'); -- 367
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 19, 26, 'Any'); -- 368
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 29); -- 369
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 19, 7); -- 370
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 19, 11); -- 371
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 19, 17); -- 372
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 19, 26, 'Parry'); -- 373
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 19, 34, 'Blackpowder'); -- 374
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 19, 45, 'Gunsmith'); -- 375
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 19, 21); -- 376
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 19, 24); -- 377
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 19, 26, 'Basic'); -- 378
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 19, 30, 'Acrobatics'); -- 379
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 19, 25, 'Law'); -- 380
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 19, 26, 'Any'); -- 381
-- Envoy
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 4); -- 382
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 7); -- 383
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 13); -- 384
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 12); -- 385
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 14); -- 386
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 22); -- 387
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 20, 36, 'Horse'); -- 388
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 37); -- 389
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 20, 3, 'Writing'); -- 390
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 20, 5); -- 391
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 20, 11); -- 392
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 20, 18); -- 393
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 20, 19); -- 394
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 20, 25, 'Politics'); -- 395
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 20, 21); -- 396
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 20, 23, 'Any'); -- 397
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 20, 24); -- 398
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 20, 27); -- 399
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 20, 23, 'Any'); -- 400
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 20, 25, 'Any'); -- 401
-- Noble
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 21, 5); -- 402
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 21, 10); -- 403
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 21, 17); -- 404
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 21, 21); -- 405
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 21, 24); -- 406
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 21, 25, 'Heraldry'); -- 407
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 21, 26, 'Fencing'); -- 408
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 21, 32, 'Any'); -- 409
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 21, 7); -- 410
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 21, 18); -- 411
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 21, 23, 'Classical'); -- 412
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 21, 25, 'Local'); -- 413
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 21, 36, 'Horse'); -- 414
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 21, 26, 'Parry'); -- 415
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 21, 23, 'Any'); -- 416
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 21, 22); -- 417
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 21, 25, 'Politics'); -- 418
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 21, 29); -- 419
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 21, 25, 'Any'); -- 420
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 21, 44); -- 421
-- Servant
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 4); -- 422
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 9); -- 423
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 13); -- 424
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 12); -- 425
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 14); -- 426
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 22); -- 427
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 29); -- 428
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 22, 42, 'Any'); -- 429
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 1); -- 430
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 10); -- 431
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 16); -- 432
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 17); -- 433
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 18); -- 434
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 19); -- 435
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 22, 7); -- 436
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 22, 11); -- 437
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 22, 21); -- 438
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 22, 25, 'Local'); -- 439
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 22, 24); -- 440
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 22, 26, 'Basic'); -- 441
-- Spy
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 5); -- 442
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 7); -- 443
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 11); -- 444
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 17); -- 445
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 18); -- 446
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 19); -- 447
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 29); -- 448
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 23, 42, 'Any'); -- 449
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 23, 9); -- 450
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 23, 15, 'Act'); -- 451
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 23, 22); -- 452
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 23, 26, 'Basic'); -- 453
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 23, 39, 'Any'); -- 454
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 23, 41); -- 455
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 23, 1); -- 456
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 23, 2, 'Pigeon'); -- 457
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 23, 23, 'Any'); -- 458
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 23, 24); -- 459
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 23, 25, 'Any'); -- 460
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 23, 35); -- 461
-- Warden
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 4); -- 462
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 8); -- 463
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 10); -- 464
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 11); -- 465
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 14); -- 466
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 22); -- 467
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 24, 25, 'Local'); -- 468
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 29); -- 469
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 24, 1); -- 470
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 24, 26, 'Basic'); -- 471
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 24, 28); -- 472
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 24, 34, 'Bow'); -- 473
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 24, 36, 'Horse'); -- 474
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 24, 43); -- 475
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 24, 5); -- 476
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 24, 7); -- 477
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 24, 18); -- 478
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 24, 24); -- 479
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 24, 16); -- 480
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 24, 23, 'Any'); -- 481
-- Bailiff
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 11); -- 482
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 12); -- 483
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 14); -- 484
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 18); -- 485
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 19); -- 486
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 21); -- 487
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 25, 26, 'Basic'); -- 488
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 29); -- 489
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 25, 5); -- 490
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 25, 7); -- 491
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 25, 16); -- 492
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 25, 22); -- 493
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 25, 24); -- 494
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 25, 25, 'Local'); -- 495
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 25, 1); -- 496
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 25, 25, 'Heraldry'); -- 497
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 25, 27); -- 498
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 25, 36, 'Horse'); -- 499
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 25, 23, 'Classical'); -- 500
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 25, 25, 'Law'); -- 501
-- Hedge Witch
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 26, 6); -- 502
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 26, 14); -- 503
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 26, 22); -- 504
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 26, 23, 'Magick'); -- 505
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 26, 25, 'Folklore'); -- 506
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 26, 25, 'Herbs'); -- 507
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 26, 28); -- 508
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 26, 29); -- 509
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 26, 11); -- 510
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 26, 18); -- 511
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 26, 20); -- 512
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 26, 25, 'Local'); -- 513
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 26, 45, 'Charms'); -- 514
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 26, 45, 'Herbalist'); -- 515
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 26, 19); -- 516
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 26, 25, 'Genealogy'); -- 517
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 26, 25, 'Magic'); -- 518
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 26, 25, 'Spirits'); -- 519
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 26, 21); -- 520
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 26, 33); -- 521
-- Herbalist
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 8); -- 522
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 9); -- 523
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 14); -- 524
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 27, 25, 'Herbs'); -- 525
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 28); -- 526
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 29); -- 527
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 43); -- 528
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 27, 45, 'Herbalist'); -- 529
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 27, 10); -- 530
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 27, 11); -- 531
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 27, 18); -- 532
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 27, 19); -- 533
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 27, 20); -- 534
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 27, 25, 'Local'); -- 535
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 27, 22); -- 536
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 27, 24); -- 537
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 27, 25, 'Medicine'); -- 538
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 27, 45, 'Poisons'); -- 539
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 27, 13); -- 540
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 27, 27); -- 541
-- Hunter
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 8); -- 542
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 9); -- 543
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 14); -- 544
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 28, 25, 'Beasts'); -- 545
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 28); -- 546
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 29); -- 547
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 28, 34, 'Sling'); -- 548
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 40); -- 549
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 28, 11); -- 550
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 28, 22); -- 551
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 28, 26, 'Basic'); -- 552
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 28, 34, 'Bow'); -- 553
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 28, 39, 'Hunter'); -- 554
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 28, 42, 'Rural'); -- 555
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 28, 27); -- 556
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 28, 36, 'Horse'); -- 557
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 28, 43); -- 558
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 28, 44); -- 559
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 28, 1); -- 560
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 28, 2, 'Any'); -- 561
-- Miner
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 11); -- 562
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 14); -- 563
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 22); -- 564
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 29, 25, 'Local'); -- 565
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 29, 26, 'Two-handed'); -- 566
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 28); -- 567
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 29); -- 568
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 43); -- 569
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 29, 8); -- 570
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 29, 10); -- 571
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 29, 16); -- 572
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 29, 26, 'Basic'); -- 573
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 29, 39, 'Miner'); -- 574
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 29, 45, 'Explosives'); -- 575
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 29, 18); -- 576
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 29, 25, 'Geology'); -- 577
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 29, 42, 'Underground'); -- 578
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 29, 45, 'Engineer'); -- 579
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 29, 7); -- 580
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 29, 24); -- 581
-- Mystic
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 7); -- 582
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 30, 15, 'Fortune Telling'); -- 583
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 12); -- 584
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 18); -- 585
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 19); -- 586
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 22); -- 587
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 29); -- 588
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 41); -- 589
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 30, 5); -- 590
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 30, 11); -- 591
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 30, 15, 'Prophecy'); -- 592
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 30, 16); -- 593
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 30, 21); -- 594
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 30, 25, 'Astrology'); -- 595
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 30, 3, 'Writing'); -- 596
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 30, 8); -- 597
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 30, 15, 'Storytelling'); -- 598
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 30, 23, 'Any'); -- 599
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 30, 25, 'Prophecy'); -- 600
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 30, 6, 'Azyr'); -- 601
-- Scout
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 8); -- 602
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 9); -- 603
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 14); -- 604
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 18); -- 605
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 31, 25, 'Local'); -- 606
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 31, 26, 'Basic'); -- 607
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 28); -- 608
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 29); -- 609
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 31, 4); -- 610
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 31, 27); -- 611
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 31, 34, 'Bow'); -- 612
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 31, 36, 'Horse'); -- 613
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 31, 42, 'Rural'); -- 614
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 31, 44); -- 615
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 31, 1); -- 616
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 31, 19); -- 617
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 31, 39, 'Hunter'); -- 618
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 31, 43); -- 619
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 31, 23, 'Any'); -- 620
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 31, 45, 'Cartographer'); -- 621
-- Villager
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 1); -- 622
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 4); -- 623
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 10); -- 624
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 14); -- 625
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 18); -- 626
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 32, 26, 'Brawling'); -- 627
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 32, 25, 'Local'); -- 628
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 28); -- 629
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 32, 12); -- 630
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 32, 13); -- 631
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 32, 15, 'Storytelling'); -- 632
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 32, 19); -- 633
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 32, 26, 'Basic'); -- 634
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 32, 45, 'Any'); -- 635
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 32, 5); -- 636
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 32, 7); -- 637
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 32, 21); -- 638
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 32, 24); -- 639
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 32, 22); -- 640
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 32, 25, 'History'); -- 641
-- Bounty Hunter
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 5); -- 642
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 7); -- 643
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 18); -- 644
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 19); -- 645
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 22); -- 646
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 33, 26, 'Basic'); -- 647
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 28); -- 648
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 29); -- 649
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 33, 4); -- 650
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 33, 14); -- 651
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 33, 21); -- 652
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 33, 34, 'Crossbow'); -- 653
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 33, 34, 'Entangling'); -- 654
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 33, 44); -- 655
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 33, 1); -- 656
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 33, 9); -- 657
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 33, 36, 'Horse'); -- 658
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 33, 43); -- 659
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 33, 13); -- 660
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 33, 25, 'Law'); -- 661
-- Coachman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 1); -- 662
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 8); -- 663
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 9); -- 664
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 13); -- 665
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 14); -- 666
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 29); -- 667
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 34, 34, 'Entangling'); -- 668
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 34, 36, 'Horse'); -- 669
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 34, 10); -- 670
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 34, 18); -- 671
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 34, 22); -- 672
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 34, 25, 'Local'); -- 673
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 34, 27); -- 674
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 34, 34, 'Blackpowder'); -- 675
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 34, 2, 'Horse'); -- 676
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 34, 21); -- 677
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 34, 23, 'Any'); -- 678
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 34, 25, 'Routes'); -- 679
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 34, 7); -- 680
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 34, 24); -- 681
-- Entertainer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 35, 4); -- 682
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 35, 7); -- 683
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 35, 15, 'Any'); -- 684
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 35, 18); -- 685
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 35, 19); -- 686
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 35, 30, 'Any'); -- 687
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 35, 32, 'Any'); -- 688
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 35, 41); -- 689
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 15, 'Any'); -- 690
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 36, 'Any'); -- 691
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 26, 'Basic'); -- 692
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 30, 'Any'); -- 693
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 32, 'Any'); -- 694
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 34, 'Throwing'); -- 695
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 35, 1); -- 696
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 35, 2, 'Any'); -- 697
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 35, 3, 'Writing'); -- 698
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 35, 23, 'Any'); -- 699
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 35, 13); -- 700
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 35, 24); -- 701
-- Flagellant
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 12); -- 702
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 14); -- 703
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 20); -- 704
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 21); -- 705
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 22); -- 706
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 36, 25, 'Sigmar'); -- 707
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 36, 26, 'Flail'); -- 708
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 28); -- 709
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 36, 3, 'Icons'); -- 710
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 36, 4); -- 711
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 36, 11); -- 712
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 36, 23, 'Classical'); -- 713
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 36, 25, 'The Empire'); -- 714
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 36, 34, 'Sling'); -- 715
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 36, 7); -- 716
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 36, 23, 'Any'); -- 717
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 36, 25, 'Theology'); -- 718
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 36, 29); -- 719
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 36, 15, 'Speeches'); -- 720
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 36, 24); -- 721
-- Messenger
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 4); -- 722
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 9); -- 723
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 12); -- 724
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 14); -- 725
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 18); -- 726
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 27); -- 727
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 29); -- 728
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 37, 26, 'Brawling'); -- 729
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 37, 1); -- 730
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 37, 7); -- 731
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 37, 11); -- 732
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 37, 25, 'Local'); -- 733
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 37, 26, 'Basic'); -- 734
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 37, 36, 'Horse'); -- 735
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 37, 8); -- 736
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 37, 5); -- 737
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 37, 10); -- 738
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 37, 28); -- 739
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 37, 21); -- 740
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 37, 24); -- 741
-- Pedlar
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 7); -- 742
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 14); -- 743
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 38, 15, 'Storytelling'); -- 744
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 18); -- 745
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 19); -- 746
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 22); -- 747
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 28); -- 748
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 38, 42, 'Rural'); -- 749
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 38, 42, 'Urban'); -- 750
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 38, 1); -- 751
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 38, 8); -- 752
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 38, 10); -- 753
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 38, 16); -- 754
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 38, 36, 'Horse'); -- 755
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 38, 45, 'Tinker'); -- 756
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 38, 13); -- 757
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 38, 21); -- 758
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 38, 23, 'Any'); -- 759
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 38, 29); -- 760
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 38, 25, 'Local'); -- 761
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 38, 25, 'Geography'); -- 762
-- Road Warden
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 5); -- 763
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 10); -- 764
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 17); -- 765
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 18); -- 766
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 19); -- 767
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 39, 26, 'Basic'); -- 768
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 29); -- 769
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 39, 34, 'Crossbow'); -- 770
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 39, 1); -- 771
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 39, 14); -- 772
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 39, 21); -- 773
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 39, 22); -- 774
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 39, 28); -- 775
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 39, 36, 'Horse'); -- 776
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 39, 4); -- 777
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 39, 7); -- 778
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 39, 24); -- 779
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 39, 34, 'Blackpowder'); -- 780
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 39, 25, 'Empire'); -- 781
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 39, 27); -- 782
-- Witch Hunter
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 7); -- 783
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 10); -- 784
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 20); -- 785
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 21); -- 786
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 22); -- 787
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 40, 25, 'Torture'); -- 788
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 40, 26, 'Brawling'); -- 789
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 29); -- 790
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 40, 11); -- 791
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 40, 18); -- 792
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 40, 26, 'Basic'); -- 793
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 40, 25, 'Witches'); -- 794
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 40, 34, 'Any'); -- 795
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 40, 36, 'Horse'); -- 796
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 40, 14); -- 797
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 40, 24); -- 798
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 40, 25, 'Law'); -- 799
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 40, 25, 'Local'); -- 800
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 40, 25, 'Chaos'); -- 801
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 40, 25, 'Politics'); -- 802
-- Boatman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 10); -- 803
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 12); -- 804
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 14); -- 805
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 18); -- 806
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 41, 26, 'Brawling'); -- 807
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 37); -- 808
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 38); -- 809
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 43); -- 810
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 41, 4); -- 811
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 41, 15, 'Storytelling'); -- 812
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 41, 19); -- 813
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 41, 22); -- 814
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 41, 25, 'Riverways'); -- 815
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 41, 29); -- 816
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 41, 9); -- 817
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 41, 26, 'Singing'); -- 818
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 41, 20); -- 819
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 41, 45, 'Boatbuilding'); -- 820
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 41, 24); -- 821
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 41, 27); -- 822
-- Huffer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 10); -- 823
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 18); -- 824
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 22); -- 825
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 42, 25, 'Local'); -- 826
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 42, 25, 'Riverways'); -- 827
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 29); -- 828
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 37); -- 829
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 43); -- 830
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 42, 7); -- 831
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 42, 11); -- 832
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 42, 15, 'Storytelling'); -- 833
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 42, 23, 'Any'); -- 834
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 42, 26, 'Basic'); -- 835
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 42, 27); -- 836
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 42, 19); -- 837
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 42, 21); -- 838
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 42, 25, 'Local'); -- 839
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 42, 25, 'Wrecks'); -- 840
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 42, 24); -- 841
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 42, 38); -- 842
-- Riverwarden
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 4); -- 843
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 12); -- 844
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 14); -- 845
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 43, 26, 'Basic'); -- 846
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 29); -- 847
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 37); -- 848
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 38); -- 849
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 43); -- 850
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 43, 5); -- 851
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 43, 7); -- 852
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 43, 21); -- 853
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 43, 18); -- 854
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 43, 25, 'Riverways'); -- 855
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 43, 34, 'Blackpowder'); -- 856
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 43, 9); -- 857
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 43, 11); -- 858
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 43, 22); -- 859
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 43, 24); -- 860
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 43, 25, 'Law'); -- 861
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 43, 27); -- 862
-- Riverwoman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 4); -- 863
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 10); -- 864
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 12); -- 865
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 14); -- 866
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 18); -- 867
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 28); -- 868
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 37); -- 869
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 43); -- 870
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 44, 17); -- 871
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 44, 25, 'Local'); -- 872
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 44, 25, 'Riverways'); -- 873
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 44, 34, 'Entangling'); -- 874
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 44, 34, 'Throwing'); -- 875
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 44, 40); -- 876
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 44, 7); -- 877
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 44, 22); -- 878
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 44, 26, 'Polearm'); -- 879
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 44, 29); -- 880
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 44, 15, 'Storytelling'); -- 881
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 44, 25, 'Folklore'); -- 882
-- Seaman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 9); -- 883
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 10); -- 884
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 17); -- 885
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 18); -- 886
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 37); -- 887
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 45, 26, 'Brawling'); -- 888
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 38); -- 889
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 43); -- 890
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 45, 4); -- 891
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 45, 12); -- 892
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 45, 14); -- 893
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 45, 15, 'Singing'); -- 894
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 45, 23, 'Any'); -- 895
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 45, 26, 'Basic'); -- 896
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 45, 11); -- 897
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 45, 24); -- 898
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 45, 29); -- 899
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 45, 45, 'Carpenter'); -- 900
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 45, 7); -- 901
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 45, 27); -- 902
-- Smuggler
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 4); -- 903
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 5); -- 904
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 11); -- 905
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 10); -- 906
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 37); -- 907
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 38); -- 908
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 46, 42, 'Rural'); -- 909
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 46, 42, 'Urban'); -- 910
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 43); -- 911
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 46, 19); -- 912
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 46, 18); -- 913
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 46, 25, 'Local'); -- 914
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 46, 26, 'Basic'); -- 915
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 46, 29); -- 916
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 46, 39, 'Smuggler'); -- 917
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 46, 16); -- 918
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 46, 21); -- 919
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 46, 22); -- 920
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 46, 25, 'Riverways'); -- 921
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 46, 23, 'Any'); -- 922
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 46, 24); -- 923
-- Stevedore
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 4); -- 924
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 9); -- 925
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 10); -- 926
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 12); -- 927
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 14); -- 928
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 18); -- 929
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 47, 26, 'Basic'); -- 930
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 43); -- 931
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 47, 5); -- 932
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 47, 15, 'Storytelling'); -- 933
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 47, 17); -- 934
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 47, 21); -- 935
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 47, 29); -- 936
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 47, 42, 'Urban'); -- 937
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 47, 11); -- 938
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 47, 16); -- 939
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 47, 22); -- 940
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 47, 24); -- 941
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 47, 7); -- 942
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 47, 25, 'Taxes'); -- 943
-- Wrecker
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 9); -- 944
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 10); -- 945
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 12); -- 946
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 14); -- 947
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 37); -- 948
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 48, 26, 'Basic'); -- 949
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 28); -- 950
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 43); -- 951
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 5); -- 952
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 11); -- 953
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 22); -- 954
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 27); -- 955
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 29); -- 956
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 40); -- 957
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 48, 18); -- 958
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 48, 21); -- 959
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 48, 34, 'Crossbow'); -- 960
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 48, 42, 'Rural'); -- 961
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 48, 24); -- 962
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 48, 25, 'Riverways'); -- 963
-- Bawd
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 5); -- 964
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 7); -- 965
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 10); -- 966
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 49, 15, 'Any'); -- 967
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 17); -- 968
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 18); -- 969
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 19); -- 970
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 21); -- 971
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 49, 12); -- 972
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 49, 14); -- 973
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 49, 22); -- 974
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 49, 25, 'Local'); -- 975
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 49, 26, 'Basic'); -- 976
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 49, 29); -- 977
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 49, 11); -- 978
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 49, 16); -- 979
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 49, 23, 'Any'); -- 980
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 49, 25, 'Law'); -- 981
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 49, 24); -- 982
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 49, 25, 'Heraldry'); -- 983
-- Charlatan
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 5); -- 984
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 10); -- 985
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 7); -- 986
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 50, 15, 'Storytelling'); -- 987
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 17); -- 988
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 18); -- 989
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 19); -- 990
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 41); -- 991
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 50, 11); -- 992
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 50, 12); -- 993
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 50, 15, 'Acting'); -- 994
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 50, 16); -- 995
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 50, 22); -- 996
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 50, 29); -- 997
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 50, 23, 'Thief'); -- 998
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 50, 25, 'Heraldry'); -- 999
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 50, 31); -- 1000
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 50, 39, 'Thief'); -- 1001
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 50, 25, 'Genealogy'); -- 1002
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 50, 35); -- 1003
-- Fence
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 7); -- 1004
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 10); -- 1005
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 12); -- 1006
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 16); -- 1007
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 17); -- 1008
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 18); -- 1009
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 19); -- 1010
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 51, 26, 'Basic'); -- 1011
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 51, 11); -- 1012
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 51, 21); -- 1013
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 51, 22); -- 1014
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 51, 29); -- 1015
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 51, 39, 'Thief'); -- 1016
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 51, 45, 'Engraver'); -- 1017
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 51, 5); -- 1018
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 51, 15, 'Storytelling'); -- 1019
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 51, 25, 'Art'); -- 1020
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 51, 25, 'Local'); -- 1021
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 51, 25, 'Heraldry'); -- 1022
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 51, 35); -- 1023
-- Grave Robber
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 9); -- 1024
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 11); -- 1025
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 12); -- 1026
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 14); -- 1027
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 18); -- 1028
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 22); -- 1029
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 29); -- 1030
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 52, 42, 'Any'); -- 1031
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 52, 5); -- 1032
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 52, 13); -- 1033
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 52, 16); -- 1034
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 52, 19); -- 1035
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 52, 25, 'Medicine'); -- 1036
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 52, 26, 'Basic'); -- 1037
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 52, 25, 'History'); -- 1038
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 52, 31); -- 1039
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 52, 35); -- 1040
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 52, 40); -- 1041
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 52, 27); -- 1042
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 52, 45, 'Engineer'); -- 1043
-- Outlaw
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 4); -- 1044
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 10); -- 1045
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 11); -- 1046
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 14); -- 1047
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 17); -- 1048
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 21); -- 1049
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 53, 26, 'Basic'); -- 1050
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 28); -- 1051
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 53, 12); -- 1052
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 53, 20); -- 1053
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 53, 25, 'Local'); -- 1054
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 53, 29); -- 1055
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 53, 34, 'Bow'); -- 1056
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 53, 42, 'Rural'); -- 1057
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 53, 18); -- 1058
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 53, 22); -- 1059
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 53, 24); -- 1060
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 53, 36, 'Horse'); -- 1061
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 53, 7); -- 1062
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 53, 25, 'Empire'); -- 1063
-- Racketeer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 54, 10); -- 1064
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 54, 11); -- 1065
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 54, 12); -- 1066
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 54, 14); -- 1067
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 54, 21); -- 1068
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 54, 25, 'Local'); -- 1069
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 54, 26, 'Brawling'); -- 1070
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 54, 42, 'Urban'); -- 1071
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 54, 5); -- 1072
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 54, 7); -- 1073
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 54, 16); -- 1074
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 54, 18); -- 1075
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 54, 23, 'Estalian'); -- 1076
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 54, 23, 'Tilean'); -- 1077
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 54, 26, 'Basic'); -- 1078
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 54, 22); -- 1079
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 54, 24); -- 1080
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 54, 29); -- 1081
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 54, 34, 'Crossbow'); -- 1082
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 54, 25, 'Law'); -- 1083
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 54, 25, 'Politics'); -- 1084
-- Thief
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 4); -- 1085
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 9); -- 1086
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 11); -- 1087
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 12); -- 1088
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 14); -- 1089
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 22); -- 1090
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 29); -- 1091
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 55, 42, 'Urban'); -- 1092
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 55, 16); -- 1093
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 55, 18); -- 1094
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 55, 25, 'Local'); -- 1095
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 55, 31); -- 1096
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 55, 39, 'Thief'); -- 1097
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 55, 41); -- 1098
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 55, 5); -- 1099
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 55, 17); -- 1100
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 55, 21); -- 1101
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 55, 34, 'Crossbow'); -- 1102
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 55, 7); -- 1103
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 55, 40); -- 1104
-- Witch
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 6); -- 1105
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 11); -- 1106
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 14); -- 1107
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 18); -- 1108
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 21); -- 1109
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 56, 23, 'Magick'); -- 1110
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 41); -- 1111
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 56, 42, 'Rural'); -- 1112
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 56, 8); -- 1113
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 56, 12); -- 1114
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 56, 22); -- 1115
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 56, 26, 'Polearm'); -- 1116
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 56, 29); -- 1117
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 56, 45, 'Herbalist'); -- 1118
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 56, 5); -- 1119
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 56, 7); -- 1120
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 56, 19); -- 1121
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 56, 25, 'Dark Magic'); -- 1122
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 56, 25, 'Daemonology'); -- 1123
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 56, 25, 'Magic'); -- 1124
-- Cavalryman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 57, 1); -- 1125
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 57, 8); -- 1126
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 57, 14); -- 1127
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 57, 23, 'Battle'); -- 1128
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 57, 26, 'Basic'); -- 1129
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 57, 28); -- 1130
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 57, 29); -- 1131
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 57, 36, 'Horse'); -- 1132
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 57, 7); -- 1133
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 57, 10); -- 1134
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 57, 11); -- 1135
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 57, 18); -- 1136
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 57, 26, 'Cavalry'); -- 1137
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 57, 34, 'Blackpowder'); -- 1138
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 57, 21); -- 1139
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 57, 22); -- 1140
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 57, 24); -- 1141
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 57, 25, 'Warfare'); -- 1142
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 57, 17); -- 1143
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 57, 25, 'Heraldry'); -- 1144
-- Guard
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 10); -- 1145
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 14); -- 1146
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 58, 15, 'Storytelling'); -- 1147
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 17); -- 1148
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 18); -- 1149
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 22); -- 1150
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 58, 26, 'Basic'); -- 1151
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 29); -- 1152
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 58, 4); -- 1153
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 58, 11); -- 1154
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 58, 12); -- 1155
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 58, 21); -- 1156
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 58, 26, 'Polearm'); -- 1157
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 58, 34, 'Bow'); -- 1158
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 58, 20); -- 1159
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 58, 23, 'Battle'); -- 1160
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 58, 25, 'Etiquette'); -- 1161
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 58, 26, 'Two-handed'); -- 1162
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 58, 24); -- 1163
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 58, 25, 'Warfare'); -- 1164
-- Knight
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 59, 4); -- 1165
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 59, 1); -- 1166
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 59, 8); -- 1167
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 59, 20); -- 1168
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 59, 25, 'Heraldry'); -- 1169
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 59, 26, 'Cavalry'); -- 1170
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 59, 36, 'Horse'); -- 1171
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 59, 45, 'Farrier'); -- 1172
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 59, 11); -- 1173
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 59, 12); -- 1174
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 59, 14); -- 1175
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 59, 21); -- 1176
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 59, 23, 'Battle'); -- 1177
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 59, 26, 'Any'); -- 1178
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 59, 7); -- 1179
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 59, 10); -- 1180
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 59, 24); -- 1181
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 59, 25, 'Warfare'); -- 1182
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 59, 25, 'Any'); -- 1183
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 59, 39, 'Knightly Order'); -- 1184
-- Pit Fighter
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 4); -- 1185
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 11); -- 1186
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 12); -- 1187
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 14); -- 1188
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 17); -- 1189
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 21); -- 1190
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 60, 26, 'Any'); -- 1191
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 60, 26, 'Brawling'); -- 1192
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 60, 19); -- 1193
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 60, 22); -- 1194
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 60, 26, 'Basic'); -- 1195
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 60, 26, 'Flail'); -- 1196
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 60, 26, 'Two-handed'); -- 1197
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 60, 29); -- 1198
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 60, 34, 'Entangling'); -- 1199
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 60, 10); -- 1200
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 60, 18); -- 1201
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 60, 25, 'Anatomy'); -- 1202
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 60, 30, 'Fight'); -- 1203
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 60, 7); -- 1204
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 60, 34, 'Any'); -- 1205
-- Protagonist
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 4); -- 1206
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 12); -- 1207
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 14); -- 1208
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 61, 15, 'Taunt'); -- 1209
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 18); -- 1210
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 19); -- 1211
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 21); -- 1212
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 61, 26, 'Any'); -- 1213
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 61, 5); -- 1214
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 61, 7); -- 1215
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 61, 22); -- 1216
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 61, 26, 'Basic'); -- 1217
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 61, 29); -- 1218
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 61, 36, 'Horse'); -- 1219
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 61, 9); -- 1220
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 61, 11); -- 1221
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 61, 27); -- 1222
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 61, 34, 'Thrown'); -- 1223
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 61, 15, 'Acting'); -- 1224
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 61, 34, 'Crossbow'); -- 1225
-- Slayer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 10); -- 1226
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 11); -- 1227
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 12); -- 1228
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 14); -- 1229
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 17); -- 1230
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 20); -- 1231
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 62, 25, 'Trolls'); -- 1232
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 62, 26, 'Basic'); -- 1233
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 62, 16); -- 1234
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 62, 21); -- 1235
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 62, 23, 'Battle'); -- 1236
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 62, 25, 'Giant'); -- 1237
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 62, 26, 'Two-handed'); -- 1238
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 62, 28); -- 1239
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 62, 15, 'Storytelling'); -- 1240
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 62, 25, 'Dragons'); -- 1241
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 62, 29); -- 1242
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 62, 34, 'Thrown'); -- 1243
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 62, 22); -- 1244
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 62, 25, 'Chaos'); -- 1245
-- Soldier
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 63, 4); -- 1246
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 63, 9); -- 1247
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 63, 11); -- 1248
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 63, 12); -- 1249
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 63, 14); -- 1250
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 63, 23, 'Battle'); -- 1251
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 63, 26, 'Basic'); -- 1252
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 63, 32, 'Drum'); -- 1253
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 63, 32, 'Fife'); -- 1254
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 63, 10); -- 1255
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 63, 17); -- 1256
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 63, 18); -- 1257
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 63, 26, 'Any'); -- 1258
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 63, 34, 'Any'); -- 1259
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 63, 28); -- 1260
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 63, 20); -- 1261
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 63, 22); -- 1262
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 63, 24); -- 1263
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 63, 29); -- 1264
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 63, 25, 'Warfare'); -- 1265
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 63, 27); -- 1266
-- Warrior Priest
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 11); -- 1267
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 12); -- 1268
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 14); -- 1269
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 20); -- 1270
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 24); -- 1271
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 64, 25, 'Theology'); -- 1272
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 64, 26, 'Any'); -- 1273
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 33); -- 1274
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 64, 7); -- 1275
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 64, 15, 'Speeches'); -- 1276
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 64, 21); -- 1277
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 64, 23, 'Battle'); -- 1278
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 64, 26, 'Any'); -- 1279
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 64, 34, 'Any'); -- 1280
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 64, 1); -- 1281
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 64, 22); -- 1282
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 64, 29); -- 1283
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 64, 36, 'Horse'); -- 1284
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 64, 10); -- 1285
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 64, 25, 'Warfare'); -- 1286
-- Butcher
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 9); -- 1287
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 10); -- 1288
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 14); -- 1289
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 18); -- 1290
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 21); -- 1291
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 65, 23, 'Magick'); -- 1292
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 65, 26, 'Basic'); -- 1293
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 33); -- 1294
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 65, 45, 'Burcher'); -- 1295
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 65, 28); -- 1296
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 65, 3, 'Butchery'); -- 1297
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 65, 6, 'Lore of the Great Maw'); -- 1298
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 65, 21); -- 1299
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 65, 34, 'Throwing'); -- 1300
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 65, 25, 'The Great Maw'); -- 1301
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 65, 39, 'The Great Maw'); -- 1302
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 65, 15, 'Speeches'); -- 1303
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 65, 20); -- 1304
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 65, 22); -- 1305
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 65, 29); -- 1306
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 65, 25, 'Magick'); -- 1307
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 65, 23, 'Any'); -- 1308
-- Rhinox Herder
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 4); -- 1309
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 5); -- 1310
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 10); -- 1311
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 12); -- 1312
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 14); -- 1313
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 66, 26, 'Basic'); -- 1314
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 29); -- 1315
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 66, 34, 'Entangling'); -- 1316
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 40); -- 1317
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 66, 42, 'Rural'); -- 1318
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 66, 1); -- 1319
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 66, 2, 'Rhinox'); -- 1320
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 66, 8); -- 1321
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 66, 25, 'Rhinox'); -- 1322
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 66, 14); -- 1323
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 66, 34, 'Throwing'); -- 1324
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 66, 11); -- 1325
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 66, 21); -- 1326
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 66, 28); -- 1327
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 66, 36, 'Rhinox'); -- 1328
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 66, 22); -- 1329
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 66, 24); -- 1330
-- Maneater
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 4); -- 1331
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 10); -- 1332
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 11); -- 1333
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 12); -- 1334
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 14); -- 1335
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 17); -- 1336
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 21); -- 1337
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 67, 23, 'Battle'); -- 1338
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 67, 26, 'Basic'); -- 1339
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 28); -- 1340
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 67, 15, 'Bellow'); -- 1341
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 67, 18); -- 1342
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 67, 25, 'Local'); -- 1343
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 67, 26, 'Two-handed'); -- 1344
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 67, 34, 'Blackpowder'); -- 1345
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 67, 26, 'Any'); -- 1346
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 67, 22); -- 1347
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 67, 24); -- 1348
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 67, 34, 'Any'); -- 1349
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 67, 23, 'Any'); -- 1350


-- Trade Skills
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (7); -- 1 -- Apothecary
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (25); -- 2 -- Engineer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (45); -- 3 -- Lawyer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (67); -- 4 -- Nun
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (86); -- 5 -- Physician
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (107); -- 6 -- Priest
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (127); -- 7 -- Scholar
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (144); -- 8 -- Wizard
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (163); -- 9 -- Agitator
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (188); -- 10 -- Artisan
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (202); -- 11 -- Beggar
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (226); -- 12 -- Investigator
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (248); -- 13 -- Merchant
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (266); -- 14 -- Rat Catcher
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (289); -- 15 -- Townsman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (309); -- 16 -- Watchman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (328); -- 17 -- Advisor
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (342); -- 18 -- Artist
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (368); -- 19 -- Duellist
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (383); -- 20 -- Envoy
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (406); -- 21 -- Noble
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (426); -- 22 -- Servant
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (446); -- 23 -- Spy
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (469); -- 24 -- Warden
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (487); -- 25 -- Bailiff
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (504); -- 26 -- Hedge Witch
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (529); -- 27 -- Herbalist
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (546); -- 28 -- Hunter
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (566); -- 29 -- Miner
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (587); -- 30 -- Mystic
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (609); -- 31 -- Scout
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (625); -- 32 -- Villager
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (647); -- 33 -- Bounty Hunter
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (665); -- 34 -- Coachman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (684); -- 35 -- Entertainer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (708); -- 36 -- Flagellant
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (725); -- 37 -- Messenger
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (746); -- 38 -- Pedlar
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (769); -- 39 -- Road Warden
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (786); -- 40 -- Witch Hunter
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (809); -- 41 -- Boatman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (827); -- 42 -- Huffer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (846); -- 43 -- Riverwarden
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (866); -- 44 -- Riverwoman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (889); -- 45 -- Seaman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (909); -- 46 -- Smuggler
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (910); -- 47 -- Smuggler
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (928); -- 48 -- Stevedore
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (949); -- 49 -- Wrecker
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (965); -- 50 -- Bawd
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (986); -- 51 -- Charlatan
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1007); -- 52 -- Fence
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1031); -- 53 -- Grave Robber
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1049); -- 54 -- Outlaw
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1068); -- 55 -- Racketeer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1092); -- 56 -- Thief
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1110); -- 57 -- Witch
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1132); -- 58 -- Cavalryman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1152); -- 59 -- Guard
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1170); -- 60 -- Knight
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1191); -- 61 -- Pit Fighter
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1213); -- 62 -- Protagonist
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1233); -- 63 -- Slayer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1252); -- 64 -- Soldier
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1271); -- 65 -- Warrior Priest
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1295); -- 66 -- Butcher
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1316); -- 67 -- Rhinox Herder
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1339); -- 68 -- Maneater


-- Talents
INSERT INTO Talents (Name) VALUES ('Accurate Shot'); -- 1
INSERT INTO Talents (Name) VALUES ('Acute Sense (Any)'); -- 2
INSERT INTO Talents (Name) VALUES ('Aethyric Attunement'); -- 3
INSERT INTO Talents (Name) VALUES ('Alley Cat'); -- 4
INSERT INTO Talents (Name) VALUES ('Ambidextrous'); -- 5
INSERT INTO Talents (Name) VALUES ('Animal Affinity'); -- 6
INSERT INTO Talents (Name) VALUES ('Arcane Magic (Any)'); -- 7
INSERT INTO Talents (Name) VALUES ('Argumentative'); -- 8
INSERT INTO Talents (Name) VALUES ('Artistic'); -- 9
INSERT INTO Talents (Name) VALUES ('Attractive'); -- 10
INSERT INTO Talents (Name) VALUES ('Battle Rage'); -- 11
INSERT INTO Talents (Name) VALUES ('Beat Blade'); -- 12
INSERT INTO Talents (Name) VALUES ('Beneath Notice'); -- 13
INSERT INTO Talents (Name) VALUES ('Berserk Charge'); -- 14
INSERT INTO Talents (Name) VALUES ('Blather'); -- 15
INSERT INTO Talents (Name) VALUES ('Bless (Any)'); -- 16
INSERT INTO Talents (Name) VALUES ('Bookish'); -- 17
INSERT INTO Talents (Name) VALUES ('Break and Enter'); -- 18
INSERT INTO Talents (Name) VALUES ('Briber'); -- 19
INSERT INTO Talents (Name) VALUES ('Cardsharp'); -- 20
INSERT INTO Talents (Name) VALUES ('Careful Strike'); -- 21
INSERT INTO Talents (Name) VALUES ('Carouser'); -- 22
INSERT INTO Talents (Name) VALUES ('Catfall'); -- 23
INSERT INTO Talents (Name) VALUES ('Cat-tongued'); -- 24
INSERT INTO Talents (Name) VALUES ('Chaos Magic (Lore)'); -- 25
INSERT INTO Talents (Name) VALUES ('Combat Aware'); -- 26
INSERT INTO Talents (Name) VALUES ('Combat Master'); -- 27
INSERT INTO Talents (Name) VALUES ('Combat Reflexes'); -- 28
INSERT INTO Talents (Name) VALUES ('Commanding Presence'); -- 29
INSERT INTO Talents (Name) VALUES ('Concoct'); -- 30
INSERT INTO Talents (Name) VALUES ('Contortionist'); -- 31
INSERT INTO Talents (Name) VALUES ('Coolheaded'); -- 32
INSERT INTO Talents (Name) VALUES ('Crack the Whip'); -- 33
INSERT INTO Talents (Name) VALUES ('Craftsman (Trade)'); -- 34
INSERT INTO Talents (Name) VALUES ('Criminal'); -- 35
INSERT INTO Talents (Name) VALUES ('Deadeye Shot'); -- 36
INSERT INTO Talents (Name) VALUES ('Dealmaker'); -- 37
INSERT INTO Talents (Name) VALUES ('Detect Artefact'); -- 38
INSERT INTO Talents (Name) VALUES ('Diceman'); -- 39
INSERT INTO Talents (Name) VALUES ('Dirty Fighting'); -- 40
INSERT INTO Talents (Name) VALUES ('Disarm'); -- 41
INSERT INTO Talents (Name) VALUES ('Distract'); -- 42
INSERT INTO Talents (Name) VALUES ('Doomed'); -- 43
INSERT INTO Talents (Name) VALUES ('Drilled'); -- 44
INSERT INTO Talents (Name) VALUES ('Dual Wielder'); -- 45
INSERT INTO Talents (Name) VALUES ('Embezzle'); -- 46
INSERT INTO Talents (Name) VALUES ('Enclosed Fighter'); -- 47
INSERT INTO Talents (Name) VALUES ('Etiquette (Social Group)'); -- 48
INSERT INTO Talents (Name) VALUES ('Fast Hands'); -- 49
INSERT INTO Talents (Name) VALUES ('Fast Shot'); -- 50
INSERT INTO Talents (Name) VALUES ('Fearless (Enemy)'); -- 51
INSERT INTO Talents (Name) VALUES ('Feint'); -- 52
INSERT INTO Talents (Name) VALUES ('Field Dressing'); -- 53
INSERT INTO Talents (Name) VALUES ('Fisherman'); -- 54
INSERT INTO Talents (Name) VALUES ('Flagellant'); -- 55
INSERT INTO Talents (Name) VALUES ('Flee!'); -- 56
INSERT INTO Talents (Name) VALUES ('Fleet Footed'); -- 57
INSERT INTO Talents (Name) VALUES ('Frenzy'); -- 58
INSERT INTO Talents (Name) VALUES ('Frightening'); -- 59
INSERT INTO Talents (Name) VALUES ('Furious Assault'); -- 60
INSERT INTO Talents (Name) VALUES ('Gregarious'); -- 61
INSERT INTO Talents (Name) VALUES ('Gunner'); -- 62
INSERT INTO Talents (Name) VALUES ('Hardy'); -- 63
INSERT INTO Talents (Name) VALUES ('Hatred (Group)'); -- 64
INSERT INTO Talents (Name) VALUES ('Holy Hatred'); -- 65
INSERT INTO Talents (Name) VALUES ('Holy Visions'); -- 66
INSERT INTO Talents (Name) VALUES ('Hunter’s Eye'); -- 67
INSERT INTO Talents (Name) VALUES ('Impassioned Zeal'); -- 68
INSERT INTO Talents (Name) VALUES ('Implacable'); -- 69
INSERT INTO Talents (Name) VALUES ('In-fighter'); -- 70
INSERT INTO Talents (Name) VALUES ('Inspiring'); -- 71
INSERT INTO Talents (Name) VALUES ('Instinctive Diction'); -- 72
INSERT INTO Talents (Name) VALUES ('Invoke (Divine Lore)'); -- 73
INSERT INTO Talents (Name) VALUES ('Iron Jaw'); -- 74
INSERT INTO Talents (Name) VALUES ('Iron Will'); -- 75
INSERT INTO Talents (Name) VALUES ('Jump Up'); -- 76
INSERT INTO Talents (Name) VALUES ('Kingpin'); -- 77
INSERT INTO Talents (Name) VALUES ('Lightning Reflexes'); -- 78
INSERT INTO Talents (Name) VALUES ('Linguistics'); -- 79
INSERT INTO Talents (Name) VALUES ('Lip Reading'); -- 80
INSERT INTO Talents (Name) VALUES ('Luck'); -- 81
INSERT INTO Talents (Name) VALUES ('Magical Sense'); -- 82
INSERT INTO Talents (Name) VALUES ('Magic Resistance'); -- 83
INSERT INTO Talents (Name) VALUES ('Magnum Opus'); -- 84
INSERT INTO Talents (Name) VALUES ('Marksman'); -- 85
INSERT INTO Talents (Name) VALUES ('Master of Disguise'); -- 86
INSERT INTO Talents (Name) VALUES ('Master Orator'); -- 87
INSERT INTO Talents (Name) VALUES ('Master Tradesman (Trade)'); -- 88
INSERT INTO Talents (Name) VALUES ('Menacing'); -- 89
INSERT INTO Talents (Name) VALUES ('Mimic'); -- 90
INSERT INTO Talents (Name) VALUES ('Night Vision'); -- 91
INSERT INTO Talents (Name) VALUES ('Nimble Fingered'); -- 92
INSERT INTO Talents (Name) VALUES ('Noble Blood'); -- 93
INSERT INTO Talents (Name) VALUES ('Nose for Trouble'); -- 94
INSERT INTO Talents (Name) VALUES ('Numismatics'); -- 95
INSERT INTO Talents (Name) VALUES ('Old Salt'); -- 96
INSERT INTO Talents (Name) VALUES ('Orientation'); -- 97
INSERT INTO Talents (Name) VALUES ('Panhandle'); -- 98
INSERT INTO Talents (Name) VALUES ('Perfect Pitch'); -- 99
INSERT INTO Talents (Name) VALUES ('Petty Magic'); -- 100
INSERT INTO Talents (Name) VALUES ('Pharmacist'); -- 101
INSERT INTO Talents (Name) VALUES ('Pilot'); -- 102
INSERT INTO Talents (Name) VALUES ('Public Speaker'); -- 103
INSERT INTO Talents (Name) VALUES ('Pure Soul'); -- 104
INSERT INTO Talents (Name) VALUES ('Rapid Reload'); -- 105
INSERT INTO Talents (Name) VALUES ('Reaction Strike'); -- 106
INSERT INTO Talents (Name) VALUES ('Read/Write'); -- 107
INSERT INTO Talents (Name) VALUES ('Relentless'); -- 108
INSERT INTO Talents (Name) VALUES ('Resistance (Threat)'); -- 109
INSERT INTO Talents (Name) VALUES ('Resolute'); -- 110
INSERT INTO Talents (Name) VALUES ('Reversal'); -- 111
INSERT INTO Talents (Name) VALUES ('Riposte'); -- 112
INSERT INTO Talents (Name) VALUES ('River Guide'); -- 113
INSERT INTO Talents (Name) VALUES ('Robust'); -- 114
INSERT INTO Talents (Name) VALUES ('Roughrider'); -- 115
INSERT INTO Talents (Name) VALUES ('Rover'); -- 116
INSERT INTO Talents (Name) VALUES ('Savant (Lore)'); -- 117
INSERT INTO Talents (Name) VALUES ('Savvy'); -- 118
INSERT INTO Talents (Name) VALUES ('Scale Sheer Surface'); -- 119
INSERT INTO Talents (Name) VALUES ('Schemer'); -- 120
INSERT INTO Talents (Name) VALUES ('Sea Legs'); -- 121
INSERT INTO Talents (Name) VALUES ('Seasoned Traveller'); -- 122
INSERT INTO Talents (Name) VALUES ('Second Sight'); -- 123
INSERT INTO Talents (Name) VALUES ('Secret Identity'); -- 124
INSERT INTO Talents (Name) VALUES ('Shadow'); -- 125
INSERT INTO Talents (Name) VALUES ('Sharp'); -- 126
INSERT INTO Talents (Name) VALUES ('Sharpshooter'); -- 127
INSERT INTO Talents (Name) VALUES ('Shieldsman'); -- 128
INSERT INTO Talents (Name) VALUES ('Sixth Sense'); -- 129
INSERT INTO Talents (Name) VALUES ('Slayer'); -- 130
INSERT INTO Talents (Name) VALUES ('Small'); -- 131
INSERT INTO Talents (Name) VALUES ('Sniper'); -- 132
INSERT INTO Talents (Name) VALUES ('Speedreader'); -- 133
INSERT INTO Talents (Name) VALUES ('Sprinter'); -- 134
INSERT INTO Talents (Name) VALUES ('Step Aside'); -- 135
INSERT INTO Talents (Name) VALUES ('Stone Soup'); -- 136
INSERT INTO Talents (Name) VALUES ('Stout-hearted'); -- 137
INSERT INTO Talents (Name) VALUES ('Strider (Terrain)'); -- 138
INSERT INTO Talents (Name) VALUES ('Strike Mighty Blow'); -- 139
INSERT INTO Talents (Name) VALUES ('Strike to Injure'); -- 140
INSERT INTO Talents (Name) VALUES ('Strike to Stun'); -- 141
INSERT INTO Talents (Name) VALUES ('Strong Back'); -- 142
INSERT INTO Talents (Name) VALUES ('Strong Legs'); -- 143
INSERT INTO Talents (Name) VALUES ('Strong-minded'); -- 144
INSERT INTO Talents (Name) VALUES ('Strong Swimmer'); -- 145
INSERT INTO Talents (Name) VALUES ('Sturdy'); -- 146
INSERT INTO Talents (Name) VALUES ('Suave'); -- 147
INSERT INTO Talents (Name) VALUES ('Super Numerate'); -- 148
INSERT INTO Talents (Name) VALUES ('Supportive'); -- 149
INSERT INTO Talents (Name) VALUES ('Sure Shot'); -- 150
INSERT INTO Talents (Name) VALUES ('Surgery'); -- 151
INSERT INTO Talents (Name) VALUES ('Tenacious'); -- 152
INSERT INTO Talents (Name) VALUES ('Tinker'); -- 153
INSERT INTO Talents (Name) VALUES ('Tower of Memories'); -- 154
INSERT INTO Talents (Name) VALUES ('Trapper'); -- 155
INSERT INTO Talents (Name) VALUES ('Trick Riding'); -- 156
INSERT INTO Talents (Name) VALUES ('Tunnel Rat'); -- 157
INSERT INTO Talents (Name) VALUES ('Unshakable'); -- 158
INSERT INTO Talents (Name) VALUES ('Very Resilient'); -- 159
INSERT INTO Talents (Name) VALUES ('Very Strong'); -- 160
INSERT INTO Talents (Name) VALUES ('War Leader'); -- 161
INSERT INTO Talents (Name) VALUES ('War Wizard'); -- 162
INSERT INTO Talents (Name) VALUES ('Warrior Born'); -- 163
INSERT INTO Talents (Name) VALUES ('Waterman'); -- 164
INSERT INTO Talents (Name) VALUES ('Wealthy'); -- 165
INSERT INTO Talents (Name) VALUES ('Well-prepared'); -- 166
INSERT INTO Talents (Name) VALUES ('Witch!'); -- 167


-- Gods
INSERT INTO Gods (Name) VALUES ('Manann'); -- 1
INSERT INTO Gods (Name) VALUES ('Morr'); -- 2
INSERT INTO Gods (Name) VALUES ('Myrmidia'); -- 3
INSERT INTO Gods (Name) VALUES ('Ranald'); -- 4
INSERT INTO Gods (Name) VALUES ('Rhya'); -- 5
INSERT INTO Gods (Name) VALUES ('Shallya'); -- 6
INSERT INTO Gods (Name) VALUES ('Sigmar'); -- 7
INSERT INTO Gods (Name) VALUES ('Taal'); -- 8
INSERT INTO Gods (Name) VALUES ('Ulric'); -- 9
INSERT INTO Gods (Name) VALUES ('Verena'); -- 10
-- New God
INSERT INTO Gods (Name) VALUES ('Stromfels'); -- 11


-- LoreMagic
INSERT INTO LoreMagic (Name) VALUES ('Beasts'); -- 1
INSERT INTO LoreMagic (Name) VALUES ('Death'); -- 2
INSERT INTO LoreMagic (Name) VALUES ('Fire'); -- 3
INSERT INTO LoreMagic (Name) VALUES ('Heavens'); -- 4
INSERT INTO LoreMagic (Name) VALUES ('Metal'); -- 5
INSERT INTO LoreMagic (Name) VALUES ('Life'); -- 6
INSERT INTO LoreMagic (Name) VALUES ('Light'); -- 7
INSERT INTO LoreMagic (Name) VALUES ('Shadow'); -- 8
INSERT INTO LoreMagic (Name) VALUES ('Hedgecraft'); -- 9
INSERT INTO LoreMagic (Name) VALUES ('Witchcraft'); -- 10
INSERT INTO LoreMagic (Name) VALUES ('Necromancy'); -- 11
INSERT INTO LoreMagic (Name) VALUES ('Daemonology'); -- 12


-- Conditions
INSERT INTO Conditions (Name) VALUES ('Ablaze'); -- 1
INSERT INTO Conditions (Name) VALUES ('Bleeding'); -- 2
INSERT INTO Conditions (Name) VALUES ('Blinded'); -- 3
INSERT INTO Conditions (Name) VALUES ('Broken'); -- 4
INSERT INTO Conditions (Name) VALUES ('Deafened'); -- 5
INSERT INTO Conditions (Name) VALUES ('Entangled'); -- 6
INSERT INTO Conditions (Name) VALUES ('Fatigued'); -- 7
INSERT INTO Conditions (Name) VALUES ('Poisoned'); -- 8
INSERT INTO Conditions (Name) VALUES ('Prone'); -- 9
INSERT INTO Conditions (Name) VALUES ('Stunned'); -- 10
INSERT INTO Conditions (Name) VALUES ('Surprised'); -- 11
INSERT INTO Conditions (Name) VALUES ('Unconscious'); -- 12


-- WeaponCategory
INSERT INTO WeaponCategory (Name) VALUES ('Basic', TRUE); -- 1
INSERT INTO WeaponCategory (Name) VALUES ('Cavalry', TRUE); -- 2
INSERT INTO WeaponCategory (Name) VALUES ('Fencing', TRUE); -- 3
INSERT INTO WeaponCategory (Name) VALUES ('Brawling', TRUE); -- 4
INSERT INTO WeaponCategory (Name) VALUES ('Flail', TRUE); -- 5
INSERT INTO WeaponCategory (Name) VALUES ('Parry', TRUE); -- 6
INSERT INTO WeaponCategory (Name) VALUES ('Polearm', TRUE); -- 7
INSERT INTO WeaponCategory (Name) VALUES ('Two-Handed', TRUE); -- 8
-- Ranged
INSERT INTO WeaponCategory (Name) VALUES ('Blackpowder', FALSE); -- 9
INSERT INTO WeaponCategory (Name) VALUES ('Bow', FALSE); -- 10
INSERT INTO WeaponCategory (Name) VALUES ('Crossbow', FALSE); -- 11
INSERT INTO WeaponCategory (Name) VALUES ('Engineering', FALSE); -- 12
INSERT INTO WeaponCategory (Name) VALUES ('Entangling', FALSE); -- 13
INSERT INTO WeaponCategory (Name) VALUES ('Explosives', FALSE); -- 14
INSERT INTO WeaponCategory (Name) VALUES ('Sling', FALSE); -- 15
INSERT INTO WeaponCategory (Name) VALUES ('Throwing', FALSE); -- 16


-- Symptoms
INSERT INTO Symptoms (Name) VALUES ('Blight'); -- 1
INSERT INTO Symptoms (Name) VALUES ('Buboes'); -- 2
INSERT INTO Symptoms (Name) VALUES ('Convulsions'); -- 3
INSERT INTO Symptoms (Name) VALUES ('Coyghs and Sneezes'); -- 4
INSERT INTO Symptoms (Name) VALUES ('Fever'); -- 5
INSERT INTO Symptoms (Name) VALUES ('Flux'); -- 6
INSERT INTO Symptoms (Name) VALUES ('Gangrene'); -- 7
INSERT INTO Symptoms (Name) VALUES ('Lingering'); -- 8
INSERT INTO Symptoms (Name) VALUES ('Malaise'); -- 9
INSERT INTO Symptoms (Name) VALUES ('Nausea'); -- 10
INSERT INTO Symptoms (Name) VALUES ('Pox'); -- 11
INSERT INTO Symptoms (Name) VALUES ('Wounded'); -- 12


-- Diseases
INSERT INTO Diseases (Name, Contraction, Incubation, Duration) VALUES ('The Black Plague', '', '1d10 minutes', '3d10 days') -- 1
INSERT INTO Diseases (Name, Contraction, Incubation, Duration) VALUES ('Blood Rot', '', 'Instant', '1d10 days') -- 2
INSERT INTO Diseases (Name, Contraction, Incubation, Duration) VALUES ('The Bloody Flux', '', '2d10 days', '1d10 days') -- 3
INSERT INTO Diseases (Name, Contraction, Incubation, Duration) VALUES ('Festering Wound', '', '1d10 days', '1d10 days') -- 4
INSERT INTO Diseases (Name, Contraction, Incubation, Duration) VALUES ('Galloping Trots', '', '1d10 hours', '1d10 days') -- 5
INSERT INTO Diseases (Name, Contraction, Incubation, Duration) VALUES ('Itching Pox', '', '1d10 days', '1d10+7 days') -- 6
INSERT INTO Diseases (Name, Contraction, Incubation, Duration) VALUES ('Minor Infection', '', '1d10 days', '1d10 days') -- 7
INSERT INTO Diseases (Name, Contraction, Incubation, Duration) VALUES ("Packer's Pox", '', '1d10 days', '5d10 days') -- 8
INSERT INTO Diseases (Name, Contraction, Incubation, Duration) VALUES ('Ratte Fever', '', '3d10+5 days', '3d10+10 days') -- 9