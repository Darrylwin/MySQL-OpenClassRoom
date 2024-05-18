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

-- Insertion de données dans la table utilisateurs
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

INSERT INTO utilisateur(nom,prenom,email)
VALUES(
    "LABOU",
    "Marc",
    "labou_marc@gmail.com"
),

(
    "AMEBLE",
    "Ike",
    "Ike_amb@gmail.com"
);

INSERT INTO `utilisateur` (`nom`, `prenom`, `email`)
VALUES
('Doe', 'John', 'john@yahoo.fr'),
('Smith', 'Jane', 'jane@hotmail.com'),
('Dupont', 'Sebastien', 'sebastien@orange.fr'),
('Martin', 'Emilie', 'emilie@gmail.com');

// Insertion de donnnées dans la `table` aliment:

INSERT INTO `aliment` (`nom`, `marque`, `sucre`, `calories`, `graisses`, `proteines`, `bio`)
VALUES
('poire', 'monoprix', 27.5, 134, 0.2, 1.1, FALSE),
('pomme', 'monoprix', 19.1, 72, 0.2, 0.4, FALSE),
('oeuf', 'carrefour', 0.6, 82, 5.8, 6.9, TRUE),
("lait d\'amande", 'bjorg', 4.5, 59, 3.9, 1.1, TRUE);

INSERT INTO aliment(nom,marque,calories,sucre,graisses,proteines,bio)
VALUES(
    "Haricots verts",
    "Monoprix",
    25,
    3,
    0,
    1.7,
    FALSE
);

// Lecture de Données dans la BD

SELECT * FROM utilisateur;  -- Affiche tous les users

SELECT `nom`, `prenom`, `email` FROM utilisateur;  -- lister tous les noms et les calories associées pour chaque aliment 

// Mise à jour de Données

UPDATE `utilisateur` SET `email` = 'quentind@gmail.com' WHERE `id` = '1'; -- changer l’e-mail du premier utilisateur 

UPDATE aliment SET `nom` =  "Concombre" where `nom` = "poire"; -- Remplacer le nom Poire du champ nom d ealiment par 'Concombre'
-- UPDATE nom_table SET colonne = valeure
UPDATE utilisateur SET `email` = "logossou05@gmail.com" where id = 2;

