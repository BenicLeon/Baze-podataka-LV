CREATE TABLE _grupeAI4291 (
id_grupe VARCHAR(20),
oznaka_grupe VARCHAR(20),
smjer VARCHAR(50),
broj_studenata INT,
CONSTRAINT id_grupe_AI4291 PRIMARY KEY (id_grupe),
CONSTRAINT jedinstveni_kljuc_AI4291 UNIQUE(oznaka_grupe)
);

CREATE TABLE _studentAI4291 (
br_indeksa char(10),
ime VARCHAR(20),
prezime VARCHAR(20),
grupa VARCHAR(20),
godina_upisa INT,
godina_studija CHAR(1),
CONSTRAINT br_indeksaAI4291 PRIMARY KEY(br_indeksa),
CONSTRAINT grupa_fk_AI4291 FOREIGN KEY(grupa) REFERENCES _grupeAI4291(id_grupe)
);

ALTER TABLE _studentAI4291 ADD prosjek DEC(2,1);

ALTER TABLE _studentAI4291 ADD CONSTRAINT prosjek_AI4291 CHECK(prosjek>1); 

ALTER TABLE _studentAI4291 DROP COLUMN godina_studija;


CREATE TABLE tel_imenikAI4291 (
broj_telefona VARCHAR(15),
ime VARCHAR(20),
prezime VARCHAR(20),
email VARCHAR(20),
adresa VARCHAR(50),
datum_unosa DATETIME NOT NULL,
CONSTRAINT pk_telefon_prezimeAI4291 PRIMARY KEY (broj_telefona,prezime)
);

CREATE INDEX idx1_AI4291 ON _studentAI4291(prosjek DESC);

CREATE INDEX idx2_AI4291 ON tel_imenikAI4291(broj_telefona);

CREATE INDEX idx3_AI4291 ON tel_imenikAI4291(datum_unosa);
