

-- Return employes who does not have a mission
DROP VIEW IF EXISTS list_users_without_mission;
CREATE VIEW list_users_without_mission
AS
  SELECT id_employe, nom_employe, prenom_employe
  FROM Employes
  WHERE (id_employe NOT IN (
    SELECT id_employe
    FROM Contrats
  ));
