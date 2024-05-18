CREATE DATABASE foodly; -- Créer une base de donner

SHOW DATABASES; -- Afficher les BD présentes

USE foodly;  -- Sélectionner la BD

CREATE TABLE utilisateur (
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(100),
prenom VARCHAR(100),
email VARCHAR(255) NOT NULL UNIQUE
);  -- Création de la table utilisateur

CREATE TABLE aliment (
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
marque VARCHAR(100),
sucre FLOAT,
calories INTEGER NOT NULL,
graisses FLOAT,
proteines FLOAT,
bio BOOLEAN DEFAULT false
);  -- Création de la table aliment

SHOW TABLES ;-- Afficher les tables présentes
SHOW COLUMNS FROM aliment;
SHOW COLUMNS FROM utilisateur; -- Afficher le Schéma de la table

-- Insertion de données
INSERT INTO `utilisateur` (`nom`, `prenom`, `email`) 
VALUES (
    'Durantay', 
    'Quentin', 
    'quentin@gmail.com'
);

INSERT INTO utilisateur(nom,prenom,email)
VALUES(
    "LOGOSSOU",
    "Darryl-win",
    "logossoudarryl1@yahoo.com"
);