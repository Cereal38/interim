
import inquirer
import re

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


def reset (conn) :
    """
    Ask the user for a confirmation before reseting DB
    """
    if (cli.ask_confirmation(conn, "Are you sure to reset the database ?")) :
        db.mise_a_jour_bd(conn, "data/creation.sql")
        db.mise_a_jour_bd(conn, "data/inserts_ok.sql")


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

    # Apply changes
    conn.commit()
