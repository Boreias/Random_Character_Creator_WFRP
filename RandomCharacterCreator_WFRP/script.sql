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
    TalentGroup VARCHAR(255),
    FOREIGN KEY (SpeciesID) REFERENCES Species(ID),
    FOREIGN KEY (TalentID) REFERENCES Talents(ID)
);

CREATE TABLE RandomTalents (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    InitialPercentage INT NOT NULL,
    MaxPercentage INT NOT NULL,
    TalentID INT NOT NULL,
    TalentGroup VARCHAR(255),
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
    TalentGroup VARCHAR(255),
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


INSERT INTO Class (Name) VALUES ('Academics'); -- 1
INSERT INTO Class (Name) VALUES ('Burghers'); -- 2
INSERT INTO Class (Name) VALUES ('Courtiers'); -- 3
INSERT INTO Class (Name) VALUES ('Peasants'); -- 4
INSERT INTO Class (Name) VALUES ('Rangers'); -- 5
INSERT INTO Class (Name) VALUES ('Riverfolk'); -- 6
INSERT INTO Class (Name) VALUES ('Rogues'); -- 7
INSERT INTO Class (Name) VALUES ('Warriors'); -- 8
INSERT INTO Class (Name) VALUES ('Seafarer'); -- 9


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
INSERT INTO Career (Name, ClassID) VALUES ('Butcher', 1); -- 65 -- Archives of the Empire - Volume 2
INSERT INTO Career (Name, ClassID) VALUES ('Rhinox Herder', 4); -- 66 -- Archives of the Empire - Volume 2
INSERT INTO Career (Name, ClassID) VALUES ('Maneater', 8); -- 67 -- Archives of the Empire - Volume 2
INSERT INTO Career (Name, ClassID) VALUES ('Owler', 6); -- 68 -- Salzemund - City of Salt and Silver
INSERT INTO Career (Name, ClassID) VALUES ('Archer', 8); -- 69 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Greatsword', 8); -- 70 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Halberdier', 8); -- 71 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Handgunner', 8); -- 72 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Artillerist', 1); -- 73 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Camp Follower', 5); -- 74 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Cartographer', 1); -- 75 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Freelance Knight', 8); -- 76 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Knight of the Blazing Sun', 8); -- 77 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Knight of the White Wolf', 8); -- 78 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Knight Panther', 8); -- 79 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Light Cavalry', 8); -- 80 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Siege Specialist', 8); -- 81 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Pikeman', 8); -- 82 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Warrior Priest of Myrmidia', 8); -- 83 -- Up in Arms
INSERT INTO Career (Name, ClassID) VALUES ('Wolf Kin', 5); -- 84 -- Middenheim - City of the White Wolf
INSERT INTO Career (Name, ClassID) VALUES ('Beachcomber', 9); -- 85 -- Sea of Claws
INSERT INTO Career (Name, ClassID) VALUES ('Chantyman', 9); -- 86 -- Sea of Claws
INSERT INTO Career (Name, ClassID) VALUES ('Huffer', 9); -- 87 -- Sea of Claws
INSERT INTO Career (Name, ClassID) VALUES ('Officer', 9); -- 88 -- Sea of Claws
INSERT INTO Career (Name, ClassID) VALUES ('Sailor', 9); -- 89 -- Sea of Claws
INSERT INTO Career (Name, ClassID) VALUES ('Sailor-Priest of Manann', 9); -- 90 -- Sea of Claws
INSERT INTO Career (Name, ClassID) VALUES ('Ship’s Gunner', 9); -- 91 -- Sea of Claws
INSERT INTO Career (Name, ClassID) VALUES ('Wrecker', 9); -- 92 -- Sea of Claws
INSERT INTO Career (Name, ClassID) VALUES ('Priest of Stromfels', 9); -- 93 -- Sea of Claws
INSERT INTO Career (Name, ClassID) VALUES ('Beadle', 8); -- 94 -- Winds of Magic
INSERT INTO Career (Name, ClassID) VALUES ('Mundane Alchemist', 1); -- 95 -- Winds of Magic
INSERT INTO Career (Name, ClassID) VALUES ('Magister Vigilant', 1); -- 96 -- Winds of Magic
INSERT INTO Career (Name, ClassID) VALUES ('Scryer', 4); -- 97 -- Winds of Magic
INSERT INTO Career (Name, ClassID) VALUES ('Hierophant', 1); -- 98 -- Winds of Magic
INSERT INTO Career (Name, ClassID) VALUES ('Alchemist', 1); -- 99 -- Winds of Magic
INSERT INTO Career (Name, ClassID) VALUES ('Druid', 1); -- 100 -- Winds of Magic
INSERT INTO Career (Name, ClassID) VALUES ('Astromancer', 1); -- 101 -- Winds of Magic
INSERT INTO Career (Name, ClassID) VALUES ('Shadowmancer', 1); -- 102 -- Winds of Magic
INSERT INTO Career (Name, ClassID) VALUES ('Spiriter', 1); -- 103 -- Winds of Magic
INSERT INTO Career (Name, ClassID) VALUES ('Pyromancer', 1); -- 104 -- Winds of Magic
INSERT INTO Career (Name, ClassID) VALUES ('Shaman', 1); -- 105 -- Winds of Magic


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
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 14, 42, 'Underground OR Urban'); -- 268
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 14, 1); -- 269
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 14, 18); -- 270
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 14, 19); -- 271
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 14, 25, 'Poison'); -- 272
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 14, 29); -- 273
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 14, 40); -- 274
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 14, 9); -- 275
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 14, 11); -- 276
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 14, 12); -- 277
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 14, 34, 'Crossbow Pistol'); -- 278
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 14, 24); -- 279
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 14, 44); -- 280
-- Townsman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 7); -- 281
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 9); -- 282
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 10); -- 283
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 13); -- 284
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 12); -- 285
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 17); -- 286
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 18); -- 287
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 15, 19); -- 288
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 15, 5); -- 289
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 15, 16); -- 290
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 15, 22); -- 291
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 15, 25, 'Local'); -- 292
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 15, 26, 'Brawling'); -- 293
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 15, 32, 'Any'); -- 294
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 15, 11); -- 295
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 15, 25, 'Law'); -- 296
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 15, 29); -- 297
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 15, 35); -- 298
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 15, 25, 'Politics'); -- 299
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 15, 21); -- 300
-- Watchman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 4); -- 301
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 9); -- 302
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 10); -- 303
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 12); -- 304
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 14); -- 305
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 17); -- 306
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 16, 26, 'Any'); -- 307
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 16, 29); -- 308
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 16, 7); -- 309
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 16, 11); -- 310
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 16, 18); -- 311
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 16, 21); -- 312
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 16, 22); -- 313
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 16, 25, 'Local'); -- 314
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 16, 15, 'Storytelling'); -- 315
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 16, 19); -- 316
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 16, 24); -- 317
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 16, 25, 'Law'); -- 318
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 16, 25, 'Politics'); -- 319
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 16, 36, 'Horse'); -- 320
-- Advisor
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 5); -- 321
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 10); -- 322
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 14); -- 323
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 18); -- 324
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 19); -- 325
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 17, 23, 'Classical'); -- 326
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 17, 25, 'Politics'); -- 327
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 17, 29); -- 328
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 17, 7); -- 329
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 17, 11); -- 330
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 17, 16); -- 331
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 17, 17); -- 332
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 17, 22); -- 333
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 17, 25, 'Local'); -- 334
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 17, 15, 'Storytelling'); -- 335
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 17, 24); -- 336
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 17, 23, 'Any'); -- 337
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 17, 25, 'Any'); -- 338
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 17, 25, 'Heraldry'); -- 339
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 17, 36, 'Horse'); -- 340
-- Artist
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 18, 3, 'Any'); -- 341
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 11); -- 342
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 10); -- 343
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 16); -- 344
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 14); -- 345
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 18); -- 346
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 18, 29); -- 347
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 18, 42, 'Urban'); -- 348
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 18, 9); -- 349
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 18, 17); -- 350
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 18, 19); -- 351
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 18, 22); -- 352
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 18, 23, 'Classical'); -- 353
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 18, 45, 'Art Supplies'); -- 354
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 18, 7); -- 355
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 18, 24); -- 356
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 18, 25, 'Art'); -- 357
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 18, 25, 'Heraldry'); -- 358
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 18, 35); -- 359
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 18, 36, 'Horse'); -- 360
-- Duellist
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 4); -- 361
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 12); -- 362
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 14); -- 363
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 20); -- 364
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 22); -- 365
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 19, 23, 'Classical'); -- 366
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 19, 26, 'Any'); -- 367
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 19, 29); -- 368
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 19, 7); -- 369
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 19, 11); -- 370
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 19, 17); -- 371
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 19, 26, 'Parry'); -- 372
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 19, 34, 'Blackpowder'); -- 373
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 19, 45, 'Gunsmith'); -- 374
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 19, 21); -- 375
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 19, 24); -- 376
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 19, 26, 'Basic'); -- 377
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 19, 30, 'Acrobatics'); -- 378
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 19, 25, 'Law'); -- 379
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 19, 26, 'Any'); -- 380
-- Envoy
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 4); -- 381
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 7); -- 382
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 13); -- 383
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 12); -- 384
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 14); -- 385
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 22); -- 386
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 20, 36, 'Horse'); -- 387
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 20, 37); -- 388
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 20, 3, 'Writing'); -- 389
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 20, 5); -- 390
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 20, 11); -- 391
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 20, 18); -- 392
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 20, 19); -- 393
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 20, 25, 'Politics'); -- 394
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 20, 21); -- 395
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 20, 23, 'Any'); -- 396
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 20, 24); -- 397
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 20, 27); -- 398
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 20, 23, 'Any'); -- 399
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 20, 25, 'Any'); -- 400
-- Noble
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 21, 5); -- 401
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 21, 10); -- 402
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 21, 17); -- 403
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 21, 21); -- 404
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 21, 24); -- 405
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 21, 25, 'Heraldry'); -- 406
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 21, 26, 'Fencing'); -- 407
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 21, 32, 'Any'); -- 408
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 21, 7); -- 409
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 21, 18); -- 410
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 21, 23, 'Classical'); -- 411
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 21, 25, 'Local'); -- 412
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 21, 36, 'Horse'); -- 413
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 21, 26, 'Parry'); -- 414
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 21, 23, 'Any'); -- 415
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 21, 22); -- 416
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 21, 25, 'Politics'); -- 417
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 21, 29); -- 418
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 21, 25, 'Any'); -- 419
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 21, 44); -- 420
-- Servant
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 4); -- 421
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 9); -- 422
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 13); -- 423
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 12); -- 424
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 14); -- 425
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 22); -- 426
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 22, 29); -- 427
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 22, 42, 'Any'); -- 428
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 1); -- 429
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 10); -- 430
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 16); -- 431
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 17); -- 432
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 18); -- 433
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 22, 19); -- 434
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 22, 7); -- 435
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 22, 11); -- 436
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 22, 21); -- 437
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 22, 25, 'Local'); -- 438
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 22, 24); -- 439
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 22, 26, 'Basic'); -- 440
-- Spy
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 5); -- 441
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 7); -- 442
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 11); -- 443
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 17); -- 444
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 18); -- 445
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 19); -- 446
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 23, 29); -- 447
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 23, 42, 'Any'); -- 448
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 23, 9); -- 449
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 23, 15, 'Act'); -- 450
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 23, 22); -- 451
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 23, 26, 'Basic'); -- 452
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 23, 39, 'Any'); -- 453
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 23, 41); -- 454
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 23, 1); -- 455
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 23, 2, 'Pigeon'); -- 456
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 23, 23, 'Any'); -- 457
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 23, 24); -- 458
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 23, 25, 'Any'); -- 459
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 23, 35); -- 460
-- Warden
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 4); -- 461
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 8); -- 462
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 10); -- 463
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 11); -- 464
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 14); -- 465
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 22); -- 466
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 24, 25, 'Local'); -- 467
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 24, 29); -- 468
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 24, 1); -- 469
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 24, 26, 'Basic'); -- 470
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 24, 28); -- 471
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 24, 34, 'Bow'); -- 472
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 24, 36, 'Horse'); -- 473
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 24, 43); -- 474
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 24, 5); -- 475
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 24, 7); -- 476
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 24, 18); -- 477
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 24, 24); -- 478
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 24, 16); -- 479
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 24, 23, 'Any'); -- 480
-- Bailiff
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 11); -- 481
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 12); -- 482
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 14); -- 483
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 18); -- 484
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 19); -- 485
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 21); -- 486
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 25, 26, 'Basic'); -- 487
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 25, 29); -- 488
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 25, 5); -- 489
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 25, 7); -- 490
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 25, 16); -- 491
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 25, 22); -- 492
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 25, 24); -- 493
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 25, 25, 'Local'); -- 494
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 25, 1); -- 495
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 25, 25, 'Heraldry'); -- 496
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 25, 27); -- 497
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 25, 36, 'Horse'); -- 498
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 25, 23, 'Classical'); -- 499
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 25, 25, 'Law'); -- 500
-- Hedge Witch
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 26, 6); -- 501
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 26, 14); -- 502
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 26, 22); -- 503
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 26, 23, 'Magick'); -- 504
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 26, 25, 'Folklore'); -- 505
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 26, 25, 'Herbs'); -- 506
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 26, 28); -- 507
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 26, 29); -- 508
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 26, 11); -- 509
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 26, 18); -- 510
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 26, 20); -- 511
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 26, 25, 'Local'); -- 512
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 26, 45, 'Charms'); -- 513
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 26, 45, 'Herbalist'); -- 514
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 26, 19); -- 515
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 26, 25, 'Genealogy'); -- 516
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 26, 25, 'Magic'); -- 517
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 26, 25, 'Spirits'); -- 518
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 26, 21); -- 519
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 26, 33); -- 520
-- Herbalist
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 8); -- 521
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 9); -- 522
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 14); -- 523
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 27, 25, 'Herbs'); -- 524
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 28); -- 525
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 29); -- 526
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 27, 43); -- 527
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 27, 45, 'Herbalist'); -- 528
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 27, 10); -- 529
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 27, 11); -- 530
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 27, 18); -- 531
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 27, 19); -- 532
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 27, 20); -- 533
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 27, 25, 'Local'); -- 534
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 27, 22); -- 535
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 27, 24); -- 536
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 27, 25, 'Medicine'); -- 537
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 27, 45, 'Poisons'); -- 538
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 27, 13); -- 539
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 27, 27); -- 540
-- Hunter
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 8); -- 541
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 9); -- 542
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 14); -- 543
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 28, 25, 'Beasts'); -- 544
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 28); -- 545
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 29); -- 546
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 28, 34, 'Sling'); -- 547
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 28, 40); -- 548
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 28, 11); -- 549
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 28, 22); -- 550
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 28, 26, 'Basic'); -- 551
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 28, 34, 'Bow'); -- 552
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 28, 39, 'Hunter'); -- 553
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 28, 42, 'Rural'); -- 554
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 28, 27); -- 555
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 28, 36, 'Horse'); -- 556
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 28, 43); -- 557
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 28, 44); -- 558
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 28, 1); -- 559
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 28, 2, 'Any'); -- 560
-- Miner
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 11); -- 561
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 14); -- 562
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 22); -- 563
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 29, 25, 'Local'); -- 564
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 29, 26, 'Two-handed'); -- 565
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 28); -- 566
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 29); -- 567
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 29, 43); -- 568
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 29, 8); -- 569
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 29, 10); -- 570
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 29, 16); -- 571
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 29, 26, 'Basic'); -- 572
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 29, 39, 'Miner'); -- 573
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 29, 45, 'Explosives'); -- 574
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 29, 18); -- 575
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 29, 25, 'Geology'); -- 576
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 29, 42, 'Underground'); -- 577
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 29, 45, 'Engineer'); -- 578
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 29, 7); -- 579
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 29, 24); -- 580
-- Mystic
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 7); -- 581
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 30, 15, 'Fortune Telling'); -- 582
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 12); -- 583
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 18); -- 584
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 19); -- 585
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 22); -- 586
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 29); -- 587
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 30, 41); -- 588
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 30, 5); -- 589
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 30, 11); -- 590
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 30, 15, 'Prophecy'); -- 591
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 30, 16); -- 592
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 30, 21); -- 593
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 30, 25, 'Astrology'); -- 594
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 30, 3, 'Writing'); -- 595
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 30, 8); -- 596
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 30, 15, 'Storytelling'); -- 597
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 30, 23, 'Any'); -- 598
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 30, 25, 'Prophecy'); -- 599
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 30, 6, 'Azyr'); -- 600
-- Scout
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 8); -- 601
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 9); -- 602
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 14); -- 603
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 18); -- 604
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 31, 25, 'Local'); -- 605
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 31, 26, 'Basic'); -- 606
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 28); -- 607
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 31, 29); -- 608
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 31, 4); -- 609
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 31, 27); -- 610
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 31, 34, 'Bow'); -- 611
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 31, 36, 'Horse'); -- 612
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 31, 42, 'Rural'); -- 613
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 31, 44); -- 614
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 31, 1); -- 615
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 31, 19); -- 616
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 31, 39, 'Hunter'); -- 617
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 31, 43); -- 618
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 31, 23, 'Any'); -- 619
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 31, 45, 'Cartographer'); -- 620
-- Villager
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 1); -- 621
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 4); -- 622
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 10); -- 623
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 14); -- 624
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 18); -- 625
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 32, 26, 'Brawling'); -- 626
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 32, 25, 'Local'); -- 627
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 32, 28); -- 628
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 32, 12); -- 629
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 32, 13); -- 630
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 32, 15, 'Storytelling'); -- 631
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 32, 19); -- 632
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 32, 26, 'Basic'); -- 633
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 32, 45, 'Any'); -- 634
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 32, 5); -- 635
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 32, 7); -- 636
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 32, 21); -- 637
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 32, 24); -- 638
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 32, 22); -- 639
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 32, 25, 'History'); -- 640
-- Bounty Hunter
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 5); -- 641
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 7); -- 642
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 18); -- 643
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 19); -- 644
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 22); -- 645
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 33, 26, 'Basic'); -- 646
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 28); -- 647
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 33, 29); -- 648
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 33, 4); -- 649
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 33, 14); -- 650
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 33, 21); -- 651
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 33, 34, 'Crossbow'); -- 652
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 33, 34, 'Entangling'); -- 653
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 33, 44); -- 654
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 33, 1); -- 655
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 33, 9); -- 656
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 33, 36, 'Horse'); -- 657
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 33, 43); -- 658
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 33, 13); -- 659
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 33, 25, 'Law'); -- 660
-- Coachman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 1); -- 661
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 8); -- 662
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 9); -- 663
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 13); -- 664
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 14); -- 665
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 34, 29); -- 666
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 34, 34, 'Entangling'); -- 667
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 34, 36, 'Horse'); -- 668
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 34, 10); -- 669
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 34, 18); -- 670
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 34, 22); -- 671
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 34, 25, 'Local'); -- 672
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 34, 27); -- 673
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 34, 34, 'Blackpowder'); -- 674
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 34, 2, 'Horse'); -- 675
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 34, 21); -- 676
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 34, 23, 'Any'); -- 677
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 34, 25, 'Routes'); -- 678
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 34, 7); -- 679
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 34, 24); -- 680
-- Entertainer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 35, 4); -- 681
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 35, 7); -- 682
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 35, 15, 'Any'); -- 683
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 35, 18); -- 684
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 35, 19); -- 685
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 35, 30, 'Any'); -- 686
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 35, 32, 'Any'); -- 687
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 35, 41); -- 688
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 15, 'Any'); -- 689
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 36, 'Any'); -- 690
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 26, 'Basic'); -- 691
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 30, 'Any'); -- 692
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 32, 'Any'); -- 693
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 35, 34, 'Throwing'); -- 694
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 35, 1); -- 695
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 35, 2, 'Any'); -- 696
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 35, 3, 'Writing'); -- 697
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 35, 23, 'Any'); -- 698
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 35, 13); -- 699
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 35, 24); -- 700
-- Flagellant
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 12); -- 701
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 14); -- 702
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 20); -- 703
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 21); -- 704
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 22); -- 705
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 36, 25, 'Sigmar'); -- 706
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 36, 26, 'Flail'); -- 707
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 36, 28); -- 708
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 36, 3, 'Icons'); -- 709
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 36, 4); -- 710
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 36, 11); -- 711
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 36, 23, 'Classical'); -- 712
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 36, 25, 'The Empire'); -- 713
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 36, 34, 'Sling'); -- 714
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 36, 7); -- 715
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 36, 23, 'Any'); -- 716
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 36, 25, 'Theology'); -- 717
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 36, 29); -- 718
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 36, 15, 'Speeches'); -- 719
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 36, 24); -- 720
-- Messenger
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 4); -- 721
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 9); -- 722
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 12); -- 723
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 14); -- 724
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 18); -- 725
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 27); -- 726
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 37, 29); -- 727
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 37, 26, 'Brawling'); -- 728
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 37, 1); -- 729
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 37, 7); -- 730
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 37, 11); -- 731
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 37, 25, 'Local'); -- 732
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 37, 26, 'Basic'); -- 733
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 37, 36, 'Horse'); -- 734
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 37, 8); -- 735
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 37, 5); -- 736
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 37, 10); -- 737
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 37, 28); -- 738
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 37, 21); -- 739
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 37, 24); -- 740
-- Pedlar
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 7); -- 741
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 14); -- 742
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 38, 15, 'Storytelling'); -- 743
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 18); -- 744
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 19); -- 745
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 22); -- 746
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 38, 28); -- 747
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 38, 42, 'Rural OR Urban'); -- 748
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 38, 1); -- 749
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 38, 8); -- 750
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 38, 10); -- 751
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 38, 16); -- 752
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 38, 36, 'Horse'); -- 753
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 38, 45, 'Tinker'); -- 754
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 38, 13); -- 755
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 38, 21); -- 756
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 38, 23, 'Any'); -- 757
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 38, 29); -- 758
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 38, 25, 'Local'); -- 759
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 38, 25, 'Geography'); -- 760
-- Road Warden
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 5); -- 761
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 10); -- 762
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 17); -- 763
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 18); -- 764
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 19); -- 765
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 39, 26, 'Basic'); -- 766
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 39, 29); -- 767
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 39, 34, 'Crossbow'); -- 768
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 39, 1); -- 769
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 39, 14); -- 770
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 39, 21); -- 771
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 39, 22); -- 772
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 39, 28); -- 773
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 39, 36, 'Horse'); -- 774
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 39, 4); -- 775
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 39, 7); -- 776
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 39, 24); -- 777
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 39, 34, 'Blackpowder'); -- 778
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 39, 25, 'Empire'); -- 779
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 39, 27); -- 780
-- Witch Hunter
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 7); -- 781
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 10); -- 782
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 20); -- 783
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 21); -- 784
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 22); -- 785
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 40, 25, 'Torture'); -- 786
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 40, 26, 'Brawling'); -- 787
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 40, 29); -- 788
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 40, 11); -- 789
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 40, 18); -- 790
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 40, 26, 'Basic'); -- 791
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 40, 25, 'Witches'); -- 792
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 40, 34, 'Any'); -- 793
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 40, 36, 'Horse'); -- 794
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 40, 14); -- 795
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 40, 24); -- 796
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 40, 25, 'Law'); -- 797
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 40, 25, 'Local'); -- 798
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 40, 25, 'Chaos'); -- 799
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 40, 25, 'Politics'); -- 800
-- Boatman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 10); -- 801
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 12); -- 802
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 14); -- 803
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 18); -- 804
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 41, 26, 'Brawling'); -- 805
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 37); -- 806
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 38); -- 807
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 41, 43); -- 808
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 41, 4); -- 809
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 41, 15, 'Storytelling'); -- 810
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 41, 19); -- 811
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 41, 22); -- 812
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 41, 25, 'Riverways'); -- 813
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 41, 29); -- 814
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 41, 9); -- 815
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 41, 26, 'Singing'); -- 816
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 41, 20); -- 817
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 41, 45, 'Boatbuilding'); -- 818
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 41, 24); -- 819
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 41, 27); -- 820
-- Huffer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 10); -- 821
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 18); -- 822
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 22); -- 823
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 42, 25, 'Local'); -- 824
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 42, 25, 'Riverways'); -- 825
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 29); -- 826
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 37); -- 827
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 42, 43); -- 828
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 42, 7); -- 829
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 42, 11); -- 830
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 42, 15, 'Storytelling'); -- 831
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 42, 23, 'Any'); -- 832
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 42, 26, 'Basic'); -- 833
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 42, 27); -- 834
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 42, 19); -- 835
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 42, 21); -- 836
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 42, 25, 'Local'); -- 837
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 42, 25, 'Wrecks'); -- 838
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 42, 24); -- 839
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 42, 38); -- 840
-- Riverwarden
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 4); -- 841
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 12); -- 842
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 14); -- 843
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 43, 26, 'Basic'); -- 844
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 29); -- 845
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 37); -- 846
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 38); -- 847
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 43, 43); -- 848
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 43, 5); -- 849
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 43, 7); -- 850
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 43, 21); -- 851
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 43, 18); -- 852
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 43, 25, 'Riverways'); -- 853
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 43, 34, 'Blackpowder'); -- 854
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 43, 9); -- 855
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 43, 11); -- 856
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 43, 22); -- 857
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 43, 24); -- 858
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 43, 25, 'Law'); -- 859
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 43, 27); -- 860
-- Riverwoman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 4); -- 861
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 10); -- 862
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 12); -- 863
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 14); -- 864
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 18); -- 865
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 28); -- 866
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 37); -- 867
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 44, 43); -- 868
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 44, 17); -- 869
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 44, 25, 'Local'); -- 870
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 44, 25, 'Riverways'); -- 871
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 44, 34, 'Entangling'); -- 872
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 44, 34, 'Throwing'); -- 873
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 44, 40); -- 874
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 44, 7); -- 875
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 44, 22); -- 876
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 44, 26, 'Polearm'); -- 877
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 44, 29); -- 878
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 44, 15, 'Storytelling'); -- 879
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 44, 25, 'Folklore'); -- 880
-- Seaman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 9); -- 881
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 10); -- 882
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 17); -- 883
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 18); -- 884
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 37); -- 885
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 45, 26, 'Brawling'); -- 886
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 38); -- 887
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 45, 43); -- 888
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 45, 4); -- 889
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 45, 12); -- 890
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 45, 14); -- 891
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 45, 15, 'Singing'); -- 892
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 45, 23, 'Any'); -- 893
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 45, 26, 'Basic'); -- 894
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 45, 11); -- 895
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 45, 24); -- 896
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 45, 29); -- 897
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 45, 45, 'Carpenter'); -- 898
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 45, 7); -- 899
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 45, 27); -- 900
-- Smuggler
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 4); -- 901
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 5); -- 902
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 11); -- 903
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 10); -- 904
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 37); -- 905
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 38); -- 906
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 46, 42, 'Rural OR Urban'); -- 907
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 46, 43); -- 908
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 46, 19); -- 909
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 46, 18); -- 910
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 46, 25, 'Local'); -- 911
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 46, 26, 'Basic'); -- 912
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 46, 29); -- 913
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 46, 39, 'Smuggler'); -- 914
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 46, 16); -- 915
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 46, 21); -- 916
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 46, 22); -- 917
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 46, 25, 'Riverways'); -- 918
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 46, 23, 'Any'); -- 919
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 46, 24); -- 920
-- Stevedore
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 4); -- 921
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 9); -- 922
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 10); -- 923
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 12); -- 924
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 14); -- 925
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 18); -- 926
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 47, 26, 'Basic'); -- 927
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 47, 43); -- 928
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 47, 5); -- 929
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 47, 15, 'Storytelling'); -- 930
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 47, 17); -- 931
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 47, 21); -- 932
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 47, 29); -- 933
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 47, 42, 'Urban'); -- 934
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 47, 11); -- 935
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 47, 16); -- 936
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 47, 22); -- 937
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 47, 24); -- 938
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 47, 7); -- 939
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 47, 25, 'Taxes'); -- 940
-- Wrecker
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 9); -- 941
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 10); -- 942
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 12); -- 943
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 14); -- 944
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 37); -- 945
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 48, 26, 'Basic'); -- 946
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 28); -- 947
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 48, 43); -- 948
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 5); -- 949
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 11); -- 950
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 22); -- 951
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 27); -- 952
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 29); -- 953
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 48, 40); -- 954
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 48, 18); -- 955
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 48, 21); -- 956
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 48, 34, 'Crossbow'); -- 957
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 48, 42, 'Rural'); -- 958
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 48, 24); -- 959
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 48, 25, 'Riverways'); -- 960
-- Bawd
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 5); -- 961
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 7); -- 962
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 10); -- 963
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 49, 15, 'Any'); -- 964
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 17); -- 965
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 18); -- 966
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 19); -- 967
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 49, 21); -- 968
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 49, 12); -- 969
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 49, 14); -- 970
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 49, 22); -- 971
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 49, 25, 'Local'); -- 972
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 49, 26, 'Basic'); -- 973
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 49, 29); -- 974
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 49, 11); -- 975
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 49, 16); -- 976
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 49, 23, 'Any'); -- 977
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 49, 25, 'Law'); -- 978
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 49, 24); -- 979
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 49, 25, 'Heraldry'); -- 980
-- Charlatan
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 5); -- 981
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 10); -- 982
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 7); -- 983
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 50, 15, 'Storytelling'); -- 984
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 17); -- 985
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 18); -- 986
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 19); -- 987
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 50, 41); -- 988
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 50, 11); -- 989
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 50, 12); -- 990
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 50, 15, 'Acting'); -- 991
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 50, 16); -- 992
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 50, 22); -- 993
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 50, 29); -- 994
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 50, 23, 'Thief'); -- 995
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 50, 25, 'Heraldry'); -- 996
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 50, 31); -- 997
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 50, 39, 'Thief'); -- 998
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 50, 25, 'Genealogy'); -- 999
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 50, 35); -- 1000
-- Fence
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 7); -- 1001
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 10); -- 1002
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 12); -- 1003
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 16); -- 1004
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 17); -- 1005
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 18); -- 1006
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 51, 19); -- 1007
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 51, 26, 'Basic'); -- 1008
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 51, 11); -- 1009
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 51, 21); -- 1010
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 51, 22); -- 1011
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 51, 29); -- 1012
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 51, 39, 'Thief'); -- 1013
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 51, 45, 'Engraver'); -- 1014
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 51, 5); -- 1015
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 51, 15, 'Storytelling'); -- 1016
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 51, 25, 'Art'); -- 1017
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 51, 25, 'Local'); -- 1018
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 51, 25, 'Heraldry'); -- 1019
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 51, 35); -- 1020
-- Grave Robber
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 9); -- 1021
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 11); -- 1022
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 12); -- 1023
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 14); -- 1024
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 18); -- 1025
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 22); -- 1026
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 52, 29); -- 1027
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 52, 42, 'Any'); -- 1028
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 52, 5); -- 1029
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 52, 13); -- 1030
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 52, 16); -- 1031
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 52, 19); -- 1032
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 52, 25, 'Medicine'); -- 1033
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 52, 26, 'Basic'); -- 1034
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 52, 25, 'History'); -- 1035
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 52, 31); -- 1036
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 52, 35); -- 1037
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 52, 40); -- 1038
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 52, 27); -- 1039
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 52, 45, 'Engineer'); -- 1040
-- Outlaw
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 4); -- 1041
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 10); -- 1042
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 11); -- 1043
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 14); -- 1044
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 17); -- 1045
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 21); -- 1046
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 53, 26, 'Basic'); -- 1047
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 53, 28); -- 1048
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 53, 12); -- 1049
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 53, 20); -- 1050
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 53, 25, 'Local'); -- 1051
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 53, 29); -- 1052
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 53, 34, 'Bow'); -- 1053
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 53, 42, 'Rural'); -- 1054
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 53, 18); -- 1055
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 53, 22); -- 1056
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 53, 24); -- 1057
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 53, 36, 'Horse'); -- 1058
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 53, 7); -- 1059
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 53, 25, 'Empire'); -- 1060
-- Racketeer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 54, 10); -- 1061
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 54, 11); -- 1062
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 54, 12); -- 1063
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 54, 14); -- 1064
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 54, 21); -- 1065
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 54, 25, 'Local'); -- 1066
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 54, 26, 'Brawling'); -- 1067
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 54, 42, 'Urban'); -- 1068
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 54, 5); -- 1069
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 54, 7); -- 1070
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 54, 16); -- 1071
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 54, 18); -- 1072
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 54, 23, 'Estalian OR Tilean'); -- 1073
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 54, 26, 'Basic'); -- 1074
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 54, 22); -- 1075
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 54, 24); -- 1076
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 54, 29); -- 1077
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 54, 34, 'Crossbow'); -- 1078
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 54, 25, 'Law'); -- 1079
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 54, 25, 'Politics'); -- 1080
-- Thief
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 4); -- 1081
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 9); -- 1082
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 11); -- 1083
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 12); -- 1084
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 14); -- 1085
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 22); -- 1086
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 55, 29); -- 1087
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 55, 42, 'Urban'); -- 1088
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 55, 16); -- 1089
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 55, 18); -- 1090
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 55, 25, 'Local'); -- 1091
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 55, 31); -- 1092
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 55, 39, 'Thief'); -- 1093
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 55, 41); -- 1094
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 55, 5); -- 1095
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 55, 17); -- 1096
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 55, 21); -- 1097
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 55, 34, 'Crossbow'); -- 1098
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 55, 7); -- 1099
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 55, 40); -- 1100
-- Witch
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 6); -- 1101
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 11); -- 1102
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 14); -- 1103
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 18); -- 1104
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 21); -- 1105
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 56, 23, 'Magick'); -- 1106
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 56, 41); -- 1107
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 56, 42, 'Rural'); -- 1108
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 56, 8); -- 1109
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 56, 12); -- 1110
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 56, 22); -- 1111
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 56, 26, 'Polearm'); -- 1112
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 56, 29); -- 1113
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 56, 45, 'Herbalist'); -- 1114
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 56, 5); -- 1115
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 56, 7); -- 1116
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 56, 19); -- 1117
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 56, 25, 'Dark Magic'); -- 1118
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 56, 25, 'Daemonology'); -- 1119
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 56, 25, 'Magic'); -- 1120
-- Cavalryman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 57, 1); -- 1121
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 57, 8); -- 1122
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 57, 14); -- 1123
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 57, 23, 'Battle'); -- 1124
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 57, 26, 'Basic'); -- 1125
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 57, 28); -- 1126
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 57, 29); -- 1127
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 57, 36, 'Horse'); -- 1128
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 57, 7); -- 1129
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 57, 10); -- 1130
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 57, 11); -- 1131
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 57, 18); -- 1132
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 57, 26, 'Cavalry'); -- 1133
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 57, 34, 'Blackpowder'); -- 1134
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 57, 21); -- 1135
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 57, 22); -- 1136
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 57, 24); -- 1137
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 57, 25, 'Warfare'); -- 1138
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 57, 17); -- 1139
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 57, 25, 'Heraldry'); -- 1140
-- Guard
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 10); -- 1141
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 14); -- 1142
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 58, 15, 'Storytelling'); -- 1143
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 17); -- 1144
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 18); -- 1145
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 22); -- 1146
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 58, 26, 'Basic'); -- 1147
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 58, 29); -- 1148
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 58, 4); -- 1149
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 58, 11); -- 1150
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 58, 12); -- 1151
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 58, 21); -- 1152
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 58, 26, 'Polearm'); -- 1153
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 58, 34, 'Bow'); -- 1154
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 58, 20); -- 1155
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 58, 23, 'Battle'); -- 1156
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 58, 25, 'Etiquette'); -- 1157
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 58, 26, 'Two-handed'); -- 1158
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 58, 24); -- 1159
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 58, 25, 'Warfare'); -- 1160
-- Knight
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 59, 4); -- 1161
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 59, 1); -- 1162
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 59, 8); -- 1163
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 59, 20); -- 1164
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 59, 25, 'Heraldry'); -- 1165
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 59, 26, 'Cavalry'); -- 1166
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 59, 36, 'Horse'); -- 1167
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 59, 45, 'Farrier'); -- 1168
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 59, 11); -- 1169
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 59, 12); -- 1170
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 59, 14); -- 1171
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 59, 21); -- 1172
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 59, 23, 'Battle'); -- 1173
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 59, 26, 'Any'); -- 1174
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 59, 7); -- 1175
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 59, 10); -- 1176
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 59, 24); -- 1177
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 59, 25, 'Warfare'); -- 1178
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 59, 25, 'Any'); -- 1179
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 59, 39, 'Knightly Order'); -- 1180
-- Pit Fighter
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 4); -- 1181
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 11); -- 1182
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 12); -- 1183
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 14); -- 1184
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 17); -- 1185
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 60, 21); -- 1186
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 60, 26, 'Any'); -- 1187
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 60, 26, 'Brawling'); -- 1188
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 60, 19); -- 1189
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 60, 22); -- 1190
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 60, 26, 'Basic'); -- 1191
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 60, 26, 'Flail'); -- 1192
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 60, 26, 'Two-handed'); -- 1193
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 60, 29); -- 1194
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 60, 34, 'Entangling'); -- 1195
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 60, 10); -- 1196
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 60, 18); -- 1197
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 60, 25, 'Anatomy'); -- 1198
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 60, 30, 'Fight'); -- 1199
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 60, 7); -- 1200
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 60, 34, 'Any'); -- 1201
-- Protagonist
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 4); -- 1202
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 12); -- 1203
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 14); -- 1204
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 61, 15, 'Taunt'); -- 1205
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 18); -- 1206
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 19); -- 1207
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 61, 21); -- 1208
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 61, 26, 'Any'); -- 1209
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 61, 5); -- 1210
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 61, 7); -- 1211
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 61, 22); -- 1212
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 61, 26, 'Basic'); -- 1213
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 61, 29); -- 1214
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 61, 36, 'Horse'); -- 1215
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 61, 9); -- 1216
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 61, 11); -- 1217
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 61, 27); -- 1218
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 61, 34, 'Thrown'); -- 1219
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 61, 15, 'Acting'); -- 1220
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 61, 34, 'Crossbow'); -- 1221
-- Slayer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 10); -- 1222
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 11); -- 1223
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 12); -- 1224
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 14); -- 1225
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 17); -- 1226
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 62, 20); -- 1227
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 62, 25, 'Trolls'); -- 1228
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 62, 26, 'Basic'); -- 1229
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 62, 16); -- 1230
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 62, 21); -- 1231
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 62, 23, 'Battle'); -- 1232
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 62, 25, 'Giant'); -- 1233
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 62, 26, 'Two-handed'); -- 1234
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 62, 28); -- 1235
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 62, 15, 'Storytelling'); -- 1236
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 62, 25, 'Dragons'); -- 1237
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 62, 29); -- 1238
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 62, 34, 'Thrown'); -- 1239
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 62, 22); -- 1240
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 62, 25, 'Chaos'); -- 1241
-- Soldier
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 63, 4); -- 1242
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 63, 9); -- 1243
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 63, 11); -- 1244
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 63, 12); -- 1245
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 63, 14); -- 1246
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 63, 23, 'Battle'); -- 1247
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 63, 26, 'Basic'); -- 1248
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 63, 32, 'Drum OR Fife'); -- 1249
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 63, 10); -- 1250
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 63, 17); -- 1251
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 63, 18); -- 1252
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 63, 26, 'Any'); -- 1253
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 63, 34, 'Any'); -- 1254
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 63, 28); -- 1255
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 63, 20); -- 1256
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 63, 22); -- 1257
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 63, 24); -- 1258
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 63, 29); -- 1259
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 63, 25, 'Warfare'); -- 1260
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 63, 27); -- 1261
-- Warrior Priest
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 11); -- 1262
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 12); -- 1263
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 14); -- 1264
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 20); -- 1265
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 24); -- 1266
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 64, 25, 'Theology'); -- 1267
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 64, 26, 'Any'); -- 1268
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 64, 33); -- 1269
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 64, 7); -- 1270
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 64, 15, 'Speeches'); -- 1271
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 64, 21); -- 1272
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 64, 23, 'Battle'); -- 1273
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 64, 26, 'Any'); -- 1274
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 64, 34, 'Any'); -- 1275
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 64, 1); -- 1276
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 64, 22); -- 1277
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 64, 29); -- 1278
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 64, 36, 'Horse'); -- 1279
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 64, 10); -- 1280
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 64, 25, 'Warfare'); -- 1281
-- Butcher
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 9); -- 1282
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 10); -- 1283
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 14); -- 1284
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 18); -- 1285
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 21); -- 1286
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 65, 23, 'Magick'); -- 1287
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 65, 26, 'Basic'); -- 1288
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 65, 33); -- 1289
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 65, 45, 'Burcher'); -- 1290
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 65, 28); -- 1291
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 65, 3, 'Butchery'); -- 1292
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 65, 6, 'Lore of the Great Maw'); -- 1293
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 65, 21); -- 1294
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 65, 34, 'Throwing'); -- 1295
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 65, 25, 'The Great Maw'); -- 1296
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 65, 39, 'The Great Maw'); -- 1297
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 65, 15, 'Speeches'); -- 1298
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 65, 20); -- 1299
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 65, 22); -- 1300
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 65, 29); -- 1301
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 65, 25, 'Magick'); -- 1302
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 65, 23, 'Any'); -- 1303
-- Rhinox Herder
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 4); -- 1304
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 5); -- 1305
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 10); -- 1306
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 12); -- 1307
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 14); -- 1308
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 66, 26, 'Basic'); -- 1309
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 29); -- 1310
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 66, 34, 'Entangling'); -- 1311
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 66, 40); -- 1312
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 66, 42, 'Rural'); -- 1313
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 66, 1); -- 1314
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 66, 2, 'Rhinox'); -- 1315
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 66, 8); -- 1316
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 66, 25, 'Rhinox'); -- 1317
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 66, 14); -- 1318
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 66, 34, 'Throwing'); -- 1319
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 66, 11); -- 1320
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 66, 21); -- 1321
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 66, 28); -- 1322
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 66, 36, 'Rhinox'); -- 1323
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 66, 22); -- 1324
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 66, 24); -- 1325
-- Maneater
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 4); -- 1326
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 10); -- 1327
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 11); -- 1328
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 12); -- 1329
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 14); -- 1330
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 17); -- 1331
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 21); -- 1332
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 67, 23, 'Battle'); -- 1333
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 67, 26, 'Basic'); -- 1334
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 67, 28); -- 1335
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 67, 15, 'Bellow'); -- 1336
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 67, 18); -- 1337
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 67, 25, 'Local'); -- 1338
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 67, 26, 'Two-handed'); -- 1339
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 67, 34, 'Blackpowder'); -- 1340
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 67, 26, 'Any'); -- 1341
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 67, 22); -- 1342
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 67, 24); -- 1343
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 67, 34, 'Any'); -- 1344
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 67, 23, 'Any'); -- 1345
-- Owler
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 68, 1); -- 1346
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 68, 5); -- 1347
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 68, 10); -- 1348
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 68, 14); -- 1349
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 68, 16); -- 1350
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 68, 19); -- 1351
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 68, 26, 'Basic'); -- 1352
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 68, 28); -- 1353
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 68, 36); -- 1354
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 68, 42, 'Rural OR Urban'); -- 1355
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 68, 4); -- 1356
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 68, 7); -- 1357
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 68, 18); -- 1358
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 68, 25, 'Local'); -- 1359
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 68, 29); -- 1360
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 68, 39, 'Smuggler'); -- 1361
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 68, 21); -- 1362
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 68, 22); -- 1363
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 68, 25, 'Law'); -- 1364
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 68, 25, 'Roadways'); -- 1365
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 68, 23, 'Any'); -- 1366
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 68, 24); -- 1367
-- Archer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 69, 4); -- 1368
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 69, 9); -- 1369
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 69, 10); -- 1370
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 69, 12); -- 1371
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 69, 14); -- 1372
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 69, 23, 'Battle'); -- 1373
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 69, 29); -- 1374
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 69, 32, 'Horn'); -- 1375
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 69, 34, 'Bow'); -- 1376
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 69, 42, 'Rural'); -- 1377
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 69, 17); -- 1378
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 69, 18); -- 1379
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 69, 26, 'Basic'); -- 1380
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 69, 28); -- 1381
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 69, 44); -- 1382
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 69, 45, 'Fletcher'); -- 1383
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 69, 11); -- 1384
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 69, 24); -- 1385
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 69, 27); -- 1386
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 69, 36, 'Horse'); -- 1387
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 69, 25, 'Warfare'); -- 1388
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 69, 39, 'Scout'); -- 1389
-- Greatsword
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 70, 4); -- 1390
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 70, 10); -- 1391
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 70, 11); -- 1392
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 70, 12); -- 1393
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 70, 14); -- 1394
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 70, 18); -- 1395
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 70, 23, 'Battle'); -- 1396
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 70, 26, 'Basic'); -- 1397
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 70, 26, 'Two-handed'); -- 1398
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 70, 32, 'Drum'); -- 1399
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 70, 17); -- 1400
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 70, 21); -- 1401
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 70, 25, 'Heraldry'); -- 1402
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 70, 26, 'Any'); -- 1403
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 70, 28); -- 1404
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 70, 29); -- 1405
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 70, 22); -- 1406
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 70, 24); -- 1407
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 70, 27); -- 1408
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 70, 36, 'Horse'); -- 1409
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 70, 7); -- 1410
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 70, 25, 'Warfare'); -- 1411
-- Halberdier
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 71, 4); -- 1412
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 71, 10); -- 1413
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 71, 11); -- 1414
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 71, 12); -- 1415
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 71, 14); -- 1416
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 71, 23, 'Battle'); -- 1417
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 71, 26, 'Basic'); -- 1418
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 71, 26, 'Polearm'); -- 1419
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 71, 30, 'Parade'); -- 1420
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 71, 32, 'Drum'); -- 1421
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 71, 9); -- 1422
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 71, 17); -- 1423
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 71, 18); -- 1424
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 71, 21); -- 1425
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 71, 28); -- 1426
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 71, 29); -- 1427
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 71, 22); -- 1428
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 71, 24); -- 1429
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 71, 27); -- 1430
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 71, 36, 'Horse'); -- 1431
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 71, 7); -- 1432
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 71, 25, 'Warfare'); -- 1433
-- Handgunner
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 72, 4); -- 1434
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 72, 10); -- 1435
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 72, 11); -- 1436
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 72, 12); -- 1437
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 72, 14); -- 1438
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 72, 23, 'Battle'); -- 1439
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 72, 26, 'Basic'); -- 1440
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 72, 29); -- 1441
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 72, 32, 'Flute'); -- 1442
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 72, 34, 'Blackpowder'); -- 1443
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 72, 9); -- 1444
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 72, 17); -- 1445
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 72, 18); -- 1446
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 72, 22); -- 1447
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 72, 28); -- 1448
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 72, 45, 'Gunsmith'); -- 1449
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 72, 24); -- 1450
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 72, 27); -- 1451
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 72, 34, 'Engineer'); -- 1452
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 72, 36, 'Horse'); -- 1453
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 72, 7); -- 1454
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 72, 25, 'Warfare'); -- 1455
-- Artillerist
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 73, 1); -- 1456
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 73, 11); -- 1457
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 73, 13); -- 1458
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 73, 14); -- 1459
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 73, 16); -- 1460
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 73, 23, 'Battle'); -- 1461
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 73, 26, 'Basic'); -- 1462
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 73, 27); -- 1463
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 73, 29); -- 1464
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 73, 34, 'Blackpowder OR Catapult OR Crossbow OR Engineering'); -- 1465
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 73, 10); -- 1466
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 73, 17); -- 1467
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 73, 18); -- 1468
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 73, 28); -- 1469
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 73, 34, 'Blackpowder OR Catapult OR Crossbow OR Engineering'); -- 1470
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 73, 45, 'Carpenter OR Gunsmith'); -- 1471
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 73, 22); -- 1472
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 73, 24); -- 1473
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 73, 25, 'Artillery'); -- 1474
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 73, 36, 'Horse'); -- 1475
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 73, 7); -- 1476
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 73, 25, 'Warfare'); -- 1477
-- Camp Follower
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 74, 7); -- 1478
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 74, 10); -- 1479
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 74, 12); -- 1480
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 74, 15, 'Any'); -- 1481
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 74, 18); -- 1482
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 74, 19); -- 1483
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 74, 26, 'Any'); -- 1484
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 74, 28); -- 1485
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 74, 29); -- 1486
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 74, 30, 'Dance'); -- 1487
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 74, 4); -- 1488
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 74, 5); -- 1489
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 74, 14); -- 1490
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 74, 17); -- 1491
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 74, 34, 'Any'); -- 1492
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 74, 42, 'Rural'); -- 1493
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 74, 11); -- 1494
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 74, 21); -- 1495
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 74, 22); -- 1496
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 74, 23, 'Any'); -- 1497
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 74, 16); -- 1498
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 74, 24); -- 1499
-- Cartographer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 75, 3, 'Cartography'); -- 1500
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 75, 9); -- 1501
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 75, 16); -- 1502
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 75, 25, 'Geography'); -- 1503
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 75, 26, 'Basic'); -- 1504
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 75, 27); -- 1505
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 75, 28); -- 1506
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 75, 29); -- 1507
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 75, 42, 'Rural'); -- 1508
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 75, 45, 'Cartographer'); -- 1509
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 75, 7); -- 1510
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 75, 14); -- 1511
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 75, 18); -- 1512
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 75, 19); -- 1513
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 75, 25, 'Heraldry'); -- 1514
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 75, 36, 'Horse'); -- 1515
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 75, 22); -- 1516
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 75, 23, 'Guilder'); -- 1517
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 75, 35); -- 1518
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 75, 39, 'Guilder'); -- 1519
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 75, 23, 'Any'); -- 1520
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 75, 25, 'Any'); -- 1521
-- Freelance Knight
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 76, 1); -- 1522
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 76, 4); -- 1523
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 76, 8); -- 1524
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 76, 10); -- 1525
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 76, 20); -- 1526
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 76, 18); -- 1527
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 76, 26, 'Cavalry'); -- 1528
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 76, 28); -- 1529
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 76, 36, 'Horse'); -- 1530
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 76, 45, 'Farrier'); -- 1531
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 76, 7); -- 1532
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 76, 11); -- 1533
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 76, 12); -- 1534
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 76, 14); -- 1535
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 76, 21); -- 1536
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 76, 22); -- 1537
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 76, 26, 'Any'); -- 1538
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 76, 17); -- 1539
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 76, 19); -- 1540
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 76, 24); -- 1541
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 76, 25, 'Warfare'); -- 1542
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 76, 23, 'Battle'); -- 1543
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 76, 25, 'Any'); -- 1544
-- Knight of the Blazing Sun
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 77, 1); -- 1545
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 77, 4); -- 1546
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 77, 8); -- 1547
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 77, 20); -- 1548
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 77, 23, 'Classical'); -- 1549
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 77, 25, 'Any'); -- 1550
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 77, 25, 'Heraldry'); -- 1551
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 77, 26, 'Basic'); -- 1552
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 77, 26, 'Cavalry'); -- 1553
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 77, 36, 'Horse'); -- 1554
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 77, 11); -- 1555
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 77, 12); -- 1556
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 77, 14); -- 1557
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 77, 21); -- 1558
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 77, 23, 'Battle'); -- 1559
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 77, 25, 'Warfare'); -- 1560
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 77, 26, 'Any'); -- 1561
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 77, 7); -- 1562
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 77, 24); -- 1563
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 77, 34, 'Any'); -- 1564
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 77, 35); -- 1565
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 77, 25, 'Any'); -- 1566
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 77, 39, 'Blazing Sun'); -- 1567
-- Knight of the White Wolf
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 78, 1); -- 1568
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 78, 4); -- 1569
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 78, 8); -- 1570
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 78, 20); -- 1571
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 78, 25, 'Heraldry'); -- 1572
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 78, 26, 'Basic'); -- 1573
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 78, 26, 'Cavalry'); -- 1574
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 78, 28); -- 1575
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 78, 36, 'Horse'); -- 1576
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 78, 45, 'Farrier'); -- 1577
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 78, 11); -- 1578
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 78, 12); -- 1579
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 78, 14); -- 1580
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 78, 21); -- 1581
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 78, 23, 'Battle'); -- 1582
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 78, 26, 'Any'); -- 1583
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 78, 10); -- 1584
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 78, 24); -- 1585
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 78, 25, 'Warfare'); -- 1586
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 78, 29); -- 1587
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 78, 25, 'Any'); -- 1588
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 78, 39, 'Ulric'); -- 1589
-- Knight Panther
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 79, 1); -- 1590
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 79, 4); -- 1591
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 79, 8); -- 1592
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 79, 20); -- 1593
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 79, 25, 'Empire'); -- 1594
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 79, 25, 'Heraldry'); -- 1595
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 79, 26, 'Basic'); -- 1596
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 79, 26, 'Cavalry'); -- 1597
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 79, 36, 'Horse'); -- 1598
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 79, 45, 'Farrier'); -- 1599
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 79, 11); -- 1600
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 79, 12); -- 1601
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 79, 14); -- 1602
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 79, 21); -- 1603
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 79, 23, 'Battle'); -- 1604
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 79, 26, 'Any'); -- 1605
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 79, 7); -- 1606
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 79, 23, 'Any'); -- 1607
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 79, 24); -- 1608
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 79, 25, 'Warfare'); -- 1609
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 79, 25, 'Any'); -- 1610
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 79, 39, 'Knights Panther'); -- 1611
-- Light Cavalry
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 80, 1); -- 1612
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 80, 12); -- 1613
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 80, 14); -- 1614
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 80, 19); -- 1615
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 80, 20); -- 1616
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 80, 23, 'Battle'); -- 1617
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 80, 26, 'Basic'); -- 1618
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 80, 28); -- 1619
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 80, 34, 'Throwing'); -- 1620
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 80, 36, 'Horse'); -- 1621
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 80, 7); -- 1622
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 80, 10); -- 1623
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 80, 17); -- 1624
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 80, 18); -- 1625
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 80, 26, 'Cavalry'); -- 1626
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 80, 34, 'Bow'); -- 1627
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 80, 13); -- 1628
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 80, 22); -- 1629
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 80, 24); -- 1630
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 80, 25, 'Warfare'); -- 1631
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 80, 25, 'Heraldry OR Law'); -- 1632
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 80, 34, 'Blackpowder'); -- 1633
-- Siege Specialist
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 81, 4); -- 1634
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 81, 9); -- 1635
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 81, 10); -- 1636
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 81, 14); -- 1637
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 81, 17); -- 1638
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 81, 18); -- 1639
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 81, 23, 'Battle'); -- 1640
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 81, 26, 'Basic'); -- 1641
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 81, 28); -- 1642
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 81, 34, 'Crossbow'); -- 1643
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 81, 22); -- 1644
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 81, 25, 'Engineering'); -- 1645
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 81, 26, 'Two-handed'); -- 1646
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 81, 29); -- 1647
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 81, 40); -- 1648
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 81, 45, 'Miner'); -- 1649
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 81, 24); -- 1650
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 81, 34, 'Catapult'); -- 1651
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 81, 34, 'Engineering'); -- 1652
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 81, 45, 'Explosives'); -- 1653
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 81, 25, 'Law'); -- 1654
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 81, 36, 'Horse'); -- 1655
-- Pikeman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 82, 4); -- 1656
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 82, 9); -- 1657
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 82, 10); -- 1658
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 82, 12); -- 1659
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 82, 14); -- 1660
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 82, 17); -- 1661
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 82, 23, 'Battle'); -- 1662
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 82, 23, 'Tilean'); -- 1663
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 82, 26, 'Basic'); -- 1664
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 82, 26, 'Polearm'); -- 1665
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 82, 11); -- 1666
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 82, 18); -- 1667
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 82, 20); -- 1668
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 82, 21); -- 1669
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 82, 25, 'Warfare'); -- 1670
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 82, 28); -- 1671
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 82, 19); -- 1672
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 82, 22); -- 1673
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 82, 24); -- 1674
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 82, 29); -- 1675
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 82, 25, 'Law'); -- 1676
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 82, 36, 'Horse'); -- 1677
-- Warrior Priest of Myrmidia
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 83, 11); -- 1678
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 83, 12); -- 1679
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 83, 23, 'Battle'); -- 1680
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 83, 24); -- 1681
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 83, 25, 'Warfare'); -- 1682
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 83, 25, 'Theology'); -- 1683
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 83, 26, 'Basic'); -- 1684
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 83, 26, 'Polearm'); -- 1685
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 83, 29); -- 1686
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 83, 33); -- 1687
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 83, 7); -- 1688
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 83, 15, 'Speeches'); -- 1689
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 83, 20); -- 1690
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 83, 22); -- 1691
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 83, 26, 'Any'); -- 1692
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 83, 34, 'Any'); -- 1693
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 83, 25, 'Any'); -- 1694
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 83, 26, 'Any'); -- 1695
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 83, 35); -- 1696
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 83, 45, 'Weaponsmith OR Armourer'); -- 1697
-- Wolf Kin
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 84, 9); -- 1698
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 84, 11); -- 1699
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 84, 14); -- 1700
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 84, 20); -- 1701
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 84, 21); -- 1702
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 84, 22); -- 1703
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 84, 25, 'Ulric'); -- 1704
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 84, 26, 'Basic'); -- 1705
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 84, 26, 'Brawling'); -- 1706
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 84, 28); -- 1707
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 84, 4); -- 1708
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 84, 12); -- 1709
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 84, 25, 'Beasts'); -- 1710
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 84, 25, 'Herbs'); -- 1711
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 84, 42, 'Rural'); -- 1712
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 84, 27); -- 1713
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 84, 29); -- 1714
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 84, 44); -- 1715
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 84, 1); -- 1716
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 84, 43); -- 1717
-- Beachcomber
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 85, 9); -- 1718
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 85, 12); -- 1719
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 85, 18); -- 1720
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 85, 19); -- 1721
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 85, 25, 'Coasts AND Tides'); -- 1722
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 85, 26, 'Basic'); -- 1723
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 85, 28); -- 1724
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 85, 29); -- 1725
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 85, 37); -- 1726
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 85, 42, 'Rural'); -- 1727
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 85, 10); -- 1728
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 85, 14); -- 1729
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 85, 25, 'Any'); -- 1730
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 85, 34, 'Sling'); -- 1731
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 85, 40); -- 1732
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 85, 43); -- 1733
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 85, 7); -- 1734
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 85, 16); -- 1735
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 85, 17); -- 1736
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 85, 38); -- 1737
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 85, 24); -- 1738
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 85, 45, 'Boatbuilder'); -- 1739
-- Chantyman
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 86, 7); -- 1740
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 86, 10); -- 1741
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 86, 12); -- 1742
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 86, 15, 'Singing'); -- 1743
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 86, 18); -- 1744
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 86, 26, 'Brawling'); -- 1745
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 86, 32, 'Fiddle OR Squeezebox OR Tin Whistle'); -- 1746
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 86, 37); -- 1747
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 86, 38); -- 1748
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 86, 43); -- 1749
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 86, 4); -- 1750
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 86, 9); -- 1751
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 86, 14); -- 1752
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 86, 17); -- 1753
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 86, 26, 'Basic'); -- 1754
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 86, 30, 'Any'); -- 1755
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 86, 11); -- 1756
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 86, 23, 'Any'); -- 1757
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 86, 24); -- 1758
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 86, 29); -- 1759
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 86, 25, 'Oceans'); -- 1760
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 86, 27); -- 1761
-- Huffer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 87, 10); -- 1762
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 87, 18); -- 1763
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 87, 22); -- 1764
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 87, 25, 'Local'); -- 1765
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 87, 25, 'Oceans'); -- 1766
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 87, 26, 'Basic'); -- 1767
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 87, 27); -- 1768
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 87, 29); -- 1769
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 87, 37); -- 1770
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 87, 43); -- 1771
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 87, 4); -- 1772
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 87, 7); -- 1773
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 87, 9); -- 1774
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 87, 11); -- 1775
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 87, 15, 'Storytelling'); -- 1776
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 87, 23, 'Any'); -- 1777
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 87, 19); -- 1778
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 87, 21); -- 1779
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 87, 25, 'Local'); -- 1780
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 87, 25, 'Wrecks'); -- 1781
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 87, 24); -- 1782
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 87, 38); -- 1783
-- Officer
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 88, 4); -- 1784
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 88, 9); -- 1785
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 88, 18); -- 1786
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 88, 24); -- 1787
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 88, 26, 'Basic'); -- 1788
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 88, 28); -- 1789
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 88, 29); -- 1790
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 88, 37); -- 1791
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 88, 38); -- 1792
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 88, 43); -- 1793
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 88, 11); -- 1794
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 88, 14); -- 1795
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 88, 21); -- 1796
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 88, 25, 'Oceans'); -- 1797
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 88, 27); -- 1798
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 88, 34, 'Blackpowder'); -- 1799
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 88, 3, 'Cartography'); -- 1800
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 88, 7); -- 1801
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 88, 12); -- 1802
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 88, 22); -- 1803
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 88, 23, 'Any'); -- 1804
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 88, 25, 'Any'); -- 1805
-- Sailor
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 89, 9); -- 1806
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 89, 10); -- 1807
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 89, 17); -- 1808
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 89, 18); -- 1809
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 89, 25, 'Oceans'); -- 1810
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 89, 26, 'Brawling'); -- 1811
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 89, 32, 'Pennywhistle'); -- 1812
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 89, 37); -- 1813
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 89, 38); -- 1814
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 89, 43); -- 1815
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 89, 4); -- 1816
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 89, 12); -- 1817
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 89, 14); -- 1818
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 89, 15, 'Singing'); -- 1819
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 89, 23, 'Any'); -- 1820
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 89, 26, 'Basic'); -- 1821
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 89, 11); -- 1822
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 89, 24); -- 1823
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 89, 29); -- 1824
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 89, 45, 'Carpenter'); -- 1825
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 89, 7); -- 1826
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 89, 27); -- 1827
-- Sailor-Priest of Manann
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 90, 4); -- 1828
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 90, 10); -- 1829
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 90, 11); -- 1830
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 90, 14); -- 1831
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 90, 23, 'Classical'); -- 1832
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 90, 25, 'Manann'); -- 1833
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 90, 33); -- 1834
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 90, 37); -- 1835
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 90, 38); -- 1836
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 90, 43); -- 1837
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 90, 22); -- 1838
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 90, 15, 'Singing'); -- 1839
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 90, 17); -- 1840
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 90, 21); -- 1841
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 90, 26, 'Polearm'); -- 1842
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 90, 27); -- 1843
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 90, 7); -- 1844
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 90, 24); -- 1845
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 90, 25, 'Oceans'); -- 1846
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 90, 34, 'Blackpowder'); -- 1847
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 90, 23, 'Any'); -- 1848
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 90, 25, 'Politics'); -- 1849
-- Ship’s Gunner
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 91, 4); -- 1850
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 91, 9); -- 1851
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 91, 12); -- 1852
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 91, 14); -- 1853
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 91, 23, 'Battle'); -- 1854
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 91, 26, 'Brawling'); -- 1855
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 91, 29); -- 1856
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 91, 34, 'Blackpowder'); -- 1857
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 91, 37); -- 1858
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 91, 43); -- 1859
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 91, 10); -- 1860
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 91, 11); -- 1861
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 91, 17); -- 1862
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 91, 18); -- 1863
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 91, 26, 'Basic'); -- 1864
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 91, 38); -- 1865
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 91, 24); -- 1866
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 91, 25, 'Artillery'); -- 1867
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 91, 27); -- 1868
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 91, 45, 'Gunsmith'); -- 1869
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 91, 7); -- 1870
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 91, 25, 'Oceans'); -- 1871
-- Wrecker
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 92, 9); -- 1872
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 92, 10); -- 1873
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 92, 12); -- 1874
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 92, 14); -- 1875
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 92, 26, 'Basic'); -- 1876
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 92, 28); -- 1877
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 92, 34, 'Sling'); -- 1878
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 92, 37); -- 1879
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 92, 38); -- 1880
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 92, 43); -- 1881
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 92, 5); -- 1882
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 92, 11); -- 1883
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 92, 22); -- 1884
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 92, 27); -- 1885
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 92, 29); -- 1886
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 92, 40); -- 1887
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 92, 18); -- 1888
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 92, 21); -- 1889
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 92, 34, 'Crossbow'); -- 1890
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 92, 42, 'Rural'); -- 1891
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (4, 92, 24); -- 1892
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 92, 25, 'Oceans'); -- 1893
-- Priest of Stromfels
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 93, 9); -- 1894
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 93, 10); -- 1895
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 93, 14); -- 1896
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 93, 21); -- 1897
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 93, 22); -- 1898
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (1, 93, 26, 'Basic'); -- 1899
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 93, 33); -- 1900
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 93, 37); -- 1901
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 93, 38); -- 1902
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (1, 93, 43); -- 1903
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 93, 11); -- 1904
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 93, 15, 'Singing'); -- 1905
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (2, 93, 25, 'Stromfels'); -- 1906
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 93, 27); -- 1907
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 93, 29); -- 1908
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (2, 93, 44); -- 1909
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 93, 18); -- 1910
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 93, 24); -- 1911
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (3, 93, 25, 'Oceans'); -- 1912
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID) VALUES (3, 93, 40); -- 1913
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 93, 26, 'Any'); -- 1914
INSERT INTO CareerSkills (CareerLevel, CareerID, SkillID, SkillGroup) VALUES (4, 93, 34, 'Blackpowder'); -- 1915
-- Beadle



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
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (288); -- 15 -- Townsman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (308); -- 16 -- Watchman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (327); -- 17 -- Advisor
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (341); -- 18 -- Artist
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (367); -- 19 -- Duellist
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (382); -- 20 -- Envoy
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (405); -- 21 -- Noble
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (425); -- 22 -- Servant
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (445); -- 23 -- Spy
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (468); -- 24 -- Warden
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (486); -- 25 -- Bailiff
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (503); -- 26 -- Hedge Witch
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (528); -- 27 -- Herbalist
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (545); -- 28 -- Hunter
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (565); -- 29 -- Miner
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (586); -- 30 -- Mystic
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (608); -- 31 -- Scout
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (624); -- 32 -- Villager
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (646); -- 33 -- Bounty Hunter
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (664); -- 34 -- Coachman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (683); -- 35 -- Entertainer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (707); -- 36 -- Flagellant
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (724); -- 37 -- Messenger
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (745); -- 38 -- Pedlar
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (767); -- 39 -- Road Warden
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (784); -- 40 -- Witch Hunter
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (807); -- 41 -- Boatman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (825); -- 42 -- Huffer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (844); -- 43 -- Riverwarden
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (864); -- 44 -- Riverwoman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (887); -- 45 -- Seaman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (907); -- 46 -- Smuggler
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (925); -- 47 -- Stevedore
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (946); -- 48 -- Wrecker
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (962); -- 49 -- Bawd
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (983); -- 50 -- Charlatan
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1004); -- 51 -- Fence
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1028); -- 52 -- Grave Robber
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1046); -- 53 -- Outlaw
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1065); -- 54 -- Racketeer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1088); -- 55 -- Thief
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1106); -- 56 -- Witch
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1128); -- 57 -- Cavalryman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1148); -- 58 -- Guard
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1166); -- 59 -- Knight
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1187); -- 60 -- Pit Fighter
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1209); -- 61 -- Protagonist
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1229); -- 62 -- Slayer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1248); -- 63 -- Soldier
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1266); -- 64 -- Warrior Priest
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1290); -- 65 -- Butcher
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1311); -- 66 -- Rhinox Herder
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1334); -- 67 -- Maneater
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1355); -- 68 -- Owler
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1376); -- 69 -- Archer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1398); -- 70 -- Greatsword
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1419); -- 71 -- Halberdier
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1443); -- 72 -- Handgunner
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1465); -- 73 -- Artillerist
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1485); -- 74 -- Camp Follower
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1509); -- 75 -- Cartographer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1528); -- 76 -- Freelance Knight
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1553); -- 77 -- Knight of the Blazing Sun
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1574); -- 78 -- Knight of the White Wolf
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1597); -- 79 -- Knight Panther
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1621); -- 80 -- Light Cavalry
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1643); -- 81 -- Siege Specialist
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1665); -- 82 -- Pikeman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1682); -- 83 -- Warrior Priest of Myrmidia
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1707); -- 84 -- Wolf Kin
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1725); -- 85 -- Beachcomber
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1743); -- 86 -- Chantyman
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1767); -- 87 -- Huffer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1787); -- 88 -- Officer
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1814); -- 89 -- Sailor
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1834); -- 90 -- Sailor-Priest of Manann
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1857); -- 91 -- Ship’s Gunner
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1876); -- 92 -- Wrecker
INSERT INTO CareerTradeSkill (CareerSkillsID) VALUES (1899); -- 93 -- Priest of Stromfels


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
INSERT INTO Talents (Name) VALUES ('Large'); -- 168
INSERT INTO Talents (Name) VALUES ('Vice'); -- 169
INSERT INTO Talents (Name) VALUES ('Suffused with Ulgu'); -- 170


-- Human
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (1, 43); -- 1
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (1, 118); -- 2
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (1, 147); -- 3
-- Halfling
INSERT INTO SpeciesTalents (SpeciesID, TalentID, TalentGroup) VALUES (2, 2, 'Taste'); -- 4
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (2, 91); -- 5
INSERT INTO SpeciesTalents (SpeciesID, TalentID, TalentGroup) VALUES (2, 109, 'Chaos'); -- 6
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (2, 131); -- 7
-- Dwarf
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (3, 83); -- 8
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (3, 91); -- 9
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (3, 107); -- 10
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (3, 108); -- 11
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (3, 110); -- 12
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (3, 144); -- 13
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (3, 146); -- 14
-- Ogre
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (4, 40); -- 15
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (4, 168); -- 16
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (4, 91); -- 17
INSERT INTO SpeciesTalents (SpeciesID, TalentID, TalentGroup) VALUES (4, 109, 'Poison(Ingested)'); -- 18
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (4, 159); -- 19
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (4, 160); -- 20
INSERT INTO SpeciesTalents (SpeciesID, TalentID, TalentGroup) VALUES (4, 169, 'Food'); -- 21
-- Gnome
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (5, 13); -- 22
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (5, 170); -- 23
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (5, 81); -- 24
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (5, 90); -- 25
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (5, 91); -- 26
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (5, 54); -- 27
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (5, 107); -- 28
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (5, 123); -- 29
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (5, 129); -- 30
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (5, 131); -- 31
-- High Elf
INSERT INTO SpeciesTalents (SpeciesID, TalentID, TalentGroup) VALUES (6, 2, 'Sight'); -- 32
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (6, 32); -- 33
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (6, 118); -- 34
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (6, 91); -- 35
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (6, 123); -- 36
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (6, 129); -- 37
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (6, 107); -- 38
-- Wood Elf
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (7, 2, 'Sight'); -- 39
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (7, 63); -- 40
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (7, 123); -- 41
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (7, 91); -- 42
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (7, 107); -- 43
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (7, 159); -- 44
INSERT INTO SpeciesTalents (SpeciesID, TalentID) VALUES (7, 116); -- 45


-- Apothecary
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (1, 30, 1); -- 1
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (1, 34, 1, 'Apothecary'); -- 2
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (1, 48, 1, 'Scholar'); -- 3
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (1, 107, 1); -- 4
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (1, 35, 2); -- 5
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (1, 37, 2); -- 6
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (1, 48, 2, 'Guilder'); -- 7
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (1, 101, 2); -- 8
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (1, 17, 3); -- 9
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (1, 88, 3, 'Apothecary'); -- 10
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (1, 109, 3, 'Poison'); -- 11
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (1, 118, 3); -- 12
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (1, 2, 4, 'Taste'); -- 13
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (1, 32, 4); -- 14
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (1, 88, 4, 'Poisoner'); -- 15
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (1, 117, 4, 'Apothecary'); -- 16
-- Engineer
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (2, 9, 1); -- 17
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (2, 62, 1); -- 18
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (2, 107, 1); -- 19
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (2, 153, 1); -- 20
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (2, 34, 2, 'Engineer'); -- 21
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (2, 48, 2, 'Guilder'); -- 22
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (2, 85, 2); -- 23
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (2, 97, 2); -- 24
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (2, 48, 3, 'Scholar'); -- 25
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (2, 88, 3, 'Engineering'); -- 26
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (2, 132, 3); -- 27
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (2, 148, 3); -- 28
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (2, 84, 4); -- 29
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (2, 105, 4); -- 30
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (2, 117, 4, 'Engineering'); -- 31
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (2, 158, 4); -- 32
-- Lawyer
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 15, 1); -- 33
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (3, 48, 1, 'Scholar'); -- 34
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 107, 1); -- 35
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 133, 1); -- 36
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 8, 2); -- 37
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 35, 2); -- 38
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (3, 48, 2, 'Guilder'); -- 39
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 147, 2); -- 40
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 17, 3); -- 41
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 24, 3); -- 42
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 68, 3); -- 43
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 118, 3); -- 44
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 29, 4); -- 45
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 77, 4); -- 46
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (3, 117, 4, 'Law'); -- 47
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (3, 165, 4); -- 48
-- Nun
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (4, 16, 1, 'Any'); -- 49
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (4, 136, 1); -- 50
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (4, 98, 1); -- 51
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (4, 107, 1); -- 52
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (4, 48, 2, 'Cultists'); -- 53
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (4, 53, 2); -- 54
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (4, 66, 2); -- 55
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (4, 73, 2, 'Any'); -- 56
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (4, 109, 3, 'Any'); -- 57
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (4, 114, 3); -- 58
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (4, 117, 3, 'Theology'); -- 59
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (4, 137, 3); -- 60
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (4, 29, 4); -- 61
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (4, 75, 4); -- 62
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (4, 104, 4); -- 63
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (4, 144, 4); -- 64
-- Physician
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (5, 17, 1); -- 65
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (5, 53, 1); -- 66
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (5, 107, 1); -- 67
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (5, 141, 1); -- 68
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (5, 32, 2); -- 69
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (5, 35, 2); -- 70
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (5, 48, 2, 'Guilder'); -- 71
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (5, 151, 2); -- 72
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (5, 48, 3, 'Scholars'); -- 73
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (5, 109, 3, 'Disease'); -- 74
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (5, 118, 3); -- 75
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (5, 140, 3); -- 76
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (5, 48, 4, 'Nobles'); -- 77
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (5, 92, 4); -- 78
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (5, 117, 4, 'Medicine'); -- 79
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (5, 144, 4); -- 80
-- Priest
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (6, 16, 1, 'Any'); -- 81
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (6, 66, 1); -- 82
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (6, 107, 1); -- 83
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (6, 147, 1); -- 84
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (6, 15, 2); -- 85
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (6, 17, 2); -- 86
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (6, 48, 2, 'Cultists'); -- 87
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (6, 73, 2, 'Any'); -- 88
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (6, 2, 3, 'Any'); -- 89
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (6, 64, 3, 'Any'); -- 89
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (6, 68, 3); -- 89
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (6, 144, 3); -- 89
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (6, 87, 4); -- 90
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (6, 104, 4); -- 91
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (6, 109, 4, 'Any'); -- 92
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (6, 117, 4, 'Theology'); -- 93
-- Scholar
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 22, 1); -- 94
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 107, 1); -- 95
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 118, 1); -- 96
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 148, 1); -- 97
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 17, 2); -- 98
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (7, 48, 2, 'Scholars'); -- 99
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 133, 2); -- 100
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 147, 2); -- 101
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 79, 3); -- 102
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 103, 3); -- 103
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (7, 117, 3, 'Any'); -- 104
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 154, 3); -- 105
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 84, 4); -- 106
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 87, 4); -- 107
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (7, 117, 4, 'Any'); -- 108
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (7, 126, 4); -- 109
-- Wizard
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 3, 1); -- 110
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 100, 1); -- 111
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 107, 1); -- 112
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 123, 1); -- 113
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (8, 7, 2, 'Any'); -- 114
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 38, 2); -- 115
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 49, 2); -- 116
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 129, 2); -- 117
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 45, 3); -- 118
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 72, 3); -- 119
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 82, 3); -- 120
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 89, 3); -- 121
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 26, 4); -- 122
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 59, 4); -- 123
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 75, 4); -- 124
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (8, 162, 4); -- 125
-- Agitator
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 15, 1); -- 126
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 61, 1); -- 127
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 98, 1); -- 128
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 107, 1); -- 129
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 4, 2); -- 130
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 8, 2); -- 131
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 68, 2); -- 132
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 103, 2); -- 133
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 24, 3); -- 134
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 40, 3); -- 135
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 56, 3); -- 136
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 135, 3); -- 137
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (9, 48, 4, 'Any'); -- 138
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 87, 4); -- 139
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 120, 4); -- 140
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (9, 147, 4); -- 141
-- Artisan
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 9, 1); -- 142
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (10, 34, 1, 'Any'); -- 143
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 142, 1); -- 144
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 160, 1); -- 145
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 37, 2); -- 146
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (10, 48, 2, 'Guilder'); -- 147
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 92, 2); -- 148
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 146, 2); -- 149
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (10, 2, 3, 'Taste'); -- 150
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (10, 2, 3, 'Touch'); -- 151
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (10, 88, 3, 'Any'); -- 152
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 107, 3); -- 153
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 153, 3); -- 154
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 19, 4); -- 155
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 84, 4); -- 156
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 103, 4); -- 157
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (10, 120, 4); -- 158
-- Beggar
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 98, 1); -- 159
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (11, 109, 1, 'Disease'); -- 160
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 136, 1); -- 161
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 159, 1); -- 162
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 4, 2); -- 163
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 13, 2); -- 164
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 35, 2); -- 165
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (11, 48, 2, 'Criminals'); -- 166
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 15, 3); -- 167
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 40, 3); -- 168
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 63, 3); -- 169
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 135, 3); -- 170
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 24, 4); -- 171
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (11, 51, 4, 'Watchmen'); -- 172
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 77, 4); -- 173
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (11, 147, 4); -- 174
-- Investigator
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 4, 1); -- 175
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 13, 1); -- 176
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 107, 1); -- 177
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 126, 1); -- 178
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (12, 48, 2, 'Any'); -- 179
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 118, 2); -- 180
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 125, 2); -- 181
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 152, 2); -- 182
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 17, 3); -- 183
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 18, 3); -- 184
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 129, 3); -- 185
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 147, 3); -- 186
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (12, 2, 4, 'Any'); -- 187
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (12, 117, 4, 'Any'); -- 188
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 133, 4); -- 189
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (12, 154, 4); -- 190
-- Merchant
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 15, 1); -- 191
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 37, 1); -- 192
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 107, 1); -- 193
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 147, 1); -- 194
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 19, 2); -- 195
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 46, 2); -- 196
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (13, 48, 2, 'Guilder'); -- 197
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 118, 2); -- 198
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 24, 3); -- 199
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (13, 48, 3, 'Any'); -- 200
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 95, 3); -- 201
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 126, 3); -- 202
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 75, 4); -- 203
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 81, 4); -- 204
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 120, 4); -- 205
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (13, 165, 4); -- 206
-- Rat Catcher
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 91, 1); -- 207
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (14, 109, 1, 'Disease'); -- 208
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 139, 1); -- 209
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 141, 1); -- 210
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 47, 2); -- 211
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (14, 48, 2, 'Guilder'); -- 212
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (14, 51, 2, 'Rats'); -- 213
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 159, 2); -- 214
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 63, 3); -- 215
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 137, 3); -- 216
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 143, 3); -- 217
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 157, 3); -- 218
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (14, 51, 4, 'Skaven'); -- 219
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 89, 4); -- 220
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 114, 4); -- 221
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (14, 144, 4); -- 222
-- Townsman
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 4, 1); -- 223
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 13, 1); -- 224
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (15, 48, 1, 'Servants'); -- 225
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 146, 1); -- 226
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 37, 2); -- 227
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 46, 2); -- 228
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (15, 48, 2, 'Any'); -- 229
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 61, 2); -- 230
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 19, 3); -- 231
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 103, 3); -- 232
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 107, 3); -- 233
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 149, 3); -- 234
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 29, 4); -- 235
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 87, 4); -- 236
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 120, 4); -- 237
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (15, 147, 4); -- 238
-- Watchman
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 44, 1); -- 239
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 63, 1); -- 240
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 141, 1); -- 241
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 152, 1); -- 242
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 18, 2); -- 243
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 35, 2); -- 244
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 91, 2); -- 245
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 134, 2); -- 246
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 41, 3); -- 247
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (16, 48, 3, 'Soldiers'); -- 248
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (16, 51, 3, 'Criminals'); -- 249
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 94, 3); -- 250
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 103, 4); -- 251
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 114, 4); -- 252
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 77, 4); -- 253
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (16, 120, 4); -- 254
-- Advisor
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 13, 1); -- 255
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (17, 48, 1, 'Any'); -- 256
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 61, 1); -- 257
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 107, 1); -- 258
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 15, 2); -- 259
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 35, 2); -- 260
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 120, 2); -- 261
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 149, 2); -- 262
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 8, 3); -- 263
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 19, 3); -- 264
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 22, 3); -- 265
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 24, 3); -- 266
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 29, 4); -- 267
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 46, 4); -- 268
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 77, 4); -- 269
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (17, 147, 4); -- 270
-- Artist
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 9, 1); -- 271
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 126, 1); -- 272
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 142, 1); -- 273
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 152, 1); -- 274
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 22, 2); -- 275
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 35, 2); -- 276
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 61, 2); -- 277
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 92, 2); -- 278
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (18, 2, 3, 'Any'); -- 279
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 37, 3); -- 280
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (18, 48, 3, 'Any'); -- 281
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 94, 3); -- 282
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 5, 4); -- 283
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 77, 4); -- 284
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 84, 4); -- 285
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (18, 107, 4); -- 286
-- Duellist
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 12, 1); -- 287
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 42, 1); -- 288
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 52, 1); -- 289
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 135, 1); -- 290
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 28, 2); -- 291
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (19, 48, 2, 'Any'); -- 292
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 50, 2); -- 293
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 111, 2); -- 294
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 5, 3); -- 295
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 41, 3); -- 296
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 45, 3); -- 297
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 112, 3); -- 298
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 27, 4); -- 299
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 89, 4); -- 300
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 106, 4); -- 301
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (19, 140, 4); -- 302
-- Envoy
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 15, 1); -- 302
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (20, 48, 1, 'Nobles'); -- 302
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 107, 1); -- 302
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 147, 1); -- 302
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 10, 2); -- 303
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 24, 2); -- 304
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (20, 48, 2, 'Any'); -- 305
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 122, 2); -- 306
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 22, 3); -- 307
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 37, 3); -- 308
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 61, 3); -- 309
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 120, 3); -- 310
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 19, 4); -- 311
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 29, 4); -- 312
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 93, 4); -- 313
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (20, 118, 4); -- 314
-- Noble
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (21, 48, 1, 'Nobles'); -- 315
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 81, 1); -- 316
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 93, 1); -- 317
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 107, 1); -- 318
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 10, 2); -- 319
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 19, 2); -- 320
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 22, 2); -- 321
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 147, 2); -- 322
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 32, 3); -- 323
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 37, 3); -- 324
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 103, 3); -- 325
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 120, 3); -- 326
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 29, 4); -- 327
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 75, 4); -- 328
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 161, 4); -- 329
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (21, 165, 4); -- 330
-- Servant
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 13, 1); -- 331
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 142, 1); -- 332
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 144, 1); -- 333
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 146, 1); -- 334
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (22, 48, 2, 'Servants'); -- 335
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 125, 2); -- 336
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 152, 2); -- 337
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 166, 2); -- 338
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 46, 3); -- 339
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (22, 109, 3, 'Poison'); -- 340
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 147, 3); -- 341
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 149, 3); -- 342
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (22, 48, 4, 'Any'); -- 343
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 95, 4); -- 344
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 107, 4); -- 345
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (22, 118, 4); -- 346
-- Spy
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 15, 1); -- 347
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 22, 1); -- 348
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 61, 1); -- 349
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 125, 1); -- 350
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (23, 48, 2, 'Any'); -- 351
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 80, 2); -- 352
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 107, 2); -- 353
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 124, 2); -- 354
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 10, 3); -- 355
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 24, 3); -- 356
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 86, 3); -- 357
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 90, 3); -- 358
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 19, 4); -- 359
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 120, 4); -- 360
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 147, 4); -- 361
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (23, 154, 4); -- 362
-- Warden
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 89, 1); -- 363
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 91, 1); -- 364
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 126, 1); -- 365
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 141, 1); -- 366
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 6, 2); -- 367
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (24, 48, 2, 'Servants'); -- 368
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (24, 138, 2, 'Any'); -- 369
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 116, 2); -- 370
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 46, 3); -- 371
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 95, 3); -- 372
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 107, 3); -- 373
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 149, 3); -- 374
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 29, 4); -- 375
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (24, 48, 4, 'Any'); -- 376
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (24, 117, 4, 'Local'); -- 377
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (24, 147, 4); -- 378
-- Bailiff
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 46, 1); -- 379
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 95, 1); -- 380
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 142, 1); -- 381
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 152, 1); -- 382
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 18, 2); -- 383
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 35, 2); -- 384
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 103, 2); -- 385
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 141, 2); -- 386
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 77, 3); -- 387
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 89, 3); -- 388
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 94, 3); -- 389
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 107, 3); -- 390
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 29, 4); -- 391
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 75, 4); -- 392
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 118, 4); -- 393
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (25, 120, 4); -- 394
-- Hedge Witch
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (26, 49, 1); -- 395
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (26, 100, 1); -- 396
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (26, 116, 1); -- 397
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (26, 138, 1, 'Woodlands'); -- 398
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (26, 3, 2); -- 399
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (26, 6, 2); -- 400
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (26, 7, 2, 'Hedgecraft'); -- 401
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (26, 129, 2); -- 402
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (26, 34, 3, 'Herbalist'); -- 403
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (26, 82, 3); -- 404
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (26, 104, 3); -- 405
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (26, 109, 3, 'Disease'); -- 406
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (26, 2, 4, 'Any'); -- 407
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (26, 88, 4, 'Herbalist'); -- 408
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (26, 91, 4); -- 409
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (26, 144, 4); -- 410
-- Herbalist
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (27, 2, 1, 'Taste'); -- 411
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (27, 97, 1); -- 412
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (27, 116, 1); -- 413
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (27, 138, 1, 'Any'); -- 414
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (27, 37, 2); -- 415
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (27, 92, 2); -- 416
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (27, 126, 2); -- 417
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (27, 146, 2); -- 418
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (27, 34, 3, 'Herbalist'); -- 419
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (27, 53, 3); -- 420
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (27, 63, 3); -- 421
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (27, 118, 3); -- 422
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (27, 30, 4); -- 423
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (27, 88, 4, 'Herbalist'); -- 424
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (27, 109, 4, 'Poison'); -- 425
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (27, 117, 4, 'Herbs'); -- 426
-- Hunter
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 63, 1); -- 427
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 116, 1); -- 428
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (28, 138, 1, 'Any'); -- 429
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 155, 1); -- 430
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 1, 2); -- 431
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 50, 2); -- 432
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 67, 2); -- 433
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 85, 2); -- 434
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (28, 2, 3, 'Any'); -- 435
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 36, 3); -- 436
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (28, 51, 3, 'Animals'); -- 437
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 127, 3); -- 438
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (28, 51, 4, 'Monsters'); -- 439
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 114, 4); -- 440
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 132, 4); -- 441
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (28, 150, 4); -- 442
-- Miner
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 116, 1); -- 443
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (29, 138, 1, 'Rocky'); -- 444
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 146, 1); -- 445
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 152, 1); -- 446
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 91, 2); -- 447
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 139, 2); -- 448
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 142, 2); -- 449
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 160, 2); -- 450
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 21, 3); -- 451
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (29, 34, 3, 'Explosives'); -- 452
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 153, 3); -- 453
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 157, 3); -- 454
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 8, 4); -- 455
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 144, 4); -- 456
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 46, 4); -- 457
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (29, 107, 4); -- 458
-- Mystic
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 10, 1); -- 459
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 81, 1); -- 460
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 123, 1); -- 461
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 147, 1); -- 462
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 38, 2); -- 463
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 66, 2); -- 464
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 129, 2); -- 465
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 166, 2); -- 466
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 94, 3); -- 467
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 100, 3); -- 468
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 107, 3); -- 469
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 167, 3); -- 470
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (30, 7, 4, 'Celestial'); -- 471
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 82, 4); -- 472
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 89, 4); -- 473
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (30, 144, 4); -- 474
-- Scout
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 97, 1); -- 475
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 116, 1); -- 476
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 126, 1); -- 477
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (31, 138, 1, 'Any'); -- 478
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 26, 2); -- 479
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 91, 2); -- 480
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 94, 2); -- 481
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 122, 2); -- 482
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (31, 2, 3, 'Sight'); -- 483
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 129, 3); -- 484
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 143, 3); -- 485
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 159, 3); -- 486
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 63, 4); -- 487
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 79, 4); -- 488
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (31, 117, 4, 'Local'); -- 489
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (31, 152, 4); -- 490
-- Villager
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 116, 1); -- 491
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 142, 1); -- 492
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 144, 1); -- 493
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 136, 1); -- 494
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 6, 2); -- 495
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 63, 2); -- 496
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 152, 2); -- 497
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 160, 2); -- 498
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (32, 34, 3, 'Any'); -- 499
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 37, 3); -- 500
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 137, 3); -- 501
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 159, 3); -- 502
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (32, 88, 4, 'Any'); -- 503
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 92, 4); -- 504
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (32, 103, 4); -- 505
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (32, 117, 4, 'Local'); -- 506
-- Bounty Hunter
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 18, 1); -- 507
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 125, 1); -- 508
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 141, 1); -- 509
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 147, 1); -- 510
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 85, 2); -- 511
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 108, 2); -- 512
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 122, 2); -- 513
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 142, 2); -- 514
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 1, 3); -- 515
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 21, 3); -- 516
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 45, 3); -- 517
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 134, 3); -- 518
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 36, 4); -- 519
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (33, 51, 4, 'Bounties'); -- 520
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 63, 4); -- 521
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (33, 150, 4); -- 522
-- Coachman
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 6, 1); -- 523
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 122, 1); -- 524
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 156, 1); -- 525
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 152, 1); -- 526
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 32, 2); -- 527
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 33, 2); -- 528
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 62, 2); -- 529
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 144, 2); -- 530
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 1, 3); -- 531
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 37, 3); -- 532
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (34, 51, 3, 'Outlaws'); -- 533
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 94, 3); -- 534
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (34, 51, 4, 'Beastmen'); -- 535
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 85, 4); -- 536
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 97, 4); -- 537
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (34, 105, 4); -- 538
-- Entertainer
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 10, 1); -- 539
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 90, 1); -- 540
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 103, 1); -- 541
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 147, 1); -- 542
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 31, 2); -- 543
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 76, 2); -- 544
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 127, 2); -- 545
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 156, 2); -- 546
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 15, 3); -- 547
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 86, 3); -- 548
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 99, 3); -- 549
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 107, 3); -- 550
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 37, 4); -- 551
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (35, 48, 4, 'Any'); -- 552
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 122, 4); -- 553
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (35, 126, 4); -- 554
-- Flagellant
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 14, 1); -- 555
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 58, 1); -- 556
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 107, 1); -- 557
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 136, 1); -- 558
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 63, 2); -- 559
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (36, 64, 2, 'Heretics'); -- 560
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 55, 2); -- 561
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 69, 2); -- 562
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 53, 3); -- 563
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 60, 3); -- 564
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 89, 3); -- 565
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 122, 3); -- 566
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 11, 4); -- 567
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (36, 51, 4, 'Heretics'); -- 568
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 59, 4); -- 569
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (36, 68, 4); -- 570
-- Messenger
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 56, 1); -- 571
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 57, 1); -- 572
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 134, 1); -- 573
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 135, 1); -- 574
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 33, 2); -- 575
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 35, 2); -- 576
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 97, 2); -- 577
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 122, 2); -- 578
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 94, 3); -- 579
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 108, 3); -- 580
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 152, 3); -- 581
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 156, 3); -- 582
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 37, 4); -- 583
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (37, 64, 4, 'Outlaws'); -- 584
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 77, 4); -- 585
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (37, 159, 4); -- 586
-- Pedlar
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 54, 1); -- 587
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 56, 1); -- 588
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 116, 1); -- 589
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 153, 1); -- 590
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 37, 2); -- 591
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 97, 2); -- 592
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 122, 2); -- 593
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 142, 2); -- 594
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 95, 3); -- 595
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 146, 3); -- 596
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 166, 3); -- 597
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 159, 3); -- 598
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 24, 4); -- 599
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 144, 4); -- 600
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 147, 4); -- 601
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (38, 152, 4); -- 602
-- Road Warden
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 32, 1); -- 603
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 46, 1); -- 604
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 85, 1); -- 605
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 95, 1); -- 606
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 33, 2); -- 607
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 35, 2); -- 608
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 115, 2); -- 609
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 122, 2); -- 610
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (39, 48, 3, 'Soldiers'); -- 611
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (39, 51, 3, 'Outlaws'); -- 612
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (39, 64, 3, 'Any'); -- 613
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 94, 3); -- 614
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 26, 4); -- 615
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 29, 4); -- 616
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 77, 4); -- 617
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (39, 103, 4); -- 618
-- Witch Hunter
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 32, 1); -- 619
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 89, 1); -- 620
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 107, 1); -- 621
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 110, 1); -- 622
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 45, 2); -- 623
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 85, 2); -- 624
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 122, 2); -- 625
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 125, 2); -- 626
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (40, 51, 3, 'Witches'); -- 627
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 94, 3); -- 628
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 108, 3); -- 629
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 144, 3); -- 630
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 59, 4); -- 631
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 75, 4); -- 632
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 82, 4); -- 633
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (40, 104, 4); -- 634
-- Boatman
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 40, 1); -- 635
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 54, 1); -- 636
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 142, 1); -- 637
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 145, 1); -- 638
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (41, 48, 2, 'Guilder'); -- 639
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 122, 2); -- 640
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 160, 2); -- 641
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 164, 2); -- 642
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 37, 3); -- 643
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 46, 3); -- 644
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 94, 3); -- 645
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 139, 3); -- 646
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 89, 4); -- 647
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 97, 4); -- 648
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 102, 4); -- 649
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (41, 103, 4); -- 650
-- Huffer
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 54, 1); -- 651
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 91, 1); -- 652
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 97, 1); -- 653
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 164, 1); -- 654
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 37, 2); -- 655
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (42, 48, 2, 'Guilder'); -- 656
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 94, 2); -- 657
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 113, 2); -- 658
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (42, 2, 3, 'Sight'); -- 659
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 102, 3); -- 660
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 121, 3); -- 661
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 160, 3); -- 662
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 129, 4); -- 663
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 126, 4); -- 664
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 145, 4); -- 665
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (42, 152, 4); -- 666
-- Riverwarden
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 145, 1); -- 667
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 142, 1); -- 668
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 160, 1); -- 669
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 164, 1); -- 670
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 35, 2); -- 671
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 62, 2); -- 672
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 54, 2); -- 673
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 122, 2); -- 674
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (43, 51, 3, 'Wreckers'); -- 675
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (43, 64, 3, 'Any'); -- 676
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 102, 3); -- 677
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 121, 3); -- 678
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 29, 4); -- 679
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 77, 4); -- 680
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 89, 4); -- 681
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (43, 97, 4); -- 682
-- Riverwoman
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 54, 1); -- 683
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 61, 1); -- 684
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (44, 138, 1, 'Marshes'); -- 685
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 145, 1); -- 686
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (44, 34, 2, 'Boatbuilder'); -- 687
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 116, 2); -- 688
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 142, 2); -- 689
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 164, 2); -- 690
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (44, 117, 3, 'Riverways'); -- 691
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 137, 3); -- 692
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 152, 3); -- 693
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 160, 3); -- 694
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (44, 88, 4, 'Boatbuilder'); -- 695
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 103, 4); -- 696
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 126, 4); -- 697
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (44, 144, 4); -- 698
-- Seaman
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 54, 1); -- 699
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (45, 138, 1, 'Coastal'); -- 700
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 142, 1); -- 701
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 145, 1); -- 702
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 23, 2); -- 703
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 121, 2); -- 704
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 122, 2); -- 705
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 143, 2); -- 706
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 96, 3); -- 707
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 139, 3); -- 708
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 152, 3); -- 709
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 160, 3); -- 710
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 97, 4); -- 711
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 102, 4); -- 712
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 103, 4); -- 713
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (45, 118, 4); -- 714
-- Smuggler
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 35, 1); -- 715
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 54, 1); -- 716
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (46, 138, 1, 'Marshes'); -- 717
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 142, 1); -- 718
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 37, 2); -- 719
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (46, 48, 2, 'Criminals'); -- 720
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 164, 2); -- 721
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 160, 2); -- 722
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 19, 3); -- 723
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (46, 51, 3, 'Riverwardens'); -- 724
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 102, 3); -- 725
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 145, 3); -- 726
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 77, 4); -- 727
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 118, 4); -- 728
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (46, 138, 4, 'Coastal'); -- 729
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (46, 121, 4); -- 730
-- Stevedore
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 40, 1); -- 731
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 142, 1); -- 732
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 146, 1); -- 733
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 160, 1); -- 734
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 35, 2); -- 735
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (47, 48, 2, 'Guilders'); -- 736
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 143, 2); -- 737
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 152, 2); -- 738
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 37, 3); -- 739
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 46, 3); -- 740
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (47, 48, 3, 'Criminals'); -- 741
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 103, 3); -- 742
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 77, 4); -- 743
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 89, 4); -- 744
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 95, 4); -- 745
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (47, 107, 4); -- 746
-- Wrecker
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 18, 1); -- 747
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 35, 1); -- 748
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 54, 1); -- 749
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 142, 1); -- 750
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 56, 2); -- 751
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 116, 2); -- 752
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 145, 2); -- 753
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 155, 2); -- 754
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 40, 3); -- 755
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (48, 48, 3, 'Criminals'); -- 756
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 89, 3); -- 757
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 164, 3); -- 758
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 60, 4); -- 759
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 70, 4); -- 760
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 102, 4); -- 761
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (48, 163, 4); -- 762
-- Bawd
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 10, 1); -- 763
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 4, 1); -- 764
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 15, 1); -- 765
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 61, 1); -- 766
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 5, 2); -- 767
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 22, 2); -- 768
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 35, 2); -- 769
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (49, 109, 2, 'Disease'); -- 770
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 37, 3); -- 771
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 46, 3); -- 772
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (49, 48, 3, 'Any'); -- 773
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 147, 3); -- 774
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 19, 4); -- 775
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 77, 4); -- 776
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 95, 4); -- 777
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (49, 118, 4); -- 778
-- Charlatan
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 20, 1); -- 779
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 39, 1); -- 780
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (50, 48, 1, 'Any'); -- 781
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 81, 1); -- 782
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 15, 2); -- 783
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 35, 2); -- 784
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 49, 2); -- 785
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 124, 2); -- 786
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 10, 3); -- 787
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 24, 3); -- 788
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 37, 3); -- 789
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 107, 3); -- 790
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 61, 4); -- 791
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 86, 4); -- 792
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 94, 4); -- 793
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (50, 147, 4); -- 794
-- Fence
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 4, 1); -- 795
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 20, 1); -- 796
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 37, 1); -- 797
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 61, 1); -- 798
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 35, 2); -- 799
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (51, 48, 2, 'Criminals'); -- 800
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 95, 2); -- 801
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 118, 2); -- 802
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 77, 3); -- 803
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 141, 3); -- 804
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 147, 3); -- 805
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 148, 3); -- 806
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 40, 4); -- 807
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 75, 4); -- 808
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 89, 4); -- 809
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (51, 19, 4); -- 810
-- Grave Robber
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 4, 1); -- 811
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 35, 1); -- 812
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 56, 1); -- 813
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 142, 1); -- 814
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 18, 2); -- 815
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 91, 2); -- 816
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (52, 109, 2, 'Disease'); -- 817
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 160, 2); -- 818
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 107, 3); -- 819
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 139, 3); -- 820
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 152, 3); -- 821
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 157, 3); -- 822
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (52, 51, 4, 'Undead'); -- 823
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 129, 4); -- 824
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 144, 4); -- 825
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (52, 155, 4); -- 826
-- Outlaw
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 26, 1); -- 827
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 35, 1); -- 828
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 116, 1); -- 829
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 56, 1); -- 830
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 40, 2); -- 831
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 85, 2); -- 832
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 141, 2); -- 833
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 155, 2); -- 834
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 105, 3); -- 835
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 115, 3); -- 836
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 89, 3); -- 837
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 159, 3); -- 838
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 36, 4); -- 839
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (53, 51, 4, 'Road Wardens'); -- 840
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 75, 4); -- 841
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (53, 114, 4); -- 842
-- Racketeer
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 35, 1); -- 843
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (54, 48, 1, 'Criminals'); -- 844
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 89, 1); -- 845
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 139, 1); -- 846
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 40, 2); -- 847
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 46, 2); -- 848
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 141, 2); -- 849
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 163, 2); -- 850
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (54, 51, 3, 'Watchmen'); -- 851
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 75, 3); -- 852
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (54, 109, 3, 'Poison'); -- 853
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 114, 3); -- 854
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 29, 4); -- 855
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 77, 4); -- 856
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 59, 4); -- 857
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (54, 165, 4); -- 858
-- Thief
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 4, 1); -- 859
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 35, 1); -- 860
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 56, 1); -- 861
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 141, 1); -- 862
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 18, 2); -- 863
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (55, 48, 2, 'Criminals'); -- 864
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 49, 2); -- 865
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 125, 2); -- 866
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 91, 3); -- 867
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 92, 3); -- 868
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 135, 3); -- 869
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 155, 3); -- 870
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 23, 4); -- 871
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 119, 4); -- 872
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 143, 4); -- 873
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (55, 165, 4); -- 874
-- Witch
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 35, 1); -- 875
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 72, 1); -- 876
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 89, 1); -- 877
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 100, 1); -- 878
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (56, 7, 2, 'Witchery'); -- 879
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 10, 2); -- 880
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 123, 2); -- 881
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 167, 2); -- 882
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 6, 3); -- 883
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 49, 3); -- 884
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 59, 3); -- 885
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 82, 3); -- 886
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 3, 4); -- 887
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 81, 4); -- 888
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 144, 4); -- 889
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (56, 159, 4); -- 890
-- Cavalryman
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 26, 1); -- 891
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 33, 1); -- 892
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 78, 1); -- 893
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 115, 1); -- 894
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (57, 48, 2, 'Soldiers'); -- 895
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 62, 2); -- 896
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 122, 2); -- 897
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 156, 2); -- 898
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 28, 3); -- 899
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 50, 3); -- 900
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (57, 64, 3, 'Any'); -- 901
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 161, 3); -- 902
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 1, 4); -- 903
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 71, 4); -- 904
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 106, 4); -- 905
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (57, 114, 4); -- 906
-- Guard
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 39, 1); -- 907
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (58, 48, 1, 'Servants'); -- 908
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 141, 1); -- 909
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 152, 1); -- 910
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 108, 2); -- 911
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 111, 2); -- 912
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 128, 2); -- 913
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 139, 2); -- 914
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (58, 51, 3, 'Intruders'); -- 915
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 76, 3); -- 916
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 137, 3); -- 917
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 158, 3); -- 918
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 27, 4); -- 919
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 60, 4); -- 920
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 75, 4); -- 921
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (58, 114, 4); -- 922
-- Knight
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (59, 48, 1, 'Any'); -- 923
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 115, 1); -- 924
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 146, 1); -- 925
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 163, 1); -- 926
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 89, 2); -- 927
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 122, 2); -- 928
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 128, 2); -- 929
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 139, 2); -- 930
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (59, 51, 3, 'Any'); -- 931
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 137, 3); -- 932
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 158, 3); -- 933
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 161, 3); -- 934
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 41, 4); -- 935
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 71, 4); -- 936
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 75, 4); -- 937
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (59, 140, 4); -- 938
-- Pit Fighter
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 40, 1); -- 939
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 70, 1); -- 940
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 74, 1); -- 941
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 111, 1); -- 942
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 5, 2); -- 943
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 28, 2); -- 944
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 45, 2); -- 945
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 128, 2); -- 946
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 27, 3); -- 947
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 41, 3); -- 948
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 89, 3); -- 949
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 114, 3); -- 950
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 59, 4); -- 951
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 60, 4); -- 952
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 69, 4); -- 953
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (60, 106, 4); -- 954
-- Protagonist
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 70, 1); -- 955
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 40, 1); -- 956
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 89, 1); -- 957
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 163, 1); -- 958
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 28, 2); -- 959
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 35, 2); -- 960
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 111, 2); -- 961
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 141, 2); -- 962
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 21, 3); -- 963
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 41, 3); -- 964
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 85, 3); -- 965
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 108, 3); -- 966
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 1, 4); -- 967
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 5, 4); -- 968
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 60, 4); -- 969
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (61, 140, 4); -- 970
-- Slayer
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 45, 1); -- 971
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (62, 51, 1, 'Everything'); -- 972
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 58, 1); -- 973
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 130, 1); -- 974
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 63, 2); -- 975
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 69, 2); -- 976
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 89, 2); -- 977
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 111, 2); -- 978
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 5, 3); -- 979
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 60, 3); -- 980
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 108, 3); -- 981
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 114, 3); -- 982
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 27, 4); -- 983
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 59, 4); -- 984
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 139, 4); -- 985
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (62, 160, 4); -- 986
-- Soldier
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 39, 1); -- 987
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 85, 1); -- 988
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 142, 1); -- 989
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 163, 1); -- 990
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 44, 2); -- 991
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (63, 48, 2, 'Soldiers'); -- 992
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 105, 2); -- 993
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 128, 2); -- 994
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 26, 3); -- 995
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 47, 3); -- 996
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 158, 3); -- 997
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 161, 3); -- 998
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 71, 4); -- 999
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 103, 4); -- 1000
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 122, 4); -- 1001
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (63, 137, 4); -- 1002
-- Warrior Priest
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (64, 16, 1, 'Any'); -- 1003
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (64, 48, 1, 'Cultists'); -- 1004
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 107, 1); -- 1005
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 144, 1); -- 1006
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 45, 2); -- 1007
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 71, 2); -- 1008
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (64, 73, 2, 'Any'); -- 1009
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 122, 2); -- 1010
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 26, 3); -- 1011
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 66, 3); -- 1012
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 104, 3); -- 1013
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 137, 3); -- 1014
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (64, 51, 4, 'Any'); -- 1015
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 60, 4); -- 1016
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 65, 4); -- 1017
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (64, 161, 4); -- 1018
-- Butcher
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 69, 1); -- 1019
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 100, 1); -- 1020
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 129, 1); -- 1021
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 142, 1); -- 1022
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (65, 2, 2, 'Taste'); -- 1023
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 3, 2); -- 1024
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (65, 7, 2, 'Lore of the Great Maw'); -- 1025
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 66, 2); -- 1026
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 59, 3); -- 1027
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 123, 3); -- 1028
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 139, 3); -- 1029
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 162, 3); -- 1030
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 38, 4); -- 1031
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 68, 4); -- 1032
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 71, 4); -- 1033
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (65, 82, 4); -- 1034
-- Rhinox Herder
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 56, 1); -- 1035
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 85, 1); -- 1036
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 116, 1); -- 1037
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (66, 138, 1, 'Mountains'); -- 1038
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (66, 51, 2, 'Large Beasts'); -- 1039
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 115, 2); -- 1040
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 137, 2); -- 1041
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 146, 2); -- 1042
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 42, 3); -- 1043
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 110, 3); -- 1044
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 122, 3); -- 1045
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 156, 3); -- 1046
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 22, 4); -- 1047
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 59, 4); -- 1048
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 71, 4); -- 1049
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (66, 140, 4); -- 1050
-- Maneater
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 40, 1); -- 1051
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 89, 1); -- 1052
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 142, 1); -- 1053
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 146, 1); -- 1054
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel, TalentGroup) VALUES (67, 48, 2, 'Slims'); -- 1055
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 105, 2); -- 1056
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 122, 2); -- 1057
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 139, 2); -- 1058
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 1, 3); -- 1059
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 28, 3); -- 1060
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 59, 3); -- 1061
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 63, 3); -- 1062
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 27, 4); -- 1063
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 60, 4); -- 1064
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 106, 4); -- 1065
INSERT INTO CareerTalents (CareerID, TalentID, CareerLevel) VALUES (67, 161, 4); -- 1066


-- RandomTalents
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID, TalentGroup) VALUES (1, 3, 2, 'Any'); -- 1
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (4, 6, 5); -- 2
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (7, 9, 6); -- 3
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (10, 12, 9); -- 4
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (13, 15, 10); -- 5
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (16, 18, 32); -- 6
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID, TalentGroup) VALUES (19, 21, 34, 'Any'); -- 7
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (22, 24, 56); -- 8
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (25, 28, 63); -- 9
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (29, 31, 78); -- 10
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (32, 34, 79); -- 11
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (35, 38, 81); -- 12
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (39, 41, 85); -- 13
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (42, 44, 90); -- 14
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (45, 47, 91); -- 15
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (48, 50, 92); -- 16
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (51, 52, 93); -- 17
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (53, 55, 97); -- 18
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (56, 58, 99); -- 19
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (59, 62, 104); -- 20
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (63, 65, 107); -- 21
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID, TalentGroup) VALUES (66, 68, 109, 'Any'); -- 22
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (69, 71, 118); -- 23
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (72, 74, 126); -- 24
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (75, 78, 129); -- 25
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (79, 81, 143); -- 26
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (82, 84, 146); -- 27
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (85, 87, 147); -- 28
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (88, 91, 148); -- 29
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (92, 94, 159); -- 30
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (95, 97, 160); -- 31
INSERT INTO RandomTalents (InitialPercentage, MaxPercentage, TalentID) VALUES (98, 100, 163); -- 32


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