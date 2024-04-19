--a
--SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy
--b 
/*
SELECT p.id_pracownika FROM ksiegowosc.pracownicy AS p 
JOIN ksiegowosc.pensja AS pe on p.id_pracownika=pe.id_pensji
WHERE pe.kwota >1000 
*/
--c
/*
SELECT p.id_pracownika
FROM ksiegowosc.pracownicy AS p
JOIN ksiegowosc.pensja AS pen ON p.id_pracownika = pen.id_pensji
JOIN ksiegowosc.premia AS pr ON p.id_pracownika = pr.id_premii
WHERE pr.id_premii IS NULL AND pen.kwota > 2000;
*/

--d
/*
SELECT * FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';
*/

--e
/*
SELECT * FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';
*/
--f
/*
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy AS p
JOIN ksiegowosc.godziny AS g ON p.id_pracownika = g.id_pracownika
WHERE g.liczba_godzin * 22 > 160;
*/
--g
/*
SELECT imie, nazwisko
FROM ksiegowosc.pracownicy AS p
JOIN ksiegowosc.pensja AS pe ON p.id_pracownika = pe.id_pensji
WHERE pe.kwota BETWEEN 1500 AND 3000;
*/
--h
/*
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy AS p
JOIN ksiegowosc.godziny AS g ON p.id_pracownika = g.id_pracownika
JOIN ksiegowosc.wynagrodzenie AS w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.premia AS pr ON p.id_pracownika = pr.id_premii
WHERE (g.liczba_godzin  * 22> 160)  AND pr.id_premii IS NULL;
*/
--i
/*
SELECT p.imie, p.nazwisko, pe.kwota AS pensja
FROM ksiegowosc.pracownicy AS p
JOIN ksiegowosc.pensja AS pe ON p.id_pracownika = pe.id_pensji
ORDER BY pe.kwota;
*/
--j
SELECT p.imie, p.nazwisko, pe.kwota AS pensja, pr.kwota AS premia
FROM ksiegowosc.pracownicy AS p
JOIN ksiegowosc.pensja AS pe ON p.id_pracownika = pe.id_pensji
JOIN ksiegowosc.premia AS pr ON p.id_pracownika = pr.id_premii
ORDER BY pe.kwota DESC, pr.kwota DESC;


 

