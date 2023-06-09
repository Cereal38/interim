
DROP TABLE IF EXISTS Certifications;
DROP TABLE IF EXISTS Contrats;
DROP TABLE IF EXISTS Employes;
DROP TABLE IF EXISTS Missions;
DROP TABLE IF EXISTS TypesMissions;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Diplomes;


CREATE TABLE Missions (
    id_mission INTEGER PRIMARY KEY,
    date_debut_mission DATE NOT NULL,
    date_fin_mission DATE NOT NULL,
    statut_mission TEXT NOT NULL,
    nb_postes_mission INTEGER NOT NULL,
    id_client INTEGER NOT NULL,
    type_mission TEXT NOT NULL,
    CONSTRAINT fk_missions_id_client FOREIGN KEY (id_client) REFERENCES Clients (id_client),
    CONSTRAINT fk_missions_type_mission FOREIGN KEY (type_mission) REFERENCES TypesMissions (nom_types_mission),
    CONSTRAINT ck_missions_id_missions CHECK (id_mission >= 0),
    CONSTRAINT ck_missions_dates CHECK (date_debut_mission <= date_fin_mission),
    CONSTRAINT ck_missions_status_mission CHECK (
      statut_mission = 'en_cours' OR
      statut_mission = 'en_attente' OR
      statut_mission = 'termine' OR
      statut_mission = 'annule'),
    CONSTRAINT ck_missions_date_debut_mission_regex CHECK (date_debut_mission REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'),
    CONSTRAINT ck_missions_date_fin_mission_regex CHECK (date_fin_mission REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'),
    CONSTRAINT ck_missions_nb_postes_mission_regex CHECK (nb_postes_mission REGEXP '^[0-9]+$')
);

CREATE TABLE Clients (
    id_client INTEGER PRIMARY KEY,
    nom_client TEXT NOT NULL,
    telephone_client TEXT NOT NULL,
    email_client TEXT NOT NULL,
    CONSTRAINT ck_clients_id_client CHECK (id_client >= 0)
    CONSTRAINT ck_employe_email_regex CHECK (email_client REGEXP "^[A-Za-z0-9_!#$%&'*+\/=?`{|}~^.-]+@[A-Za-z0-9.-]+$")
    CONSTRAINT ck_clients_telephone_regex CHECK (telephone_client REGEXP '^[0-9]{10}$')
);

CREATE TABLE Employes (
    id_employe INTEGER PRIMARY KEY,
    nom_employe TEXT NOT NULL,
    prenom_employe TEXT NOT NULL,
    telephone_employe TEXT NOT NULL,
    email_employe TEXT NOT NULL,
    CONSTRAINT ck_employe_id_employe CHECK (id_employe >= 0)
    CONSTRAINT ck_employe_email_regex CHECK (email_employe REGEXP "^[A-Za-z0-9_!#$%&'*+\/=?`{|}~^.-]+@[A-Za-z0-9.-]+$")
    CONSTRAINT ck_employe_telephone_regex CHECK (telephone_employe REGEXP '^[0-9]{10}$')
);

CREATE TABLE Contrats (
    id_mission INTEGER NOT NULL,
    id_employe INTEGER NOT NULL,
    CONSTRAINT pk_contrats PRIMARY KEY (id_mission, id_employe),
    CONSTRAINT fk_contrats_id_mission FOREIGN KEY (id_mission) REFERENCES Missions (id_mission),
    CONSTRAINT fk_contrats_id_mission FOREIGN KEY (id_employe) REFERENCES Employes (id_employe)
);

CREATE TABLE TypesMissions (
    nom_types_mission TEXT PRIMARY KEY,
    salaire_type_mission REAL NOT NULL,
    diplome_type_mission TEXT NOT NULL,
    CONSTRAINT fk_types_missions_diplome_types_mission FOREIGN KEY (diplome_type_mission) REFERENCES Diplomes (nom_diplome),
    CONSTRAINT ck_type_missions_salaire_type_mission CHECK (salaire_type_mission >= 0),
    CONSTRAINT ck_types_missions_salaire CHECK (salaire_type_mission REGEXP '^[0-9]*[.]?[0-9]*$')
);

CREATE TABLE Diplomes (
    nom_diplome TEXT PRIMARY KEY,
    nb_annee_diplome INTEGER NOT NULL,
    -- CONSTRAINT ck_diplomes_nb_annee_diplome CHECK (nb_annee_diplome >= 0),
    CONSTRAINT ck_diplomes_nb_annee_diplome CHECK (nb_annee_diplome REGEXP '^[0-9]{1,2}$')
);

CREATE TABLE Certifications (
    id_employe INTEGER NOT NULL,
    nom_diplome TEXT NOT NULL,
    CONSTRAINT pk_certifications PRIMARY KEY (id_employe, nom_diplome),
    CONSTRAINT fk_certifications_id_employe FOREIGN KEY (id_employe) REFERENCES Employes (id_employe),
    CONSTRAINT fk_certifications_nom_diplome FOREIGN KEY (nom_diplome) REFERENCES Diplomes (nom_diplome)
);

