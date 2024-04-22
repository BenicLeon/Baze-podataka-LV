Zadatak 1. (baza podataka 'stuslu')
Ispisati inicijale te godinu rođenja studenata iz tablice 'student'. Ispisati sve studente i njihove podatke te ih posložiti po starosti počevši od najstarijeg prema najmlađem. 
Ispisati ime i prezime najstarijeg ženskog studenta.

SELECT DISTINCT SUBSTRING (ime_stud, 1,1) + SUBSTRING (prez_stud,1,1) AS inicijali, YEAR(dat_rod) FROM student;
SELECT * FROM student ORDER BY dat_rod ASC;
SELECT ime_stud, prez_stud FROM student  WHERE dat_rod=(SELECT MIN(dat_rod) FROM student WHERE spol='Ž');


Zadatak 2. (baza podataka 'stuslu')
Ispisati ukupni broj studenata iz tablice student. Ispisati iz koliko različitih mjesta dolaze studenti fakulteta. (DISTINCT ne računa dva puta isto mjesto. Zato smo trebali staviti kod pbr_preb.)

SELECT COUNT (mbr_stud) FROM stuslu.student;
SELECT COUNT (distinct pbr_preb) FROM stuslu.student; 


Zadatak 3. (baza podataka 'stuslu')
Ispisati prosječnu ocjenu svih položenih predmeta u tablici 'ispit.'

SELECT AVG(ocjena) AS ocjena FROM ispit WHERE ocjena>1;



Zadatak 4. (baza podataka 'stuslu')
Ispisati ime i prezime i prosječnu ocjenu svih uspješno položenih ispita za svakog pojedinog studenta, posloženo od najveće do najmanje prosječne ocjene. 
Ispisati matični broj studenata koji imaju prosječnu ocjenu položenih ispita veću od 2.5

SELECT ime_stud, prez_stud, AVG(ispit.ocjena)
FROM student, ispit 
WHERE stuslu.student.mbr_stud=stuslu.ispit.mbr_stud AND ispit.ocjena > 1 
GROUP BY ime_stud, prez_stud ORDER BY AVG(ispit.ocjena) DESC;

SELECT mbr_stud, AVG(ispit.ocjena) FROM stuslu.ispit WHERE ocjena > 1 GROUP BY mbr_stud HAVING AVG(ocjena)>2.5;


Zadatak 5. (baza podataka 'stuslu')
Kreirati pogled koji ce imati atribute slične kao u tablici ispit, ali će umjesto matičnog broja studenta imati ime i prezime studenta, a umjesto šifre predmeta – naziv predmeta.


CREATE VIEW student1994 AS SELECT ime_stud, prez_stud, naz_pred, mbr_nstvnk, dat_ispit, ispit.ocjena 
FROM stuslu.student, stuslu.ispit, stuslu.predmet 
WHERE stuslu.student.mbr_stud = stuslu.ispit.mbr_stud and stuslu.predmet.sif_pred = stuslu.ispit.sif_pred

SELECT * FROM student1994;
