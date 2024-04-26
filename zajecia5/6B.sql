--a

ALTER TABLE ksiegowosc.pracownicy
ADD nowy_tel VARCHAR(20);

UPDATE ksiegowosc.pracownicy
SET nowy_tel = CONCAT('(+48)', telefon);

--b
UPDATE ksiegowosc.pracownicy
SET nowy_tel = CONCAT('(+48) ', 
                           SUBSTRING(telefon, 1, 3), '-', 
                           SUBSTRING(telefon, 4, 3), '-', 
                           SUBSTRING(telefon, 7, 3)); 

--c
SELECT  TOP 1 UPPER(nazwisko) AS NAZWISKO_NAJDLUZSZE
FROM ksiegowosc.pracownicy
ORDER BY LEN(nazwisko) DESC;

--d
SELECT p.id_pracownika, p.imie, p.nazwisko, p.adres, p.telefon, 
       HASHBYTES('MD5', CONVERT(VARCHAR(30), ps.kwota)) AS pensja_md5
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja ps ON w.id_pensji = ps.id_pensji;


--f

SELECT p.imie, p.nazwisko, pe.kwota AS pensja, pr.kwota AS premia
FROM ksiegowosc.pracownicy p
LEFT JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika = p.id_pracownika
LEFT JOIN ksiegowosc.pensja pe ON pe.id_pensji = w.id_pensji
LEFT JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii;



--g

SELECT CONCAT('Pracownik ', p.imie, ' ', p.nazwisko, ', w dniu ', CONVERT(VARCHAR, g.data, 104), 
              ' otrzyma³ pensjê ca³kowit¹ na kwotê ', (pe.kwota + pr.kwota), ' z³, gdzie wynagrodzenie zasadnicze wynosi³o: ', pe.kwota, ' z³, premia: ', 
              pr.kwota, ' z³, nadgodziny: ', 
              CASE 
                  WHEN g.liczba_godzin > 8 THEN (g.liczba_godzin - 8)
                  ELSE 0
              END, ' godz.') AS raport
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.godziny g ON g.id_godziny = w.id_godziny
JOIN ksiegowosc.pensja pe ON pe.id_pensji = w.id_pensji
JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii;
