CREATE DATABASE projekt;
CREATE TABLE Dziesiec (
    cyfra INT,
    bit INT
);

INSERT INTO Dziesiec (cyfra, bit)
VALUES 
(0, 0),
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1);


CREATE TABLE Milion(liczba int,cyfra int, bit int);
INSERT INTO Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra
+ 10000*a5.cyfra + 10000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec
a6 ;

CREATE TABLE GeoEon(
    id_eon INT PRIMARY KEY,
    nazwa_eon VARCHAR(20)
);

CREATE TABLE GeoEra(
    id_era INT PRIMARY KEY,
    nazwa_era VARCHAR(20),
    id_eon INT
);


CREATE TABLE GeoOkres(
    id_okres INT PRIMARY KEY,
    nazwa_okres VARCHAR(30),
    id_era INT
);

CREATE TABLE GeoEpoka(
    id_epoka INT PRIMARY KEY,
    nazwa_epoka VARCHAR(20),
    id_okres INT
);


CREATE TABLE GeoPietro(
    id_pietro INT PRIMARY KEY,
    nazwa_pietro VARCHAR(20),
    id_epoka INT
);




ALTER TABLE GeoEra ADD FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon);
ALTER TABLE GeoOkres ADD FOREIGN KEY (id_era) REFERENCES GeoEra(id_era);
ALTER TABLE GeoEpoka ADD FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres);
ALTER TABLE GeoPietro ADD FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka);





INSERT INTO GeoEon VALUES(1, 'Fanerozoik');
SELECT * FROM GeoEon;


INSERT INTO GeoEra VALUES(1, 'Paleozoik', 1);
INSERT INTO GeoEra VALUES(2, 'Mezozoik', 1);
INSERT INTO GeoEra VALUES(3, 'Kenozoik', 1);
SELECT * FROM GeoEra;


INSERT INTO GeoOkres VALUES(1, 'Dewon',1);
INSERT INTO GeoOkres VALUES(2, 'Karbon',1);
INSERT INTO GeoOkres VALUES(3, 'Perm',1);
INSERT INTO GeoOkres VALUES(4, 'Trias',2);
INSERT INTO GeoOkres VALUES(5, 'Jura',2);
INSERT INTO GeoOkres VALUES(6, 'Kreda',2);
INSERT INTO GeoOkres VALUES(7, 'Trzeciorzad - Palogen',3);
INSERT INTO GeoOkres VALUES(8, 'Trzeciorzad - Neogen',3);
INSERT INTO GeoOkres VALUES(9, 'Czwartorzad',3);
SELECT * FROM GeoOkres;

INSERT INTO GeoEpoka VALUES(1, 'Dolny', 1);
INSERT INTO GeoEpoka VALUES(2, 'Srodkowy', 1);
INSERT INTO GeoEpoka VALUES(3, 'Gorny', 1);
INSERT INTO GeoEpoka VALUES(4, 'Dolny', 2);
INSERT INTO GeoEpoka VALUES(5, 'Gorny', 2);
INSERT INTO GeoEpoka VALUES(6, 'Dolny', 3);
INSERT INTO GeoEpoka VALUES(7, 'Gorny', 3);
INSERT INTO GeoEpoka VALUES(8, 'Dolna', 4);
INSERT INTO GeoEpoka VALUES(9, 'Srodkowa', 4);
INSERT INTO GeoEpoka VALUES(10, 'Gorna', 4);
INSERT INTO GeoEpoka VALUES(11, 'Dolna', 5);
INSERT INTO GeoEpoka VALUES(12, 'Srodkowa', 5);
INSERT INTO GeoEpoka VALUES(13, 'Gorna', 5);
INSERT INTO GeoEpoka VALUES(14, 'Dolna', 6);
INSERT INTO GeoEpoka VALUES(15, 'Gorna', 6);
INSERT INTO GeoEpoka VALUES(16, 'Paleocen', 7);
INSERT INTO GeoEpoka VALUES(17, 'Eocen', 7);
INSERT INTO GeoEpoka VALUES(18, 'Oligocen', 7);
INSERT INTO GeoEpoka VALUES(19, 'Miocen', 8);
INSERT INTO GeoEpoka VALUES(20, 'Pliocen', 8);
INSERT INTO GeoEpoka VALUES(21, 'Plejstocen', 9);
INSERT INTO GeoEpoka VALUES(22, 'Halocen', 9);
SELECT * FROM GeoEpoka;




 
INSERT INTO GeoPietro VALUES(1,'Lochkow',1);
INSERT INTO GeoPietro VALUES(2,'Prag',1);
INSERT INTO GeoPietro VALUES(3,'Ems',1);
INSERT INTO GeoPietro VALUES(4,'Eifel',2);
INSERT INTO GeoPietro VALUES(5,'Zywet',2);
INSERT INTO GeoPietro VALUES(6,'Fran',3);
INSERT INTO GeoPietro VALUES(7,'Famen',3);

INSERT INTO GeoPietro VALUES(8,'Assel',6);
INSERT INTO GeoPietro VALUES(9,'Sakmar',6);
INSERT INTO GeoPietro VALUES(10,'Artinsk',6);
INSERT INTO GeoPietro VALUES(11,'Kungur',6);
INSERT INTO GeoPietro VALUES(12,'Ufa',7);
INSERT INTO GeoPietro VALUES(13,'Kazan',7);
INSERT INTO GeoPietro VALUES(14,'Tatar',7);

INSERT INTO GeoPietro VALUES(15,'Ind',8);
INSERT INTO GeoPietro VALUES(16,'Olenek',8);
INSERT INTO GeoPietro VALUES(17,'Anizyk',9);
INSERT INTO GeoPietro VALUES(18,'Ladyn',9);
INSERT INTO GeoPietro VALUES(19,'Karnik',10);
INSERT INTO GeoPietro VALUES(20,'Noryk',10);
INSERT INTO GeoPietro VALUES(21,'Retyk',10);
INSERT INTO GeoPietro VALUES(22,'Hetang',11);
INSERT INTO GeoPietro VALUES(23,'Synemur',11);
INSERT INTO GeoPietro VALUES(24,'Pliensbach',11);
INSERT INTO GeoPietro VALUES(25,'Toark',11);
INSERT INTO GeoPietro VALUES(26,'Aalen',12);
INSERT INTO GeoPietro VALUES(27,'Bajos',12);
INSERT INTO GeoPietro VALUES(28,'Baton',12);
INSERT INTO GeoPietro VALUES(29,'Kelowej',12);
INSERT INTO GeoPietro VALUES(30,'Oksford',13);
INSERT INTO GeoPietro VALUES(31,'Kimeryd',13);
INSERT INTO GeoPietro VALUES(32,'Tyton',13);
INSERT INTO GeoPietro VALUES(33,'Berias',14);
INSERT INTO GeoPietro VALUES(34,'Walanzyn',14);
INSERT INTO GeoPietro VALUES(35,'Hoteryw',14);
INSERT INTO GeoPietro VALUES(36,'Barrem',14);
INSERT INTO GeoPietro VALUES(37,'Apt',14);
INSERT INTO GeoPietro VALUES(38,'Alb',14);
INSERT INTO GeoPietro VALUES(39,'Cenoman',15);
INSERT INTO GeoPietro VALUES(40,'Turon',15);
INSERT INTO GeoPietro VALUES(41,'Koniak',15);
INSERT INTO GeoPietro VALUES(42,'Santon',15);
INSERT INTO GeoPietro VALUES(43,'Kampan',15);
INSERT INTO GeoPietro VALUES(44,'Mastrycht',15);
INSERT INTO GeoPietro VALUES(45,'Dan',16);
INSERT INTO GeoPietro VALUES(46,'Zeland',16);
INSERT INTO GeoPietro VALUES(47,'Tanet',16);
INSERT INTO GeoPietro VALUES(48,'Iprez',17);
INSERT INTO GeoPietro VALUES(49,'Lutet',17);
INSERT INTO GeoPietro VALUES(50,'Barton',17);
INSERT INTO GeoPietro VALUES(51,'Priabon',17);
INSERT INTO GeoPietro VALUES(52,'Rupel',18);
INSERT INTO GeoPietro VALUES(53,'Szat',18);
INSERT INTO GeoPietro VALUES(54,'Akwitan',19);
INSERT INTO GeoPietro VALUES(55,'Burdyga',19);
INSERT INTO GeoPietro VALUES(56,'Lang',19);
INSERT INTO GeoPietro VALUES(57,'Serrawal',19);
INSERT INTO GeoPietro VALUES(58,'Torton',19);
INSERT INTO GeoPietro VALUES(59,'Mesyn',19);
INSERT INTO GeoPietro VALUES(60,'Zankl',20);
INSERT INTO GeoPietro VALUES(61,'Piacent',20);
INSERT INTO GeoPietro VALUES(62,'Gelas',20);

SELECT * FROM GeoPietro;


SELECT p.id_pietro, p.nazwa_pietro, ep.id_epoka,
ep.nazwa_epoka, o.id_okres, o.nazwa_okres, er.id_era,
er.nazwa_era, eo.id_eon, eo.nazwa_eon
INTO ZdGeoTabela
FROM GeoPietro p
JOIN GeoEpoka ep ON ep.id_epoka = p.id_epoka
JOIN GeoOkres o ON o.id_okres = ep.id_okres
JOIN GeoEra er ON er.id_era = o.id_era
JOIN GeoEon eo ON eo.id_eon = er.id_eon;
ALTER TABLE ZdGeoTabela ADD PRIMARY KEY (id_pietro);
SELECT * FROM ZdGeoTabela;

--1
SET STATISTICS TIME ON SELECT COUNT(*) 
FROM Milion 
INNER JOIN ZdGeoTabela 
ON (Milion.liczba % 68 = ZdGeoTabela.id_pietro);
SET STATISTICS TIME OFF


--2
SET STATISTICS TIME ON
SELECT COUNT(*) FROM Milion 
INNER JOIN GeoPietro ON (Milion.liczba % 68=GeoPietro.id_pietro)
INNER JOIN GeoEpoka ON GeoPietro.id_epoka=GeoEpoka.id_epoka
INNER JOIN GeoOkres ON GeoEpoka.id_okres= GeoOkres.id_okres
INNER JOIN GeoEra ON GeoEra.id_era=GeoOkres.id_era
INNER JOIN GeoEon ON GeoEon.id_eon=GeoEra.id_eon
SET STATISTICS TIME OFF


--3
SET STATISTICS TIME ON
SELECT COUNT(*) 
FROM Milion 
WHERE Milion.liczba % 68 = 
(SELECT id_pietro FROM ZdGeoTabela WHERE Milion.liczba % 68 = id_pietro);
SET STATISTICS TIME OFF

--4
SET STATISTICS TIME ON
SELECT COUNT(*)
FROM Milion
WHERE Milion.liczba % 68 IN
  (SELECT GeoPietro.id_pietro FROM GeoPietro
   INNER JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka
   INNER JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
   INNER JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era
   INNER JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon);
SET STATISTICS TIME OFF




CREATE INDEX idxEon ON GeoEon(id_eon);
CREATE INDEX idxEra ON GeoEra(id_era, id_eon);
CREATE INDEX idxOkres ON GeoOkres(id_okres, id_era);
CREATE INDEX idxEpoka ON GeoEpoka(id_epoka, id_okres);
CREATE INDEX idxPietro ON GeoPietro(id_pietro, id_epoka);
CREATE INDEX idxLiczba ON Milion(liczba);
CREATE INDEX idxZdGeoTabela ON ZdGeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);