
import inquirer
import re
import sqlite3

from utils import cli
from utils import tables
from utils import db


def display (conn) :
    """
    Dislay a table or a column (depend on user choices)
    """

    # User select a table
    table_name = cli.select_table(conn)

    # Ask the user if he wants to display the table or a column
    user_choice = cli.selection_menu(inquirer.List(
            "choice",
            message="Do you want to display the full table or only a column ?",
            choices=["FULL TABLE", "ONLY A COLUMN"],
        ))

    if (user_choice == "FULL TABLE") :
        cli.display_table(conn, table_name)

    if (user_choice == "ONLY A COLUMN") :
        # User select a column
        column_name = cli.select_column(conn, table_name)
        cli.display_column(conn, table_name, column_name)

        
def free (conn) :
    """
    Allow the user to write the command of his choice in an editor
    """
    text = inquirer.prompt([inquirer.Editor('text', message="Write the command in your editor")])

    # Remove \n
    request = text['text'].strip()

    # Execute request
    cur = conn.cursor()
    cur.execute(request)

    print()
    cli.display_success(request)

    # Apply changes
    conn.commit()


def views (conn) :
    """
    Allow the user to write the command of his choice in an editor
    """

    request = "SELECT * FROM list_diplomes"

    # Execute request
    cur = conn.cursor()

    cur.execute(request)
    print(cur.fetchall())

    print()
    cli.display_success(request)

    # Apply changes
    conn.commit()


def insert (conn) :
    """
    Ask the user to insert a row in the table of his choice
    """

    # User select a table
    table_name = cli.select_table(conn)

    # Ask the user to fill all fields
    values = inquirer.prompt([
                                  inquirer.Text(column, message=f"Fill {column}" )
                                  for column in tables.columns_name(conn, table_name)
                              ])
    db.insert_in_db (conn, table_name, [values[key] for key in values.keys()])


def delete (conn: sqlite3.Connection) :
    """
    Allow user to delete rows from a table
    """

    # User select a table
    table_name = cli.select_table(conn)

    # Get all rows
    cur = conn.cursor()
    cur.execute(f"SELECT * FROM {table_name}")
    rows = cur.fetchall()

    user_choices = cli.selection_menu(inquirer.Checkbox(
            "choice",
            message="Choose rows to delete",
            choices=[[col for col in row] for row in rows],
        ))

    db.delete_rows(conn, table_name, user_choices)


def update (conn: sqlite3.Connection) :
    """
    Allow user to update a row from the table
    """

    # Select a table, a row and a column
    table_name = cli.select_table(conn)
    row = cli.select_row(conn, table_name)
    column_name = cli.select_column(conn, table_name)

    # Ask the user to give the new value of the field
    value = inquirer.prompt([
                                  inquirer.Text(column_name, message=f"Give {column_name} a new value" )
                              ])

    db.update_row(conn, table_name, row, value)


def reset (conn) :
    """
    Ask the user for a confirmation before reseting DB
    """
    if (cli.ask_confirmation(conn, "Are you sure to reset the database ?")) :
        db.mise_a_jour_bd(conn, "data/creation.sql")
        db.mise_a_jour_bd(conn, "data/views.sql")
        db.mise_a_jour_bd(conn, "data/inserts_ok.sql")


