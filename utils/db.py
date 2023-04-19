
import sqlite3
from typing import List

from utils import tables


def creer_connexion(db_file):
    """Crée une connexion a la base de données SQLite spécifiée par db_file

    :param db_file: Chemin d'accès au fichier SQLite
    :return: Objet connexion ou None
    """

    try:
        conn = sqlite3.connect(db_file)
        # On active les foreign keys
        conn.execute("PRAGMA foreign_keys = 1")
        return conn
    except sqlite3.Error as e:
        print(e)

    return None


def mise_a_jour_bd(conn: sqlite3.Connection, file: str):
    """Exécute sur la base de données toutes les commandes contenues dans le
    fichier fourni en argument.

    Les commandes dans le fichier `file` doivent être séparées par un
    point-virgule.

    :param conn: Connexion à la base de données
    :type conn: sqlite3.Connection
    :param file: Chemin d'accès au fichier contenant les requêtes
    :type file: str
    """

    # Lecture du fichier et placement des requêtes dans un tableau
    sqlQueries = []

    with open(file, 'r') as f:
        createSql = f.read()
        sqlQueries = createSql.split(";")

    # Exécution de toutes les requêtes du tableau
    cursor = conn.cursor()
    for query in sqlQueries:
        cursor.execute(query)

    # Validation des modifications
    conn.commit()


def db_is_empty (conn: sqlite3.Connection) :
    """
    Return True if db is empty
    """

    try:
        cursor = conn.cursor()

        # Count number of objects in DB
        cursor.execute("SELECT COUNT(*) FROM sqlite_master")
        count = cursor.fetchone()[0]

        if (count == 0) :
            return True
        else :
            return False

    except sqlite3.Error as e:
        print(e)
        return False


def insert_in_db (conn: sqlite3.Connection, table_name: str, values: List[str]) :
    """
    INSERT one row in db
    """
    cur = conn.cursor()

    request = "INSERT INTO " + table_name + " VALUES ('" + "', ".join(values) + ")"

    cur.execute(request)
