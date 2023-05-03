

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


-- Return missions with status 'en_attente' and give some infos
DROP VIEW IF EXISTS list_pending_missions;
CREATE VIEW list_pending_missions
AS
  SELECT id_mission, date_debut_mission, date_fin_mission, type_mission, salaire_type_mission, diplome_type_mission
  FROM Missions
  JOIN TypesMissions ON (Missions.type_mission = TypesMissions.nom_types_mission)
  WHERE (statut_mission = 'en_attente');


-- Return the number of employe of each client
DROP VIEW IF EXISTS employes_number_of_each_client;
CREATE VIEW employes_number_of_each_client
AS
  SELECT id_client, nom_client, COUNT(id_employe) AS count_employes
  FROM Clients
  JOIN Missions ON (Clients.id_client = Missions.id_client_mission)
  JOIN Contrats USING (id_mission)
  GROUP BY id_mission
  UNION
  -- Add client who does not have any missions / any contract for their missions
  SELECT id_client, nom_client, 0 AS count_employes
  FROM Clients
  WHERE (id_client NOT IN (
      SELECT id_client_mission
      FROM Missions
      JOIN Contrats USING (id_mission)
  ));

