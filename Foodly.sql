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

UPDATE `aliment` SET nom = "Pomme Golden", marque = "Intermarché" WHERE id = 2;


// Suppression de données dans une `table`

DELETE FROM `utilisateur` WHERE `id` = 4;
DELETE FROM `utilisateur` WHERE `id` = 2; -- supprimer les users dont le id = 2 et id = 4

INSERT INTO utilisateur
VALUES(
    2,
    "SANOUSSI",
    "Bilal",
    "bil_sanoussi@gmail.com"
),
(
    4,
    "TENEGA",
    'Françoise',
    'franci_tenega@gmail.com'
);


INSERT INTO utilisateur(nom,prenom,email)
VALUES(
    "SANNI",
    "Cécile",
    "yawavisanni@gmail.com"
),
(
    "PANASSA",
    "Lotinho",
    'emmanuel_lotie@gmail.com'
),
(
    "AMEYIKPO",
    "Loreine",
    "loreineAmeyikpo@gmail.com"
),
(
    "ETOH",
    "Mawunyo",
    "mawunyo_etoh@yahoo.com"
),
(
    "ETSE",
    'Géoffroy',
    'bouboumegeo@gmail.com'
);

DELETE FROM `utilisateur`
WHERE id = 8 or id = 9;

INSERT INTO utilisateur
VALUES(
    8,
    "SANNI",
    "Cécile",
    "yawavisanni@gmail.com"
),
(
    9,
    "ALEDJI",
    "MAXIme",
    'banakiweMaxime@gmail.com'
);

UPDATE `utilisateur`
SET prenom = "Maxime"
WHERE id = 9;


// Suppression de `tables`:

DROP TABLE utilisateur;

// Suppression de BD:

DROP DATABASE foodly;


UPDATE `aliment`
SET nom = "Pomme Golden Bowns" where id = 2;

DELETE FROM `aliment` 
WHERE id = 2;

-- N.B: On supprime les objets d’une table avec la commande DELETE
--      On peut supprimer une table ou une base de donnée avec la commande  DROP TABLE  ou  DROP DATABASE

INSERT INTO utilisateur(nom, prenom, email)
VALUES(
    "LOGOSSOU",
    "Darryl-win",
    'logossoudarryl1@yahoo.com'
);


// Extraction d`informations` dans la BD

SELECT * FROM aliment;
SELECT * FROM aliment WHERE id = 2;
SELECT * FROM aliment WHERE calories < 90;

-- Comparaison sur du Texte:
SELECT nom, id from utilisateur where email LIKE '%yahoo%';
SELECT * FROM utilisateur WHERE email LIKE "%gmail.com";

-- Affichage par ordre:
SELECT * FROM aliment ORDER BY calories ASC;
SELECT * FROM aliment WHERE calories < 90 ORDER BY calories DESC;

SELECT nom,prenom,id FROM utilisateur ORDER BY id DESC;

SELECT nom, marque, id 
FROM aliment 
WHERE (calories < 90)  AND (sucre >0.5)
ORDER BY calories DESC;

select *
FROM aliment 
WHERE bio = false
ORDER BY proteines DESC,sucre DESC;


// Combien d objets répondent à un critère ?

SELECT COUNT(*) 
FROM utilisateur 
WHERE email LIKE "%gmail.com"; --  nombre d’utilisateurs avec une adresse Gmail

SELECT COUNT(*)
FROM aliment;

SELECT COUNT(email) AS tatal_users_gmail
FROM utilisateur 
WHERE email LIKE "%gmail.com";

INSERT INTO aliment(nom, marque,calories)
VALUES('Concombre',"MarketPrix",18);

SELECT * 
FROM aliment 
WHERE nom like "%Concombre%";

SELECT COUNT(nom) 
FROM aliment 
WHERE nom like "%Concombre%"; -- Affiche le nombre d'aliments dont le nom contient Concombre

SELECT COUNT(graisses) 
FROM aliment 
WHERE nom like "%Concombre%";

SELECT COUNT(DISTINCT nom) 
FROM aliment 
WHERE nom LIKE "%pomme%";

// les alias

SELECT COUNT(DISTINCT nom)  AS "produits différents contenant le mot Concombre"
FROM aliment 
WHERE nom LIKE "%Concombre%";

// Opérations sur données chiffrées

-- AVG : nous donne la moyenne de la colonne sur la sélection ;

-- SUM : nous donne la somme de la colonne sur la sélection ;

-- MAX : nous donne le maximum de la colonne sur la sélection ;

-- MIN : nous donne le minimum de la colonne sur la sélection.


SELECT MAX(sucre) `maximum de teneur` FROM aliment; -- le maximum de teneur en sucre des aliments dans notre base

SELECT AVG(calories) AS 'Teneur en moyenne de calories > 30kcal' FROM aliment WHERE calories > 30;  -- teneur moyenne en calories des aliments de 30 kcal ou plus 

SELECT ROUND(AVG(calories)) AS "calories moyennes des aliments > 30g"
FROM aliment 
WHERE calories > 30;

SELECT MIN(id) FROM utilisateur;
SELECT MAX(graisses) FROM aliment;
