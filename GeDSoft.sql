
CREATE TABLE DEPARTEMENT
(
    NumD int PRIMARY KEY,
    NomD VARCHAR(30),
    Lieu VARCHAR(30)
);

CREATE database GeDSoft;

use GeDSoft;

CREATE TABLE EMPLOYE
(
    NumE int,
    NomE VARCHAR(30),
    Fonction VARCHAR(30),
    Embauche date,
    Salaire float,
    Comm INT,
    NumD int,
    NumS int,
    PRIMARY KEY (numE),
    FOREIGN KEY (NumD) REFERENCES DEPARTEMENT(NumD)
);

ALTER TABLE EMPLOYE
MODIFY `NumE` int auto_increment;

INSERT INTO EMPLOYE(NomE,Fonction,NumS,Embauche,Salaire,Comm,NumD)
VALUES
    (
     'Gava',
     'President',
     NULL,
     '1979-10-10',
     10000,
     NUll,
     NULL
    ),
    (
     'Thomas',
     'Doyen',
     1,
     '2006-10-01',
     5000,
     NULL,
     1
    ),
    (
     'Tino',
     'Stagiaire',
     1,
     '2006-10-01',
     0,
     NULL,
     1
    ),
    (
     'Al-Caponne',
     'Commercial',
     2,
     '2006-10-01',
     5000,
     100,
     2
    );

INSERT INTO DEPARTEMENT(NumD, NomD, Lieu)
VALUES
    (
     1,
     'Droit',
     'Lomé'
    ),
    (
     2,
     'Commerce',
     'Kpalimé'
    );

SELECT * FROM EMPLOYE
WHERE Comm is not null ORDER BY Comm DESC;

SELECT * FROM EMPLOYE
WHERE EMPLOYE.Embauche >= '2006-09-01';

SELECT EMPLOYE.* FROM EMPLOYE JOIN DEPARTEMENT
ON EMPLOYE.NumD = DEPARTEMENT.NumD
WHERE Lieu = 'Lomé';

SELECT AVG(Salaire) as `MOYENNE DES SALAIRES`
FROM EMPLOYE;

SELECT COUNT(*) as `Nombre de commisions non nulles`
FROM EMPLOYE
WHERE Comm is not null;

SELECT EMPLOYE.*
FROM EMPLOYE
WHERE Salaire > (SELECT AVG(Salaire) FROM EMPLOYE);