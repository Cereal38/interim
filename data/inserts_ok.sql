-- Jeux de données OK (ça doit marcher)

-- ATTENTION : On insert les entiers / rééls (autres que les PK) comme des chaînes de caractères pour
-- pouvoir les véifier avec les regexs inscrites dans les CHECKs à la création

INSERT INTO Diplomes VALUES ('Licence IMA', '3');
INSERT INTO Diplomes VALUES ('Licence STAPS', '3');
INSERT INTO Diplomes VALUES ('BAC S', '3');
INSERT INTO Diplomes VALUES ('BREVET', '1');
INSERT INTO Diplomes VALUES ('MASTER WEB', '5');
INSERT INTO Diplomes VALUES ('BTS MARKETING', '2');

INSERT INTO Clients VALUES (0, 'Carrefour', '0412345678', 'contact@carrefour.com');
INSERT INTO Clients VALUES (1, 'Leroy Merlin', '0422345678', 'contact@leroymerlin.fr');
INSERT INTO Clients VALUES (2, 'Boulanger', '0432345678', 'contact@boulanger.com');
INSERT INTO Clients VALUES (9, 'SNCF', '0403345678', 'contact@sncf.fr');
INSERT INTO Clients VALUES (3, 'Cdiscount', '0442345678', 'contact@cdiscount.com');
INSERT INTO Clients VALUES (14, 'Bouygues', '0453345678', 'contact@bouygues.com');

INSERT INTO TypesMissions VALUES ('Caissier', '1200.63', 'BREVET');
INSERT INTO TypesMissions VALUES ('Réceptionniste', '1500.94', 'BAC S');
INSERT INTO TypesMissions VALUES ('Cadre', '3500', 'MASTER WEB');
INSERT INTO TypesMissions VALUES ('Secrétaire', '2000', 'BTS MARKETING');
INSERT INTO TypesMissions VALUES ('Coach', '2000', 'Licence STAPS');

INSERT INTO Employes VALUES (0, 'Martin', 'Paul', '0412346789', 'paul.martin@gmail.com');
INSERT INTO Employes VALUES (1, 'Durand', 'Jacques', '0412345678', 'jacques.durand@gmail.com');
INSERT INTO Employes VALUES (2, 'Dupont', 'Pierre', '0412341234', 'pierre.dupont@gmail.com');
INSERT INTO Employes VALUES (3, 'Berger', 'Marc', '0412345123', 'marc.berger@gmail.com');
INSERT INTO Employes VALUES (4, 'Legrand', 'Nathalie', '0412344567', 'nathalie.legrand@gmail.com');

INSERT INTO Certifications VALUES (0, 'Licence IMA');
INSERT INTO Certifications VALUES (0, 'BREVET');
INSERT INTO Certifications VALUES (1, 'BREVET');
INSERT INTO Certifications VALUES (2, 'BAC S');
INSERT INTO Certifications VALUES (3, 'BAC S');
INSERT INTO Certifications VALUES (3, 'BREVET');
INSERT INTO Certifications VALUES (4, 'BTS MARKETING');

INSERT INTO Missions Values (0, '2023-01-16', '2024-06-03', 'annule', '1', 0, 'Caissier');
INSERT INTO Missions Values (1, '2022-05-14', '2022-09-30', 'termine', '5', 1, 'Réceptionniste');
INSERT INTO Missions Values (2, '2023-01-11', '2023-12-29', 'en_cours', '3', 2, 'Cadre');
INSERT INTO Missions Values (3, '2024-01-02', '2024-06-30', 'en_attente', '2', 9, 'Secrétaire');
INSERT INTO Missions Values (4, '2023-12-14', '2024-11-30', 'en_attente', '6', 14, 'Caissier');

INSERT INTO Contrats Values (0, 0);
INSERT INTO Contrats Values (1, 2);
INSERT INTO Contrats Values (1, 3);
INSERT INTO Contrats Values (3, 4);

