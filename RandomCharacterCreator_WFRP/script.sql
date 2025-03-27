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


INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 1, 10);
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 1, 20);
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 1, 23, 'Classical');
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 1, 25, 'Chemistry');
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 1, 25, 'Medicine');
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 1, 25, 'Plants');
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 1, 45, 'Apothecary');
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 1, 45, 'Poisoner');
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 1, 7);
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