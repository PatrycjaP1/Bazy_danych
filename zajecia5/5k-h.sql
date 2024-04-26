--k

SELECT stanowisko, COUNT(*) AS liczba_pracownikow
FROM ksiegowosc.pensja
GROUP BY stanowisko;

--l
SELECT 
    AVG(kwota) AS srednia_placa,
    MIN(kwota) AS minimalna_placa,
    MAX(kwota) AS maksymalna_placa
FROM ksiegowosc.pensja
WHERE stanowisko = 'Ksiêgowy';

--m
SELECT
SUM(p.kwota) + SUM(pr.kwota) AS suma_wynagrodzen
FROM ksiegowosc.pensja p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pensji=p.id_pensji
JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii

--f
SELECT p.stanowisko,
SUM(p.kwota) + SUM(pr.kwota) AS suma_wynagrodzen
FROM ksiegowosc.pensja p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pensji=p.id_pensji
JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii
GROUP BY p.stanowisko
--g
SELECT 
    p.stanowisko,
    COUNT(*) AS liczba_premii
FROM  ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
JOIN ksiegowosc.pensja p ON w.id_pensji = p.id_pensji
GROUP BY 
    p.stanowisko;
--h
DELETE p
FROM ksiegowosc.pracownicy p
JOIN  ksiegowosc.wynagrodzenie w ON w.id_pracownika = p.id_pracownika
JOIN ksiegowosc.pensja pn ON pn.id_pensji = w.id_pensji
WHERE 
    pn.kwota < 1200;



