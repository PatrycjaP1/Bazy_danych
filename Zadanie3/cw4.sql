--1
--CREATE DATABASE firma;
--GO
--2
--CREATE SCHEMA rozliczenia;
--GO
--3
CREATE TABLE rozliczenia.pracownicy(
id_pracownika INTEGER NOT NULL PRIMARY KEY,
imie NVARCHAR(50) NOT NULL,
nazwisko VARCHAR(50),
adres VARCHAR(100),
telefon VARCHAR(15)
);
CREATE TABLE rozliczenia.godziny(
id_godziny INTEGER NOT NULL PRIMARY KEY,
data DATE NOT NULL,
liczba_godzin INTEGER NOT NULL,
id_pracownika INTEGER NOT NULL,
);


CREATE TABLE rozliczenia.pensje
id_pensji INTEGER NOT NULL PRIMARY KEY,
stanowisko VARCHAR(50) NOT NULL,
kwota DECIMAL(10,2) NOT NULL,
id_premii INTEGER NOT NULL,
);


CREATE TABLE rozliczenia.premie(
id_premii INTEGER NOT NULL PRIMARY KEY,
rodzaj VARCHAR(50) ,
kwota DECIMAL(10,2) NOT NULL
);

ALTER TABLE rozliczenia.pensje
ADD CONSTRAINT FK_pensje_premie FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);


ALTER TABLE rozliczenia.godziny
ADD CONSTRAINT FK_pracownicy_godziny FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);
--4
INSERT INTO rozliczenia.pracownicy  VALUES 
(1, 'Olaf', 'Nowacki', 'ul. Wiejska 1, Warszawa', '123456789'),
(2, 'Anita', 'Nowak', 'ul. Fio�kowa 5, Krak�w', '987654321'),
(3, 'Piotr', 'Nowicki', 'ul. Kwiatowa 10, Gda�sk', '456123789'),
(4, 'Iwona', 'Lis', 'ul. Le�na 3, Pozna�', '321654987'),
(5, 'Piotr', 'Zieli�ski', 'ul. Polna 8, Wroc�aw', '654987321'),
(6, 'Ewa', 'W�jcik', 'ul. S�oneczna 15, ��d�', '789654123'),
(7, 'Tomasz', 'Kaczmarek', 'ul. Morska 22, Szczecin', '159357246'),
(8, 'Karolina', 'D�browska', 'ul. Zielona 7, Lublin', '369258147'),
(9, 'Mateusz', 'Wo�niak', 'ul. Jagodowa 12, Katowice', '852741963'),
(10, 'Aleksandra', 'Kubiak', 'ul. G�rna 4, Bia�ystok', '741852963');


INSERT INTO rozliczenia.godziny VALUES 
(1, '2024-04-01', 8, 1),
(2, '2024-04-02', 7, 2),
(3, '2024-04-03', 9, 3),
(4, '2024-04-04', 8, 4),
(5, '2024-04-05', 7, 5),
(6, '2024-04-06', 8, 6),
(7, '2024-04-07', 9, 7),
(8, '2024-04-08', 7, 8),
(9, '2024-04-09', 8, 9),
(10, '2024-04-10', 7, 10);

INSERT INTO rozliczenia.pensje VALUES 
(1, 'Kierownik', 5000.00, 1),
(2, 'Specjalista', 4000.00, 2),
(3, 'Asystent', 3500.00, 3),
(4, 'Technik', 3000.00, 4),
(5, 'Ksi�gowy', 4500.00, 5),
(6, 'Sprz�taczka', 2500.00, 6),
(7, 'Pracownik produkcji', 3200.00, 7),
(8, 'Analityk', 4800.00, 8),
(9, 'Handlowiec', 4200.00, 9),
(10, 'Recepcjonista', 3800.00, 10);

INSERT INTO rozliczenia.premie VALUES 
(1, 'Premia kwartalna', 1000.00),
(2, 'Premia roczna', 2000.00),
(3, 'Premia za wyniki', 1500.00),
(4, 'Premia uznaniowa', 1200.00),
(5, 'Premia �wi�teczna', 800.00),
(6, 'Premia motywacyjna', 1300.00),
(7, 'Premia jubileuszowa', 2500.00),
(8, 'Premia specjalna', 1800.00),
(9, 'Premia za sta�', 900.00),
(10, 'Premia za dodatkow� prac�', 1100.00);


--5
SELECT nazwisko, adres FROM rozliczenia.pracownicy;

--6
SELECT DATEPART(WEEKDAY, data) AS dzien_tygodnia, DATEPART(MONTH, data) AS miesiac FROM rozliczenia.godziny;

--7
ALTER TABLE rozliczenia.pensje
ADD kwota_netto DECIMAL(10,2);

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';




UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto - (kwota_brutto * 0.20); 
