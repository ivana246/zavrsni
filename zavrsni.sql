drop database if exists osiguranje;
create database osiguranje CHARACTER SET utf8; 

use osiguranje;



CREATE TABLE drzava (
    drzava_id    int NOT null primary key auto_increment,
    ime_drzave   varchar(20) NOT NULL
);




CREATE TABLE grad (
    grad_id            int NOT null primary key auto_increment,
    naziv              varchar(20) NOT NULL,
    drzava_drzava_id   int NOT NULL,
    postanski_br       int NOT NULL
);



CREATE TABLE odjel (
    odjel_id                   int NOT null primary key auto_increment,
    poslovnica_poslovnica_id   int not null
);





CREATE TABLE opis_posla (
    posao_id      int NOT null primary key auto_increment,
    placa         decimal(7, 2) NOT NULL,
    opis          varchar(125) NOT NULL,
    naziv_posla   varchar(55) NOT NULL
);



CREATE TABLE polica_osig (
    polica_id              int NOT null primary key auto_increment,
    datum_sklapanja        DATE NOT NULL,
    pocetak_osiguranja     DATE NOT NULL,
    kraj_osiguranja        DATE,
    iznos_premije          decimal(8,2) NOT NULL,
    vrsta_osig_vrsta_id    int NOT NULL,
    zaposlenik_zaposl_id   int NOT NULL,
    osigurani_iznos        decimal(8,2) NOT NULL,
    osiguranik_osig_id     int NOT NULL
);




CREATE TABLE poslovnica (
    poslovnica_id   int NOT null primary key auto_increment,
    adresa          varchar(30) NOT NULL,
    grad_grad_id    int NOT NULL
);




CREATE TABLE steta (
    steta_id                int NOT null primary key auto_increment,
    datum_prijave           date NOT NULL,
    status                  varchar(20) NOT NULL,
    polica_osig_polica_id   int NOT NULL,
    iznos                   decimal(8,2) NOT NULL
);




CREATE TABLE osiguranik (
    osig_id      int NOT null primary key auto_increment,
    ime          varchar(20) NOT NULL,
    prezime      varchar(20) NOT NULL,
    adresa       varchar(70) NOT NULL,
    tel          varchar(30) NOT NULL,
    oib          varchar(11) NOT NULL,
    datum_rodj   date NOT NULL
);




CREATE TABLE vrsta_osig (
    vrsta_id   int NOT null primary key auto_increment,
    naziv      varchar(40) NOT NULL
);



CREATE TABLE zaposlenik (
    zaposl_id              int NOT null primary key auto_increment,
    ime                    varchar(20) NOT NULL,
    prezime                varchar(20) NOT NULL,
    adresa                 varchar(70) NOT NULL,
    tel                    varchar(20) NOT NULL,
    odjel_odjel_id         int NOT NULL,
    opis_posla_posao_id    int NOT NULL,
    zaposlenik_zaposl_id   int NOT NULL,
    datum_rodj             date NOT NULL,
    oib                    varchar(11) NOT NULL
);


ALTER TABLE grad
    ADD CONSTRAINT grad_drzava_fk FOREIGN KEY ( drzava_drzava_id )
        REFERENCES drzava ( drzava_id );

ALTER TABLE odjel
    ADD CONSTRAINT odjel_poslovnica_fk FOREIGN KEY ( poslovnica_poslovnica_id )
        REFERENCES poslovnica ( poslovnica_id );

ALTER TABLE polica_osig
    ADD CONSTRAINT polica_osig_osiguranik_fk FOREIGN KEY ( osiguranik_osig_id )
        REFERENCES osiguranik ( osig_id );

ALTER TABLE polica_osig
    ADD CONSTRAINT polica_osig_vrsta_osig_fk FOREIGN KEY ( vrsta_osig_vrsta_id )
        REFERENCES vrsta_osig ( vrsta_id );

ALTER TABLE polica_osig
    ADD CONSTRAINT polica_osig_zaposlenik_fk FOREIGN KEY ( zaposlenik_zaposl_id )
        REFERENCES zaposlenik ( zaposl_id );

ALTER TABLE poslovnica
    ADD CONSTRAINT poslovnica_grad_fk FOREIGN KEY ( grad_grad_id )
        REFERENCES grad ( grad_id );

ALTER TABLE steta
    ADD CONSTRAINT steta_polica_osig_fk FOREIGN KEY ( polica_osig_polica_id )
        REFERENCES polica_osig ( polica_id );

ALTER TABLE zaposlenik
    ADD CONSTRAINT zaposlenik_odjel_fk FOREIGN KEY ( odjel_odjel_id )
        REFERENCES odjel ( odjel_id );

ALTER TABLE zaposlenik
    ADD CONSTRAINT zaposlenik_opis_posla_fk FOREIGN KEY ( opis_posla_posao_id )
        REFERENCES opis_posla ( posao_id );

ALTER TABLE zaposlenik
    ADD CONSTRAINT zaposlenik_zaposlenik_fk FOREIGN KEY ( zaposlenik_zaposl_id )
        REFERENCES zaposlenik ( zaposl_id );

INSERT INTO drzava(drzava_id, ime_drzave)
    VALUES(1, 'Hrvatska');
    
INSERT INTO drzava(drzava_id, ime_drzave)
    VALUES(2, 'Slovenija');
    
INSERT INTO drzava(drzava_id, ime_drzave)
    VALUES(3, 'Austrija');
    
INSERT INTO drzava(drzava_id, ime_drzave)
    VALUES(4, 'Njemačka');
    
SELECT * FROM drzava;



INSERT INTO grad(grad_id, naziv, drzava_drzava_id, postanski_br)
    VALUES(1,'Zagreb',1,10000);
    
INSERT INTO grad(grad_id, naziv, drzava_drzava_id, postanski_br)
    VALUES(2,'Ljubljana',2,1000);
    
INSERT INTO grad(grad_id, naziv, drzava_drzava_id, postanski_br)
    VALUES(3,'Beč',3,1010);
    
INSERT INTO grad(grad_id, naziv, drzava_drzava_id, postanski_br)
    VALUES(4,'Berlin',4,10115);
    
INSERT INTO grad(grad_id, naziv, drzava_drzava_id, postanski_br)
    VALUES(5,'Osijek',1,31000);
    
INSERT INTO grad(grad_id, naziv, drzava_drzava_id, postanski_br)
    VALUES(6,'Split',1,21000);
    
INSERT INTO grad(grad_id, naziv, drzava_drzava_id, postanski_br)
    VALUES(7,'Varaždin',1,42000);    
    
SELECT * FROM grad;

INSERT INTO poslovnica(poslovnica_id,adresa,grad_grad_id)
VALUES(10,'Plješivička 51', 5 );
INSERT INTO poslovnica(poslovnica_id,adresa,grad_grad_id)
VALUES(11,'Zagrebačka 94',7);
INSERT INTO poslovnica(poslovnica_id,adresa,grad_grad_id)
VALUES(12,'Hrvatske mornarice 10',6);
INSERT INTO poslovnica(poslovnica_id,adresa,grad_grad_id)
VALUES(13,'Stjepana Romića 3',1);
INSERT INTO poslovnica(poslovnica_id,adresa,grad_grad_id)
VALUES(14,'Bratov Komel 41',2);
INSERT INTO poslovnica(poslovnica_id,adresa,grad_grad_id)
VALUES(15,'Prenzlauer Berg',4);

SELECT * FROM poslovnica;



INSERT INTO odjel(odjel_id,poslovnica_poslovnica_id)
    VALUES(10,10);
    
INSERT INTO odjel(odjel_id,poslovnica_poslovnica_id)
    VALUES(11,11);
    
INSERT INTO odjel(odjel_id,poslovnica_poslovnica_id)
    VALUES(12,12);
    
INSERT INTO odjel(odjel_id,poslovnica_poslovnica_id)
    VALUES(13,13);
    
INSERT INTO odjel(odjel_id,poslovnica_poslovnica_id)
    VALUES(14,14);
    
SELECT * FROM odjel;



INSERT INTO opis_posla(posao_id,placa,opis,naziv_posla)
    VALUES(1,14000,'mjesečni obračuni šteta i premija, analize, izračuni tehničkih pričuva','aktuarski posao');
    
INSERT INTO opis_posla(posao_id,placa,opis,naziv_posla)
    VALUES(2,10000,'obračun plaća zaposlenika,izrada financijskih izvjestaja','financije i računovodstvo');
    
INSERT INTO opis_posla(posao_id,placa,opis,naziv_posla)
    VALUES(3,8000,'sudjelovanje u pripremi strategije upravljanja rizicima, kontrola limita za rizike','upravljanje rizicima i reosiguranje');
    
INSERT INTO opis_posla(posao_id,placa,opis,naziv_posla)
    VALUES(4,5000,'ponuda kompletnog asortimana proizvoda - životnih i neživotnih osiguranja','ekskluzivna prodaja');
    
INSERT INTO opis_posla(posao_id,placa,opis,naziv_posla)
    VALUES(5,10000,'provođenje prodajnih kampanja,koordinacija online prodaje,podrška klijentima prilikom online kupovine','digitalizacija');
    
INSERT INTO opis_posla(posao_id,placa,opis,naziv_posla)
    VALUES(6,9000,'procjena nestandardnih rizika, javna nabava, predlaganje korektivnih mjera','tehnika osiguranja');
    
SELECT * FROM opis_posla;



INSERT INTO vrsta_osig(vrsta_id,naziv)
VALUES(1, 'životno');
INSERT INTO vrsta_osig(vrsta_id,naziv)
VALUES(2, 'osiguranje imovine');
INSERT INTO vrsta_osig(vrsta_id,naziv)
VALUES(3, 'automobilska odgovornost');
INSERT INTO vrsta_osig(vrsta_id,naziv)
VALUES(4, 'auto kasko');
INSERT INTO vrsta_osig(vrsta_id,naziv)
VALUES(5, 'zdravstveno');
INSERT INTO vrsta_osig(vrsta_id,naziv)
VALUES(6, 'putno osiguranje');
INSERT INTO vrsta_osig(vrsta_id,naziv)
VALUES(7, 'osiguranje plovila');

SELECT * FROM vrsta_osig;
