
DROP TABLE IF EXISTS Certifications;
DROP TABLE IF EXISTS Contrats;
DROP TABLE IF EXISTS Employes;
DROP TABLE IF EXISTS Missions;
DROP TABLE IF EXISTS TypesMissions;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Diplomes;


CREATE TABLE Missions (
    id_mission INTEGER PRIMARY KEY,
    date_debut_mission TEXT NOT NULL,
    date_fin_mission TEXT NOT NULL,
    statut_mission TEXT NOT NULL,
    nb_postes_mission INTEGER NOT NULL,
    id_client_mission INTEGER NOT NULL,
    type_mission TEXT NOT NULL,
    FOREIGN KEY (id_client_mission) REFERENCES Clients (id_client)
);

CREATE TABLE Clients (
    id_client INTEGER PRIMARY KEY,
    nom_client TEXT NOT NULL,
    telephone_client TEXT NOT NULL,
    email_client TEXT NOT NULL
);

CREATE TABLE Employes (
    id_employe INTEGER PRIMARY KEY,
    nom_employe TEXT NOT NULL,
    prenom_employe TEXT NOT NULL,
    telephone_employe TEXT NOT NULL,
    email_employe TEXT NOT NULL
);

CREATE TABLE Contrats (
    id_mission INTEGER NOT NULL,
    id_employe INTEGER NOT NULL,
    PRIMARY KEY (id_mission, id_employe),
    FOREIGN KEY (id_mission) REFERENCES Missions (id_mission),
    FOREIGN KEY (id_employe) REFERENCES Employes (id_employe)
);

CREATE TABLE TypesMissions (
    nom_types_mission TEXT PRIMARY KEY,
    salaire_types_mission REAL NOT NULL,
    diplome_types_mission TEXT NOT NULL,
    FOREIGN KEY (diplome_types_mission) REFERENCES Diplomes (nom_diplome)
);

CREATE TABLE Diplomes (
    nom_diplome TEXT PRIMARY KEY,
    nb_annee_diplome INTEGER NOT NULL
);

CREATE TABLE Certifications (
    id_employe INTEGER NOT NULL,
    nom_diplome TEXT NOT NULL,
    PRIMARY KEY (id_employe, nom_diplome),
    FOREIGN KEY (id_employe) REFERENCES Employes (id_employe),
    FOREIGN KEY (nom_diplome) REFERENCES Diplomes (nom_diplome)
);

