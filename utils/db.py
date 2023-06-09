
import sqlite3
import re
from typing import List

from utils import tables
from utils import cli


def regexp(expr, item) :
    reg = re.compile(expr)
    return reg.search(item) is not None


def creer_connexion(db_file):
    """Crée une connexion a la base de données SQLite spécifiée par db_file

    :param db_file: Chemin d'accès au fichier SQLite
    :return: Objet connexion ou None
    """

    try:
        conn = sqlite3.connect(db_file)
        # On active les foreign keys
        conn.execute("PRAGMA foreign_keys = 1")
        # Add regexp fonction
        conn.create_function('REGEXP', 2, regexp)
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
    INSERT one row in DB
    """
    cur = conn.cursor()

    request = "INSERT INTO " + table_name + " VALUES ("
    for i in range (len(values)) :

        if (i < len(values)-1) :
            request += "'" + values[i] + "', "
        else :
            request += "'" + values[i] + "')"

    # Execute request and display it on success
    cur.execute(request)
    print()
    conn.commit()
    cli.display_success(request)


def delete_rows (conn: sqlite3.Connection, table_name: str, rows: List[List]) :
    """
    DELETE rows in DB
    """

    # Return if the list of rows to delete is empty
    if (len(rows) == 0) :
        return

    cur = conn.cursor()

    # Get columns name of table
    headers = tables.columns_name(conn, table_name)

    all_requests = ''

    # Do a request for each row
    for row in rows :

        # Build the request
        request = "DELETE FROM " + table_name + " WHERE ("
        for i in range (len(row)) :
            request += headers[i] + " = "
            request += "\'" + str(row[i]) + "\'"
            if (i < len(headers)-1) :
                request += " AND "
        request += ");"

        # Execute request and display it on success
        all_requests += request + "\n"
        cur.execute(request)
        cli.display_success(request)

    # Apply changes
    conn.commit()


def update_row (conn: sqlite3.Connection, table_name: str, row: List[List], value: str) :
    """
    UDPATE a row in DB
    """

    cur = conn.cursor()

    # Get columns name of table
    headers = tables.columns_name(conn, table_name)

    # Build the request
    request = "UPDATE " + table_name
    request += " SET " + list(value.keys())[0] + " = \'" + str(value[list(value.keys())[0]]) + "\'"
    request += " WHERE ("
    for i in range (len(row)) :
        request += headers[i] + " = "
        request += "\"" + str(row[i]) + "\""
        if (i < len(headers)-1) :
            request += " AND "
    request += ")"

    # Execute request and display it on success
    cur.execute(request)
    print()
    conn.commit()
    cli.display_success(request)
