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
INSERT INTO Career (Name, ClassID) VALUES ('Soldier', 8); -- 62
INSERT INTO Career (Name, ClassID) VALUES ('Slayer', 8); -- 63
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
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (96, 99, 1, 62);
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
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (98, 100, 2, 62);
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
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (97, 100, 3, 64);
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
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (92, 100, 4, 62);
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
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (99, 99, 5, 62);
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
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (98, 98, 6, 62);
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
INSERT INTO SpeciesCareer (InitialPercentage, MaxPercentage, SpeciesID, CareerID) VALUES (97, 100, 7, 62);


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
-- Continuar com as skills de cada carreira


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
-- Continuar com as skills de cada carreira


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