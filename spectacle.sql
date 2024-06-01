Create database `SpectacleBD`;

Use SpectacleBD;

CREATE TABLE Salle
(
SalleId int PRIMARY KEY,
Nom varchar(30),
Adresse varchar(30),
Capacite bigint
);

CREATE TABLE Spectacle
(
SpectacleId int primary key,
Titre varchar(30),
DateDebut date,
Duree time,
SalleId int,
Chanteur varchar(30),
FOREIGN KEY(SalleId) REFERENCES Salle(SalleId)
);

CREATE TABLE Concert
(
ConcertId int primary key,
`Date` date,
Heure time,
SpectacleId int,
FOREIGN KEY(SpectacleId) REFERENCES SPectacle(SpectacleId)
);


CREATE TABLE Billet
(
BilletId int PRIMARY KEY,
ConcertId int,
NumeroPlace int,
Categuorie varchar(30),
Prix float,
FOREIGN KEY(ConcertId) REFERENCES Concert(ConcertId)
);

CREATE TABLE Vente
(
VenteId int PRIMARY KEY,
DateVente date,
BilletId int,
MoyenPayement varchar(30),
FOREIGN KEY(BilletId) REFERENCES Billet(BilletId)
);

ALTER TABLE Salle
ADD Ville varchar(30);


-- Insertion dans la table Salle
INSERT INTO Salle (SalleId, Nom, Adresse, Capacite, Ville) VALUES (1, 'La Grande Scène', '123 Rue de la Musique', 1200, 'Lomé');
INSERT INTO Salle (SalleId, Nom, Adresse, Capacite, Ville) VALUES (2, 'L\'Espace Culturel', '456 Avenue des Arts', 850, 'Sokodé');

-- Insertion dans la table Spectacle
INSERT INTO Spectacle (SpectacleId, Titre, DateDebut, Duree, SalleId, Chanteur) VALUES (1, 'Nuit du Jazz', '2024-07-20', '03:00:00', 1, 'Amina Jazz');
INSERT INTO Spectacle (SpectacleId, Titre, DateDebut, Duree, SalleId, Chanteur) VALUES (2, 'Festival Rock', '2024-08-15', '02:30:00', 2, 'Les Rockeurs');

-- Insertion dans la table Concert
INSERT INTO Concert (ConcertId, `Date`, Heure, SpectacleId) VALUES (1, '2024-07-20', '20:00:00', 1);
INSERT INTO Concert (ConcertId, `Date`, Heure, SpectacleId) VALUES (2, '2024-08-15', '19:30:00', 2);

-- Insertion dans la table Billet
INSERT INTO Billet (BilletId, ConcertId, NumeroPlace, Categuorie, Prix) VALUES (1, 1, 50, 'Adulte', 75.0);
INSERT INTO Billet (BilletId, ConcertId, NumeroPlace, Categuorie, Prix) VALUES (2, 2, 120, 'Jeune', 50.0);

-- Insertion dans la table Vente
INSERT INTO Vente (VenteId, DateVente, BilletId, MoyenPayement) VALUES (1, '2024-07-01', 1, 'Espèces');
INSERT INTO Vente (VenteId, DateVente, BilletId, MoyenPayement) VALUES (2, '2024-07-02', 2, 'Chèque');


SELECT Spectacle.titre, Spectacle.DateDebut, Spectacle.duree, Spectacle.Chanteur
FROM Spectacle;

SELECT * FROM Salle
WHERE Capacite BETWEEN 100 AND 500;

SELECT * FROM vente
WHERE DateVente > '2014-12-31' AND MoyenPayement = 'Virement';

UPDATE Billet JOIN Vente ON Billet.BilletId = Vente.BilletId
SET Prix = Prix + Prix * 0.25
WHERE MoyenPayement = 'Chèque';

UPDATE Billet
SET Prix = Prix + Prix * 0.25
WHERE Categuorie = 'Adolescent';

DELETE FROM Spectacle
WHERE Chanteur = 'NDINGA';

SELECT * FROM Spectacle WHERE Chanteur LIKE 'K%';