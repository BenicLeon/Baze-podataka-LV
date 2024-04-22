1. Kreirati korisničku funkciju (user function), spremljenu proceduru (stored procedure) i okidač (trigger) koji će uzimati karakterni parametar i okretati ga 
naopako, npr.:
ulazni parametar: "ivan" -> izlazni parametar: "navi".
Ukoliko je primljeni podatak palindrom (riječ koja se čita isto unazad kao i od naprijed, npr. „Ana“, „kapak“ itd.) - ispiše se tekst „palindrom“. Ukoliko je 
unesena riječa duža od 30 znakova – ispiše se tekst „Ulazna riječ je predugačka, maksimalan broj znakova je 30“.
Cilj zadatka je pokazati na istom primjeru razlike/sličnosti između funkcije i procedure, te pokazati upotrebu triggera.
Objekte definirati na slijedeći način:
- funkcija prima karakterni podatak i vraća opisan izlaz
- procedura prima karakterni podatak i ispisuje opisan izlaz (ne vraća vrijednost)
- trigger se definira tako da se izvrši umjesto insert naredbe na tablici računi - naopako upiše ime kupca pri izvršavanju insert naredbe na tablicu (ne provjerava se dužina riječi niti da li je riječ palindrom).
Isprobati rad sva tri objekta.

1. FUNKCIJA

CREATE FUNCTION palindrom4322 (@tina NVARCHAR(100))
RETURNS NVARCHAR(30)
BEGIN
	DECLARE @okrenuto nvarchar(30)	
	IF len(@tina)>30
	SET @okrenuto='rijec je predugacka'
	ELSE
	SET @okrenuto=reverse(@tina)
RETURN @okrenuto;
END

SELECT student.palindrom4322 ('anavolimilovana');
SELECT student.palindrom4322 ('kapak');
SELECT student.palindrom4322 ('Ova rijec ce biti predugacka jer ima preko 30 slova!');


create table tablica(
ime nvarchar(30) primary key
)

insert into tablica(ime) values ('Ivo')

select * from tablica

select student.palindrom4322(ime) from tablica


2. PROCEDURA

CREATE PROCEDURE palindrom4333 (@mynvarchar21 NVARCHAR(100)) AS 

IF len(@mynvarchar21)>30
PRINT 'rijec ce biti predugacka'
ELSE 
PRINT reverse (@mynvarchar21)
RETURN (0)-- procedura ce biti ispravna i bez ove linije

exec palindrom4333 'ivan'


3. TRIGER

CREATE TRIGGER palindrom13
ON tablica
instead of INSERT
AS
DECLARE @ime NVARCHAR(30);
SELECT @ime=ime
FROM inserted;
INSERT INTO tablica VALUES (reverse(@ime))


insert into tablica values ('Ivan')

select * from tablica
