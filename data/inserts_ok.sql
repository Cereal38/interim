-- Jeux de données OK (ça doit marcher)

INSERT INTO Diplomes VALUES ('Licence IMA', 3);
INSERT INTO Diplomes VALUES ('Licence STAPS', 3);
INSERT INTO Diplomes VALUES ('BAC S', 3);
INSERT INTO Diplomes VALUES ('BAC L', 3);
INSERT INTO Diplomes VALUES ('MASTER WEB', 5);

INSERT INTO Clients VALUES (0, 'Carrefour', '0412345678', 'contact@carrefour.com');

INSERT INTO TypesMissions VALUES ('Caissier', 1200, 'Licence IMA');

INSERT INTO Employes VALUES (0, 'Croft', 'Lara', '0612345678', 'laracroft@gmail.com');

INSERT INTO Certifications VALUES (0, 'Licence IMA');

INSERT INTO Missions Values (0, '2023-01-16', '2024-06-03', 'en_cours', 1, 0, 'Caissier');

INSERT INTO Contrats Values (0, 0);
