CREATE TABLE Station(
   idStation VARCHAR(8),
   nomStation VARCHAR(50) NOT NULL,
   pointDeVente BOOLEAN NOT NULL,
   PRIMARY KEY(idStation)
);

CREATE TABLE Ligne(
   idLigne VARCHAR(8),
   communeDepart VARCHAR(50) NOT NULL,
   communeArrivee VARCHAR(50) NOT NULL,
   PRIMARY KEY(idLigne)
);

CREATE TABLE Critere(
   idCritere INT AUTO_INCREMENT,
   libelle VARCHAR(50) NOT NULL,
   PRIMARY KEY(idCritere)
);

CREATE TABLE Satisfaction(
   idSatisfaction INT AUTO_INCREMENT,
   degre VARCHAR(50) NOT NULL,
   PRIMARY KEY(idSatisfaction)
);

CREATE TABLE Commentaire(
   idCommentaire INT AUTO_INCREMENT,
   commentaire VARCHAR(50) NOT NULL,
   idStation INT NOT NULL,
   idCritere INT NOT NULL,
   idSatisfaction INT NOT NULL,
   idLigne INT NOT NULL,
   PRIMARY KEY(idCommentaire),
   FOREIGN KEY(idStation) REFERENCES Station(idStation),
   FOREIGN KEY(idCritere) REFERENCES Critere(idCritere),
   FOREIGN KEY(idSatisfaction) REFERENCES Satisfaction(idSatisfaction),
   FOREIGN KEY(idLigne) REFERENCES Ligne(idLigne)
);

CREATE TABLE Se_Situer(
   numStation VARCHAR(8),
   numLigne VARCHAR(8),
   PRIMARY KEY(numStation, numLigne),
   FOREIGN KEY(numStation) REFERENCES Station(id),
   FOREIGN KEY(numLigne) REFERENCES Ligne(id)
);

INSERT INTO Critere (libelle) VALUES
('Fréquence de bus'),
('Itinéraire des lignes et stations desservies'),
('Information sur le trafic'),
('Point de vente de tickets et recharge des cartes d’abonnement');

INSERT INTO Satisfaction (degre) VALUES
('Très satisfait'),
('Satisfait'),
('Réservé'),
('Insatisfait');

INSERT INTO Ligne (idLigne, communeDepart, communeArrivee) VALUES
(8, 'Les Sables', 'Ile d’olonne'),
(10, 'Les Sables', 'Vairé'),
(26, 'Les Sables', 'Les Achards');

INSERT INTO Station (idStation, nomStation, pointDeVente) VALUES
('STA01', 'Mairie', TRUE),
('STA10', 'Plage', TRUE),
('STA11', 'Gare', FALSE),
('STA12', 'Lycée Savary', FALSE),
('STA13', 'Leclerc', TRUE),
('STA14', 'Médiathèque', FALSE),
('STA15', 'Poste', FALSE),
('STA22', 'Hôpital', TRUE),
('STA23', 'Stade municipal', FALSE),
('STA24', 'Université', TRUE),
('STA25', 'Parc central', TRUE),
('STA26', 'Zenith', FALSE),
('STA27', 'Musée d’art', TRUE);

INSERT INTO Se_Situer (numStation, numLigne) VALUES
('STA12', 10),
('STA23', 10),
('STA24', 10),
('STA25', 10),
('STA26', 10),
('STA27', 10),
('STA11', 8),
('STA13', 8),
('STA14', 8),
('STA15', 8),
('STA25', 8),
('STA22', 26);

INSERT INTO Commentaire (idCritere, idLigne, idStation, idSatisfaction, commentaire) VALUES
(1, 10, 23, 4, 'La fréquence des bus est insuffisante, je dois attendre longtemps aux arrêts.'),
(1, 10, 11, 3, 'La fréquence des bus est correcte, mais cela pourrait être amélioré aux heures de pointe.'),
(1, 8, 15, 2, 'Il y a parfois trop peu de bus, mais les horaires sont assez fiables.'),
(1, 26, 22, 4, 'Les bus passent trop rarement, surtout en soirée.'),
(2, 8, 12, 3, 'L’itinéraire est globalement bon, mais certains arrêts sont mal situés.'),
(2, 10, 26, 1, 'Les stations et lignes sont bien choisies, avec une bonne couverture des zones principales.'),
(3, 8, 15, 4, 'Les informations sur le trafic sont souvent manquantes, c’est frustrant.'),
(3, 26, 22, 2, 'Le trafic est bien informé, mais il y a parfois des retards dans la mise à jour des panneaux.'),
(3, 10, 25, 3, 'Les informations sont fiables, mais il manque plus de visibilité pendant les périodes de forte affluence.'),
(4, 10, 23, 4, 'Il n’y a pas de guichets automatiques pour acheter les tickets, c’est vraiment gênant.'),
(4, 8, 14, 2, 'Il manque des guichets automatiques dans certaines stations, cela devrait être réglé rapidement.'),
(4, 26, 22, 3, 'Un guichet automatique à la station de l’Hôpital serait très utile pour gagner du temps.'),
(4, 8, 11, 4, 'Aucun guichet automatique à la gare, c’est un vrai manque pour les usagers qui n’ont pas de carte d’abonnement.'),
(1, 26, 22, 4, 'Les horaires sont peu adaptés à la réalité du terrain, surtout pour les travailleurs matinaux.'),
(2, 8, 12, 1, 'Les itinéraires sont bien faits, mais quelques ajustements seraient nécessaires pour certaines zones moins desservies.'),
(3, 10, 25, 3, 'L’information sur les changements de ligne pourrait être plus claire, surtout en cas de perturbations.'),
(4, 26, 22, 3, 'Bien qu’il y ait des points de vente de tickets, il est difficile d’accéder aux guichets automatiques dans certaines stations.'),
(1, 10, 24, 2, 'La fréquence est correcte, mais un peu plus de buses le weekend serait idéal.'),
(3, 8, 14, 4, 'Pas d’information en temps réel, j’ai raté mon bus à cause de cela.'),
(1, 8, 13, 2, 'Les bus arrivent assez souvent, mais il manque des horaires plus adaptés le soir.'),
(4, 10, 25, 3, 'Certains arrêts comme celui du Parc central manquent de guichets automatiques. Cela complique l’achat de tickets.');
