 --1
--CREATE DATABASE firma2;
--GO
--2
--CREATE SCHEMA ksiegowosc; 
--4

--Tabela z danymi pracowników
CREATE TABLE ksiegowosc.pracownicy (
    id_pracownika INT PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    adres VARCHAR(100),
    telefon VARCHAR(20)
);

--Tabela z danymi  o przepracowanych godzinach
CREATE TABLE ksiegowosc.godziny (
    id_godziny INT PRIMARY KEY,
    data DATE NOT NULL,
    liczba_godzin INT NOT NULL,
    id_pracownika INT NOT NULL,
    FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika)
) ;

--Tabela z danymi o pensjach pracowników
CREATE TABLE ksiegowosc.pensja (
    id_pensji INT PRIMARY KEY,
    stanowisko VARCHAR(50),
    kwota DECIMAL(10, 2) NOT NULL
) ;

--Tabela z danymi o premiach dla pracowników
CREATE TABLE ksiegowosc.premia (
    id_premii INT PRIMARY KEY,
    rodzaj VARCHAR(50),
    kwota DECIMAL(10, 2) NOT NULL
) ;

--Tabela z danymi o wynagrodzeniach pracowników
CREATE TABLE ksiegowosc.wynagrodzenie (
    id_wynagrodzenia INT PRIMARY KEY,
    data DATE NOT NULL,
    id_pracownika INT NOT NULL,
    id_godziny INT NOT NULL,
    id_pensji INT NOT NULL,
    id_premii INT NOT NULL,
    FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika),
    FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny),
    FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji),
    FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia(id_premii)
);

--5
INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) VALUES
(1, 'Dawid', 'Kowalski', 'ul. S³oneczna 1, Sopot', '644567890'),
(2, 'Eliza', 'Nowakowska', 'ul. Wolna 5, Lublin', '083654321'),
(3, 'Tomasz', 'Wilk', 'ul. Leœna 10, Wroc³aw', '267433455'),
(4, 'Iga', 'Sadowska', 'ul. Kwiatowa 2, Poznañ', '567894234'),
(5, 'Tomasz', 'Lis', 'ul. Parkowa 8, Wroc³aw', '230901345'),
(6, 'Magdalena', 'Kwiatkowska', 'ul. Leœna 15, Katowice', '19123456'),
(7, 'Grzegorz', 'Nowicki', 'ul. Polna 12, £ódŸ', '890123467'),
(8, 'Katarzyna', 'D¹browska', 'ul. Ogrodowa 7, Gdynia', '901234568'),
(9, 'Adam', 'Wojski', 'ul. Piaskowa 4, Lublin', '012345789'),
(10, 'Anna', 'Kamiñska', 'ul. Rybacka 6, Szczecin', '345678902');


INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) VALUES 
(1, '2024-04-01', 8, 1),
(2, '2024-04-01', 6, 2),
(3, '2024-04-02', 2, 3),
(4, '2024-04-02', 10, 4),
(5, '2024-04-03', 6, 5),
(6, '2024-04-03', 7, 6),
(7, '2024-04-04', 9, 7),
(8, '2024-04-04', 8, 8),
(9, '2024-04-05', 8, 9),
(10, '2024-04-05', 7, 10);



INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) VALUES 
(1, 'Ksiêgowy', 5000),
(2, 'Doradca finansowy', 6000),
(3, 'Kierownik ds. Finansowych', 8000),
(4, 'Analityk Finansowy', 7000),
(5, 'Pracownik Ksiêgowoœci', 4500),
(6, 'Doradca Podatkowy', 7500),
(7, 'Auditor', 8500),
(8, 'Kontroler Finansowy', 7800),
(9, 'Analityk Ryzyka', 7200),
(10, 'Ksiêgowy', 6800);
 
 INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) VALUES 
(1, 'Premia œwi¹teczna', 1000),
(2, 'Premia kwartalna', 500),
(3, 'Premia za wyniki', 750),
(4, 'Premia za sta¿ pracy', 300),
(5, 'Premia œwi¹teczna', 400),
(6, 'Premia motywacyjna', 600),
(7, 'Premia za dobre wyniki sprzeda¿owe', 850),
(8, 'Premia za osi¹gniêcia', 900),
(9, 'Premia za najlepsz¹ sprzeda¿', 1000),
(10, 'Premia za wyniki ', 550);

INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES
(1, '2024-04-01', 1, 1, 1, 1),
(2, '2024-04-01', 2, 2, 2, 2),
(3, '2024-04-02', 3, 3, 3, 3),
(4, '2024-04-02', 4, 4, 4, 4),
(5, '2024-04-03', 5, 5, 5, 5),
(6, '2024-04-03', 6, 6, 6, 6),
(7, '2024-04-04', 7, 7, 7, 7),
(8, '2024-04-04', 8, 8, 8, 8),
(9, '2024-04-05', 9, 9, 9, 9),
(10, '2024-04-05', 10, 10, 10, 10);

