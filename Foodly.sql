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
),
(
    "LOGOSSOU",
    "Darryl-win",
    "logossoudarryl1@yahoo.com"
),
(
    "LABOU",
    "Marc",
    "labou_marc@gmail.com"
),

(
    "AMEBLE",
    "Ike",
    "Ike_amb@gmail.com"
),

('Doe', 'John', 'john@yahoo.fr'),
('Smith', 'Jane', 'jane@hotmail.com'),
('Dupont', 'Sebastien', 'sebastien@orange.fr'),
('Martin', 'Emilie', 'emilie@gmail.com');

                /* Insertion de donnnées dans la `table` aliment: */

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

                /* Lecture de Données dans la BD */

SELECT * FROM utilisateur;  -- Affiche tous les users

SELECT `nom`, `prenom`, `email` FROM utilisateur;  -- lister tous les noms et les calories associées pour chaque aliment 


                /* Mise à jour de Données */

UPDATE `utilisateur` SET `email` = 'quentind@gmail.com' WHERE `id` = '1'; -- changer l’e-mail du premier utilisateur 

UPDATE aliment SET `nom` =  "Concombre" where `nom` = "poire"; -- Remplacer le nom Poire du champ nom d ealiment par 'Concombre'
-- UPDATE nom_table SET colonne = valeure
UPDATE utilisateur SET `email` = "logossou05@gmail.com" where id = 2;

UPDATE `aliment` SET nom = "Pomme Golden", marque = "Intermarché" WHERE id = 2;


                /* Suppression de données dans une `table` */

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


                /* Suppression de `tables`: */

DROP TABLE utilisateur;

                /* Suppression de BD:  */

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


                /*  Extraction d`informations` dans la BD  */

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


                /* Combien d objets répondent à un critère ?  */

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

                /*  les alias  */

SELECT COUNT(DISTINCT nom)  AS "produits différents contenant le mot Concombre"
FROM aliment 
WHERE nom LIKE "%Concombre%";

                /* Opérations sur données chiffrées */


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


                /*  Les Relations   (Très très Important)  */



DROP TABLE IF EXISTS `aliment`;
CREATE TABLE `aliment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `marque` varchar(100) DEFAULT NULL,
  `sucre` float DEFAULT NULL,
  `calories` int NOT NULL,
  `graisses` float DEFAULT NULL,
  `proteines` float DEFAULT NULL,
  `bio` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aliment`
--

LOCK TABLES `aliment` WRITE;
/*!40000 ALTER TABLE `aliment` DISABLE KEYS */;
INSERT INTO `aliment` 
VALUES 
(1,'pomme','sans marque',19.1,72,0.2,0.4,0),
(2,'poire','sans marque',27.5,134,0.2,1.1,1),
(3,'banane','chiquita',24,101,0.3,1.1,0),
(4,'jambon','herta',0.2,34,0.8,6.6,0),
(5,'compote','andros',11,51,0,0.5,0),
(6,'steak haché','charal',0.8,68,4.8,4.8,0),
(7,'saumon','guyader',0,206,12.3,22.1,0),
(8,'haricots verts','bonduelle',5.8,25,0.1,1.5,0),
(9,'riz','oncle benz',28.2,130,0.3,2.7,0),
(10,'pâtes completes','barilla',64,353,2.7,14,1),
(11,'blanc de dinde','père dodu',0.6,98,0.9,22,0),
(12,'filet de poulet','le gaulois',0,121,1.8,26.2,0),
(13,'muesli','bjorg',26.5,170,5,3.5,1),
(14,'café','carte noire',0,0,0,0,0),
(15,"jus d\'orange",'innocent',16,74,0,1.6,0),
(16,'jus de pomme','andros',24,100,0.2,0.2,1),
(17,'pomme de terre','doréac',21.1,104,0.2,2.8,0),
(18,'oeuf','naturalia',0.4,74,5.1,6.5,1),
(19,'baguette','sans marque',36.1,185,1.2,7.5,0),
(20,"lait d\'amande",'bjorg',6.1,80,5.3,1.5,1);
/*!40000 ALTER TABLE `aliment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langue`
--

DROP TABLE IF EXISTS `langue`;
CREATE TABLE `langue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `langue`
--

LOCK TABLES `langue` WRITE;
/*!40000 ALTER TABLE `langue` DISABLE KEYS */;
INSERT INTO `langue` 
VALUES (1,'français'),
       (2,'anglais' );
/*!40000 ALTER TABLE `langue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `langue_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `langue_id` (`langue_id`),
  CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`langue_id`) REFERENCES `langue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'durantay','quentin','qentin@gmail.com',1),(2,'dupont','marie','marie@hotmail.fr',1),(3,'miller','vincent','vm@yahoo.com',2),(4,'zuckerberg','marc','marc@gmail.com',2),(5,'paul','pierre','pp@orange.fr',1),(6,'de vauclerc','lisa','lisadv@gmail.com',1),(7,'gluntig','éléonore','glunt@sfr.com',1),(8,'cavill','henry','henry@outlook.fr',2),(9,'hopper','lionel','hpp@gmail.com',2),(10,'tember','fabienne','fabienne@yopmail.com',1);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur_aliment`
--

DROP TABLE IF EXISTS `utilisateur_aliment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur_aliment` (
  `utilisateur_id` int NOT NULL,
  `aliment_id` int NOT NULL,
  KEY `utilisateur_id` (`utilisateur_id`),
  KEY `aliment_id` (`aliment_id`),
  CONSTRAINT `utilisateur_aliment_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `utilisateur_aliment_ibfk_2` FOREIGN KEY (`aliment_id`) REFERENCES `aliment` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur_aliment`
--

LOCK TABLES `utilisateur_aliment` WRITE;
/*!40000 ALTER TABLE `utilisateur_aliment` DISABLE KEYS */;
INSERT INTO `utilisateur_aliment`
VALUES 
(1,7),(1,3),(1,5),(2,2),(2,19),
(2,14),(3,4),(3,15),(3,12),(1,17),
(4,5),(4,4),(4,7),(5,1),(5,18),
(5,3),(6,2),(6,12),(6,6),(7,16),
(7,19),(7,1),(8,3),(8,5),(9,18),
(9,9),(9,14),(10,16),(10,3);
/*!40000 ALTER TABLE `utilisateur_aliment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `utilisateurs_gmail_vw`
--

DROP TABLE IF EXISTS `utilisateurs_gmail_vw`;
/*!50001 DROP VIEW IF EXISTS `utilisateurs_gmail_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `utilisateurs_gmail_vw` AS SELECT 
 1 AS `id`,
 1 AS `nom`,
 1 AS `prenom`,
 1 AS `email`,
 1 AS `langue_id`*/;
SET character_set_client = @saved_cs_client;


        --         ===================================================================================

                -- Relation 1 à plusieurs
SELECT * 
FROM utilisateur
JOIN langue
ON utilisateur.langue_id = langue.id;
-- ON sert à préciser sur quel attribut se fait la corresondance avec l'autre table

SELECT UPPER(U.nom) `Nom d'utilisateur`, L.id `ID User`, UPPER(L.nom) `Langue` FROM utilisateur U JOIN langue L ON U.langue_id = L.id WHERE U.langue_id = 1 ORDER BY U.nom;

                -- Relation plusieurs à plusieurs

SELECT *
FROM utilisateur
JOIN utilisateur_aliment ON (utilisateur.id = utilisateur_aliment.utilisateur_id)
JOIN aliment ON (aliment.id = utilisateur_aliment.aliment_id)  /*WHERE aliment.id = 3*/;

--exo: vous souhaitiez voir tous les aliments sélectionnés par les utilisateurs dont l’adresse e-mail et une adresse Gmail

SELECT aliment.nom, utilisateur.nom, utilisateur.email 
FROM utilisateur JOIN utilisateur_aliment ON (utilisateur.id = utilisateur_aliment.utilisateur_id) 
JOIN aliment ON (utilisateur_aliment.aliment_id = aliment.id)
WHERE utilisateur.email LIKE '%gmail.com%';