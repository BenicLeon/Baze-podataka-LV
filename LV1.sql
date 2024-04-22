CREATE TABLE racunalo4291 (
inv_broj SMALLINT,
tip VARCHAR(20),
ram SMALLINT,
hdd SMALLINT,
monitor SMALLINT,
mis VARCHAR(20),
tipkovnica VARCHAR(20),
mreza CHAR(2) DEFAULT 'DA',
modem CHAR(2) DEFAULT 'DA',
grafika VARCHAR(20)
);

CREATE TABLE smartphoneV (
imei VARCHAR(20) PRIMARY KEY,
proizvodac VARCHAR(50),
model VARCHAR(50),
memorija INT,
procesor INT,
ekran DECIMAL(5,2),
OS VARCHAR(20),
ime VARCHAR(20),
prezime VARCHAR(20)
);


CREATE TABLE automobilAI4291 (
registracija VARCHAR(10) PRIMARY KEY,
marka VARCHAR(20),
godina INT,
boja VARCHAR(20),
broj_sasije VARCHAR(50)
);


CREATE TABLE djelatnik4291 (
matbr INT PRIMARY KEY,
ime VARCHAR(20),
prezime VARCHAR(20)
);

CREATE TABLE projekt4291 (
oznaka VARCHAR(50) PRIMARY KEY,
naziv VARCHAR(50)
);

CREATE TABLE RadiNa4291 (
matbr INT,
oznaka VARCHAR(50),
broj_dana INT
);
