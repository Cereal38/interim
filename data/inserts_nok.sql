-- Jeux de données NOK (ne doit pas marcher àprès avoir éxécuté le jeux de données NOK)

-- Erreur : Modèle existant
INSERT INTO Diplomes VALUES ('BREVET', '1');

-- Erreur : Valeur négative (Ne respect pas la regex)
INSERT INTO Diplomes VALUES ('BAC ES', '-3');

-- Erreur : status_mission autre que "en_attente", "annule", "en_cours", "termine"
INSERT INTO Missions Values (120, '2023-01-11', '2023-12-29', 'random_status', '3', 2, 'Cadre');

-- Erreur : Employe avec certification inconnu
INSERT INTO Certifications VALUES (3, 'BAC STMG');

-- Erreur : Mission avec client inconnu 
INSERT INTO Missions Values (36, '2024-01-02', '2024-06-30', 'en_attente', '2', 21, 'Secrétaire');

-- Erreur : Missions sans type
INSERT INTO Missions Values (36, '2024-01-02', '2024-06-30', 'en_attente', '2', 21, NULL);

-- Erreur : Contrat déjà existant
INSERT INTO Contrats Values (0, 0);

-- Erreur : Regex non respecté
INSERT INTO Diplome VALUES ('BAC O', '123');

-- Erreur : NOT NULL field leaved NULL
INSERT INTO Diplome VALUES ('BAC N', NULL);

-- Erreur : Telephone invalide
INSERT INTO Employes VALUES (900, 'Jack', 'Romarin', '46789', 'jack.romarin@gmail.com');

