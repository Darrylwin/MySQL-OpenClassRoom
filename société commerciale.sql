create database soci_comm;

use soci_comm;

CREATE TABLE FOURNISSEUR
(
    idFour int PRIMARY KEY ,
    Raison_sociale VARCHAR(100),
    Adresse VARCHAR(30),
    Contact varchar(100),
    Ville VARCHAR(30),
    Pays VARCHAR(30)
);

CREATE TABLE CATEGORIE
(
    Code_cat int PRIMARY KEY ,
    Libelle_cat VARCHAR(30)
);

CREATE TABLE PRODUIT
(
    idProduit int primary key ,
    Libelle_produit varchar(30),
    Qte_Stock int,
    Prix_Inventaire float,
    code_cat int,
    foreign key(code_cat) references CATEGORIE(Code_cat)
);

CREATE TABLE LIVRAISON
(
    `Numéro Livraison` int PRIMARY KEY ,
    idFour int,
    idProduit int,
    `Date Livraison` date,
    Qte_Livraison int,
    Prix_Livraison float,
    `Delai_Livré` date,
    foreign key (idFour) references FOURNISSEUR(idFour),
    foreign key (idProduit) references PRODUIT(idProduit)
);

CREATE TABLE CLIENT
(
    `Code_CLient` int primary key ,
    Nom varchar(30),
    Prenom varchar(30),
    Adresse_Client varchar(30),
    COde_Postal varchar(30),
    Ville_client varchar(30),
    Pays_Client varchar(30)
);

CREATE TABLE COMMANDE
(
    Numero_com int PRIMARY KEY ,
    Date_com date,
    Code_client int,
    FOREIGN KEY (Code_client) REFERENCES CLIENT(Code_CLient)
);

CREATE TABLE LIGNE_COMMANDE
(
    Numero_com int,
    idProduit int,
    Qte_com int,
    foreign key (Numero_com) references COMMANDE(Numero_com),
    foreign key (idProduit) references PRODUIT(idProduit)
);



-- Insertion de données dans la table FOURNISSEUR
INSERT INTO FOURNISSEUR VALUES
                            (1, 'ElectroMax', '123 Rue de l\'Innovation', 1234567890, 'Lomé', 'Togo'),
                            (2, 'AgriPlus', '456 Avenue des Champs', 2345678901, 'Sokodé', 'Togo'),
                            (3, 'BricoDepot', '789 Avenue de la République', 3456789012, 'Atakpamé', 'Togo'),
                            (4, 'MaisonEtJardin', '101 Rue des Jardins', 4567890123, 'Dapaong', 'Togo'),
                            (5, 'TechAdvance', '202 Boulevard de l\'Industrie', 5678901234, 'Tsévié', 'Togo');

-- Insertion de données dans la table CATEGORIE
INSERT INTO CATEGORIE VALUES
                          (1, 'Électronique'),
                          (2, 'Agriculture'),
                          (3, 'Bricolage'),
                          (4, 'Mobilier'),
                          (5, 'Informatique');

-- Insertion de données dans la table PRODUIT
INSERT INTO PRODUIT VALUES
                        (1, 'Télévision', 50, 299.99, 1),
                        (2, 'Tracteur', 10, 8999.99, 2),
                        (3, 'Perceuse', 100, 49.99, 3),
                        (4, 'Chaise', 150, 19.99, 4),
                        (5, 'Ordinateur', 30, 499.99, 5);


-- Insertion de données dans la table CLIENT
INSERT INTO CLIENT VALUES
                       (101, 'Doe', 'John', '789 Rue de la Paix', '9000', 'Kara', 'Togo'),
                       (102, 'Koné', 'Aïcha', '321 Boulevard de la Liberté', '1000', 'Lomé', 'Togo'),
                       (103, 'Mensah', 'Kofi', '654 Rue de l\'Égalité', '1100', 'Sokodé', 'Togo'),
                       (104, 'MA BELLE', 'Amélie', '987 Avenue de la Victoire', '1200', 'Dapaong', 'Togo'),
                       (105, 'Assouma', 'Yasmine', '246 Rue du Progrès', '1300', 'Tsévié', 'Togo');

-- Insertion de données dans la table COMMANDE
INSERT INTO COMMANDE VALUES
                         (5001, '2024-06-01', 101),
                         (5002, '2024-06-02', 102),
                         (5003, '2024-06-03', 103),
                         (5004, '2024-06-04', 104),
                         (5005, '2024-06-05', 105);

-- Insertion de données dans la table LIGNE_COMMANDE
INSERT INTO LIGNE_COMMANDE VALUES
                               (5001, 1, 2),
                               (5002, 2, 1),
                               (5003, 3, 4),
                               (5004, 4, 3),
                               (5005, 5, 5);


SELECT * FROM FOURNISSEUR;

SELECT PRODUIT.*,CLIENT.nom FROM CLIENT JOIN COMMANDE ON CLIENT.Code_CLient = COMMANDE.Code_client
JOIN LIGNE_COMMANDE ON COMMANDE.Numero_com = LIGNE_COMMANDE.Numero_com
JOIN PRODUIT ON LIGNE_COMMANDE.idProduit = PRODUIT.idProduit
WHERE CLIENT.Nom = 'MA BELLE';

SELECT PRODUIT.*,CLIENT.nom FROM CLIENT JOIN COMMANDE ON CLIENT.Code_CLient = COMMANDE.Code_client
JOIN LIGNE_COMMANDE ON COMMANDE.Numero_com = LIGNE_COMMANDE.Numero_com
JOIN PRODUIT ON LIGNE_COMMANDE.idProduit = PRODUIT.idProduit
WHERE CLIENT.Nom != 'MA BELLE';

SELECT * FROM CLIENT JOIN COMMANDE
ON CLIENT.Code_CLient = COMMANDE.Code_client
WHERE COMMANDE.Code_client is null;

SELECT PRODUIT.idProduit, PRODUIT.libelle_Produit, COMMANDE.*, CLIENT.Code_client,CLIENT.nom, CLIENT.prenom
FROM CLIENT JOIN COMMANDE ON CLIENT.Code_CLient = COMMANDE.Code_client
            JOIN LIGNE_COMMANDE ON LIGNE_COMMANDE.Numero_com = COMMANDE.Numero_com
            JOIN PRODUIT ON LIGNE_COMMANDE.idProduit = PRODUIT.idProduit;

