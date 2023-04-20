
-- CREATE TRIGGER test_trigger AFTER DELETE ON Employes
-- BEGIN
--     INSERT INTO Diplomes VALUES ('DELETED', '1');
-- END;

CREATE VIEW IF NOT EXISTS list_diplomes
AS
  SELECT nom_diplome
  FROM Diplomes;
