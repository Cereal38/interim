-- Jeux de données NOK (ne doit pas marcher àprès avoir éxécuté le jeux de données NOK)

-- Erreur : Modèle existant
INSERT INTO Diplomes VALUES ('BREVET', 1);
-- Erreur : Valeur négative
INSERT INTO Diplomes VALUES ('BAC ES', -3);

-- Erreur : status_mission autre que "en_attente", "annule", "en_cours", "termine"
INSERT INTO Missions Values (120, '2023-01-11', '2023-12-29', 'random_status', 3, 2, 'Cadre');

-- Erreur : Employe avec certification inconnu
INSERT INTO Certifications VALUES (3, 'BAC STMG');

-- Erreur : Mission avec client inconnu 
INSERT INTO Missions Values (36, '2024-01-02', '2024-06-30', 'en_attente', 2, 21, 'Secrétaire');
-- Erreur : Missions sans type
INSERT INTO Missions Values (36, '2024-01-02', '2024-06-30', 'en_attente', 2, 21, NULL);

-- Erreur : Contrat déjà existant
INSERT INTO Contrats Values (0, 0);

-- Erreur : Adhérent avec numéro existant
INSERT INTO Adherents VALUES (10, 'Erroné', 'Erroné', '2020-02-02');
-- Erreur : Adhérent sans nom
INSERT INTO Adherents VALUES (15, NULL, 'Erroné', '2020-02-02');
-- Erreur : Adhérent sans prenom
INSERT INTO Adherents VALUES (16, 'Erroné', NULL, '2020-02-02');

-- Erreur : Adhérent inconnu
INSERT INTO Proprietaires VALUES (666, 1);
-- Erreur : Bateau inconnu
INSERT INTO Proprietaires VALUES (1, 666);
-- Erreur : Bateau inconnu
INSERT INTO Proprietaires VALUES (999, NULL);
-- Erreur : Adhérent inconnu
INSERT INTO Proprietaires VALUES (NULL, 999);
