
import inquirer
import tabulate
import sqlite3

from utils import tables


def selection_menu (choices: inquirer.List) :
    """
    Display a list of choices and ask the user to choose one of them
    Calling this function must look like it :
        cli.selection_menu(inquirer.List(
                "choice", # Always give "choice" here
                message="Here is the message to display",
                choices=["CHOICE 1", "CHOICE 2", "CHOICE 3"],
            ))
    """

    questions = [choices]
    answers = inquirer.prompt(questions)

    return (answers['choice'])


def select_table (conn) :
    """
    Ask the user to choose a table and return the name
    """
    return selection_menu(inquirer.List(
            "choice",
            message="Select a table",
            choices=[table for table in tables.tables_name(conn)],
        ))

def select_column (conn: sqlite3.Connection, table_name: str) :
    """
    Ask the user to choose a column in the given table and return the name
    """
    return selection_menu(inquirer.List(
            "choice",
            message="Choose a column",
            choices=tables.columns_name(conn, table_name),
        ))


def select_row (conn: sqlite3.Connection, table_name: str) :
    """
    Ask the user to choose a row in the given table and return it
    """
    # Get all rows
    cur = conn.cursor()
    cur.execute(f"SELECT * FROM {table_name}")
    rows = cur.fetchall()

    return selection_menu(inquirer.List(
            "choice",
            message="Choose a column",
            choices=[[col for col in row] for row in rows],
        ))


def ask_confirmation (conn: sqlite3.Connection, message: str) :
    """
    Ask the user to confirm
    Return True if confirm
    """
    choice = selection_menu(inquirer.List(
            "choice",
            message=message,
            choices=["YES", "NO"],
        ))

    return choice == "YES"


def display_table (conn: sqlite3.Connection, table_name: str):
    """
    Display all items of the asked table
    """
    cur = conn.cursor()

    cur.execute(f"SELECT * FROM {table_name}")

    rows = cur.fetchall()

    print(tabulate.tabulate(rows, tables.columns_name(conn, table_name), tablefmt='grid'))


def display_column (conn: sqlite3.Connection, table_name: str, column_name: str):
    """
    Display all items of the asked column
    """
    cur = conn.cursor()

    cur.execute(f"SELECT {column_name} FROM {table_name}")

    rows = cur.fetchall()

    print(tabulate.tabulate(rows, [column_name], tablefmt='grid'))


def display_success (text: str) :
    """
    Display a text in a green color
    """
    print(f"    \033[92m✓ {text}\033[0m""")


def display_error (text: str) :
    """
    Display a text in a red color
    """
    print(f"    \033[91mX {text}\033[0m""")
