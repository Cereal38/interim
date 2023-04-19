"""
Contains informations about tables in the db
"""

import sqlite3

def tables_name (conn) :

    # Connect to the database
    cursor = conn.cursor()

    # Get the list of table names
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
    tables = [row[0] for row in cursor.fetchall()]

    return tables

def columns_name (conn, table_name) :

    # Connect to the database
    cursor = conn.cursor()

    # Get the list of columns name
    cursor.execute(f"PRAGMA table_info({table_name})")
    columns = [row[1]for row in cursor.fetchall()]

    return columns

