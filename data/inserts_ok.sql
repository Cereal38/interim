-- Jeux de données OK (ça doit marcher)

-- ATTENTION : On insert les entiers / rééls (autres que les PK) comme des chaînes de caractères pour
-- pouvoir les véifier avec les regexs inscrites dans les CHECKs à la création

INSERT INTO Diplomes VALUES ('Licence IMA', '3');
INSERT INTO Diplomes VALUES ('Licence STAPS', '3');
INSERT INTO Diplomes VALUES ('BAC S', '3');
INSERT INTO Diplomes VALUES ('BREVET', '1');
INSERT INTO Diplomes VALUES ('MASTER WEB', '5');
INSERT INTO Diplomes VALUES ('BTS MARKETING', '2');
-- INSERT INTO Diplomes VALUES ('BAC L', 3);
-- INSERT INTO Diplomes VALUES ('MASTER MARKETING', 5);
-- INSERT INTO Diplomes VALUES ('BTS WEB', 2);
-- INSERT INTO Diplomes VALUES ('BEP', 1);
-- INSERT INTO Diplomes VALUES ('DEUG', 2);
-- INSERT INTO Diplomes VALUES ('LICENCE WEB', 3);
-- INSERT INTO Diplomes VALUES ('LICENCE MARKETING', 3);
-- INSERT INTO Diplomes VALUES ('DUT', 2);
-- INSERT INTO Diplomes VALUES ('CAP', 1);
-- INSERT INTO Diplomes VALUES ('MASTER INFORMATIQUE', 5);
-- INSERT INTO Diplomes VALUES ('MASTER SCIENCES POLITIQUES', 5);

INSERT INTO Clients VALUES (0, 'Carrefour', '0412345678', 'contact@carrefour.com');
INSERT INTO Clients VALUES (1, 'Leroy Merlin', '0422345678', 'contact@leroymerlin.fr');
INSERT INTO Clients VALUES (2, 'Boulanger', '0432345678', 'contact@boulanger.com');
INSERT INTO Clients VALUES (9, 'SNCF', '0403345678', 'contact@sncf.fr');
INSERT INTO Clients VALUES (3, 'Cdiscount', '0442345678', 'contact@cdiscount.com');
INSERT INTO Clients VALUES (14, 'Bouygues', '0453345678', 'contact@bouygues.com');
-- INSERT INTO Clients VALUES (4, 'Darty', '0452345678', 'contact@darty.fr');
-- INSERT INTO Clients VALUES (5, 'Fnac', '0462345678', 'contact@fnac.com');
-- INSERT INTO Clients VALUES (6, 'La Redoute', '0472345678', 'contact@laredoute.fr');
-- INSERT INTO Clients VALUES (7, 'Decathlon', '0482345678', 'contact@decathlon.fr');
-- INSERT INTO Clients VALUES (8, 'Ikea', '0492345678', 'contact@ikea.com');
-- INSERT INTO Clients VALUES (10, 'Air France', '0413345678', 'contact@airfrance.com');
-- INSERT INTO Clients VALUES (11, 'Orange', '0423345678', 'contact@orange.fr');
-- INSERT INTO Clients VALUES (12, 'SFR', '0433345678', 'contact@sfr.fr');
-- INSERT INTO Clients VALUES (13, 'Free', '0443345678', 'contact@free.fr');

INSERT INTO TypesMissions VALUES ('Caissier', '1200.63', 'BREVET');
INSERT INTO TypesMissions VALUES ('Réceptionniste', '1500.94', 'BAC S');
INSERT INTO TypesMissions VALUES ('Cadre', '3500', 'MASTER WEB');
INSERT INTO TypesMissions VALUES ('Secrétaire', '2000', 'BTS MARKETING');
INSERT INTO TypesMissions VALUES ('Coach', '2000', 'Licence STAPS');
-- INSERT INTO TypesMissions VALUES ('Gestionnaire', 2500, 'DEUG');
-- INSERT INTO TypesMissions VALUES ('Développeur web', 4000, 'MASTER INFORMATIQUE');
-- INSERT INTO TypesMissions VALUES ('Stagiaire', 1000, 'BREVET');
-- INSERT INTO TypesMissions VALUES ('Manager', 5000, 'MASTER SCIENCES POLITIQUES');
-- INSERT INTO TypesMissions VALUES ('Analyste', 3000, 'LICENCE WEB');
-- INSERT INTO TypesMissions VALUES ('Consultant', 4500, 'DUT');
-- INSERT INTO TypesMissions VALUES ('Technicien', 2000, 'BEP');
-- INSERT INTO TypesMissions VALUES ('Comptable', 2500, 'BAC L');
-- INSERT INTO TypesMissions VALUES ('Conseiller', 3000, 'LICENCE MARKETING');
-- INSERT INTO TypesMissions VALUES ('Animateur', 2500, 'CAP');

INSERT INTO Employes VALUES (0, 'Martin', 'Paul', '0412346789', 'paul.martin@gmail.com');
INSERT INTO Employes VALUES (1, 'Durand', 'Jacques', '0412345678', 'jacques.durand@gmail.com');
INSERT INTO Employes VALUES (2, 'Dupont', 'Pierre', '0412341234', 'pierre.dupont@gmail.com');
INSERT INTO Employes VALUES (3, 'Berger', 'Marc', '0412345123', 'marc.berger@gmail.com');
INSERT INTO Employes VALUES (4, 'Legrand', 'Nathalie', '0412344567', 'nathalie.legrand@gmail.com');
-- INSERT INTO Employes VALUES (5, 'Delarue', 'Sophie', '0412344444', 'sophie.delarue@gmail.com');
-- INSERT INTO Employes VALUES (6, 'Rouge', 'Jean', '0412342222', 'jean.rouge@gmail.com');
-- INSERT INTO Employes VALUES (7, 'Dupont', 'Romain', '0412344444', 'romain.dupont@gmail.com');
-- INSERT INTO Employes VALUES (8, 'Dupuy', 'Julien', '0412345678', 'julien.dupuy@gmail.com');
-- INSERT INTO Employes VALUES (9, 'Girard', 'Laurent', '0412344444', 'laurent.girard@gmail.com');
-- INSERT INTO Employes VALUES (10, 'Gauthier', 'Sylvain', '0412345678', 'sylvain.gauthier@gmail.com');
-- INSERT INTO Employes VALUES (11, 'Moreau', 'Anne', '0412344444', 'anne.moreau@gmail.com');
-- INSERT INTO Employes VALUES (12, 'Moulin', 'Mona', '0412345123', 'mona.moulin@gmail.com');
-- INSERT INTO Employes VALUES (13, 'Petit', 'Kevin', '0412342222', 'kevin.petit@gmail.com');
-- INSERT INTO Employes VALUES (14, 'Lefevre', 'Olivier', '0412345678', 'olivier.lefevre@gmail.com');

INSERT INTO Certifications VALUES (0, 'Licence IMA');
INSERT INTO Certifications VALUES (0, 'BREVET');
INSERT INTO Certifications VALUES (1, 'BREVET');
INSERT INTO Certifications VALUES (2, 'BAC S');
INSERT INTO Certifications VALUES (3, 'BAC S');
INSERT INTO Certifications VALUES (3, 'BREVET');
INSERT INTO Certifications VALUES (4, 'BTS MARKETING');
-- INSERT INTO Certifications VALUES (5, 'MASTER MARKETING');
-- INSERT INTO Certifications VALUES (6, 'BTS WEB');
-- INSERT INTO Certifications VALUES (7, 'BTS MARKETING');
-- INSERT INTO Certifications VALUES (7, 'BEP');
-- INSERT INTO Certifications VALUES (9, 'DEUG');
-- INSERT INTO Certifications VALUES (10, 'LICENCE WEB');
-- INSERT INTO Certifications VALUES (12, 'LICENCE MARKETING');
-- INSERT INTO Certifications VALUES (12, 'DUT');
-- INSERT INTO Certifications VALUES (12, 'CAP');
-- INSERT INTO Certifications VALUES (14, 'BREVET');

INSERT INTO Missions Values (0, '2023-01-16', '2024-06-03', 'annule', '1', 0, 'Caissier');
INSERT INTO Missions Values (1, '2022-05-14', '2022-09-30', 'termine', '5', 1, 'Réceptionniste');
INSERT INTO Missions Values (2, '2023-01-11', '2023-12-29', 'en_cours', '3', 2, 'Cadre');
INSERT INTO Missions Values (3, '2024-01-02', '2024-06-30', 'en_attente', '2', 9, 'Secrétaire');
INSERT INTO Missions Values (4, '2023-12-14', '2024-11-30', 'en_attente', '6', 14, 'Caissier');
-- INSERT INTO Missions Values (5, '2020-04-14', '2020-07-30', 'annule', 4, 5, 'Développeur web');
-- INSERT INTO Missions Values (6, '2021-06-14', '2021-08-30', 'en_cours', 6, 6, 'Stagiaire');
-- INSERT INTO Missions Values (7, '2021-08-14', '2021-10-30', 'en_attente', 5, 7, 'Manager');
-- INSERT INTO Missions Values (8, '2021-12-14', '2022-02-30', 'en_cours', 4, 8, 'Analyste');
-- INSERT INTO Missions Values (9, '2022-01-14', '2022-03-30', 'termine', 3, 9, 'Consultant');
-- INSERT INTO Missions Values (10, '2022-04-14', '2022-06-30', 'en_attente', 2, 10, 'Technicien');
-- INSERT INTO Missions Values (11, '2023-07-14', '2023-09-30', 'en_cours', 6, 11, 'Comptable');
-- INSERT INTO Missions Values (12, '2023-10-14', '2023-12-30', 'termine', 5, 12, 'Conseiller');
-- INSERT INTO Missions Values (13, '2024-01-14', '2024-03-30', 'en_attente', 4, 13, 'Animateur');

INSERT INTO Contrats Values (0, 0);
INSERT INTO Contrats Values (1, 2);
INSERT INTO Contrats Values (1, 3);
INSERT INTO Contrats Values (3, 4);
-- INSERT INTO Contrats Values (4, 1);
-- INSERT INTO Contrats Values (4, 4);
-- INSERT INTO Contrats Values (4, 7);
-- INSERT INTO Contrats Values (5, 6);
-- INSERT INTO Contrats Values (6, 9);
-- INSERT INTO Contrats Values (7, 8);
-- INSERT INTO Contrats Values (8, 11);
-- INSERT INTO Contrats Values (9, 10);
-- INSERT INTO Contrats Values (10, 13);
-- INSERT INTO Contrats Values (11, 12);
-- INSERT INTO Contrats Values (12, 14);

