DROP DATABASE ventes;

create database ventes;

use ventes;

create table CLIENT
(
    num_cli INT ,
    nom VARCHAR(30) NOT NULL ,
    prenom VARCHAR(30),
    telephone INT unique ,
    primary key(num_cli)
);

CREATE TABLE CATEGUORIE
(
    code_cat int ,
    libelle_cat varchar(30),
    primary key (code_cat)
)
;

CREATE TABLE PRODUIT
(
    ref_prod int,
    libelle varchar(30),
    prix_unit float,
    code_cat int,
    primary key (ref_prod),
    foreign key (code_cat) references CLIENT(num_cli)
);

CREATE TABLE COMMANDE
(
    num_cmd int,
    `date` date,
    num_cli int,
    PRIMARY KEY (num_cmd),
    FOREIGN KEY (num_cli) references CLIENT(num_cli)
);

ALTER TABLE CLIENT
ADD `email` varchar(30);

ALTER TABLE CLIENT
DROP `email`;  -- à supprimé le champ `email` de la table

INSERT INTO CLIENT(Num_cli, Nom, Prenom)
VALUES (
        1001,
        'TALLE',
        'Essohonam'
       ),
    (
     1002,
     'KONDO',
     'Tété'
    ),
    (
     1003,
     'ABOA',
     'Yao');

DELETE FROM CLIENT
WHERE nom = 'ABOA' AND prenom = 'Yao';

UPDATE CLIENT
SET prenom = 'Essoham'
WHERE nom = 'TALLE';

SELECT libelle, prix_unit
FROM PRODUIT
WHERE prix_unit BETWEEN 5000 AND 10000
ORDER BY prix_unit DESC;

SELECT * FROM COMMANDE
WHERE `date` < '2019-03-17';

SELECT CLIENT.num_cli, CLIENT.nom, COMMANDE.*
FROM CLIENT JOIN COMMANDE
ON CLIENT.num_cli = COMMANDE.num_cli
WHERE CLIENT.num_cli = 1001;