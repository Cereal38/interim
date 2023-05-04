
import inquirer
import re
import sqlite3
import tabulate

from utils import cli
from utils import tables
from utils import db


def display(conn: sqlite3.Connection):
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

    if (user_choice == "FULL TABLE"):
        cli.display_table(conn, table_name)

    if (user_choice == "ONLY A COLUMN"):
        # User select a column
        column_name = cli.select_column(conn, table_name)
        cli.display_column(conn, table_name, column_name)


def customized_commands(conn: sqlite3.Connection):
    """
    Allow the user to execute a customized command
    """

    cur = conn.cursor()
    request = ''

    # Ask the user to fill all fields
    user_choice = cli.selection_menu(inquirer.List(
            "choice",
            message="Choose a request",
            choices=[
                "GET SALARY OF AN EMPLOYE",
                "GET ALL MISSION OF A CLIENT",
                "GET ALL DIPLOMAS OF AN EMPLOYE",
                ],
        ))

    if (user_choice == "GET SALARY OF AN EMPLOYE"):
        
        value = inquirer.prompt([
                                  inquirer.Text('id_employe', message=f"Give the id of the employe" )
                              ])

        request = f"""
          SELECT id_employe, SUM(salaire_type_mission) as salaire_employe
          FROM Employes JOIN Contrats USING (id_employe)
                        JOIN Missions USING (id_mission)
                        JOIN TypesMissions ON (Missions.type_mission = TypesMissions.nom_types_mission)
          GROUP BY (id_employe)
          HAVING (id_employe = {value['id_employe']});
        """
        columns = ["id_employe", "salaire_employe"]

        # Execute request
        cur.execute(request)
        rows = cur.fetchall()
    
    if (user_choice == "GET ALL MISSION OF A CLIENT") :
        pass
    
    print(tabulate.tabulate(rows, columns, tablefmt='grid'))

        
def free (conn: sqlite3.Connection) :
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


def views (conn: sqlite3.Connection) :
    """
    Allow the user to display the result of an existing request (Created in data/views.sql)
    """

    cur = conn.cursor()
    request = ''
    columns = []
    rows = []
    
    user_choice = cli.selection_menu(inquirer.List(
            "choice",
            message="Choose a request to execute",
            choices=[
                "EMPLOYES WITHOUT MISSION",
                "PENDING MISSIONS",
                "COUNT EMPLOYES OF EACH CLIENT",
                ],
        ))

    if (user_choice == "EMPLOYES WITHOUT MISSION") :

        request = "SELECT * FROM list_users_without_mission"
        columns = ["id_employe", "nom_employe", "prenom_employe"]

        # Execute request
        cur.execute(request)
        rows = cur.fetchall()

    if (user_choice == "PENDING MISSIONS") :

        request = "SELECT * FROM list_pending_missions"
        columns = [
                "id_mission",
                "date_debut_mission",
                "date_fin_mission",
                "type_mission",
                "salaire_type_mission",
                "diplome_type_mission",
                ]

        # Execute request
        cur.execute(request)
        rows = cur.fetchall()
        
    if (user_choice == "COUNT EMPLOYES OF EACH CLIENT") :

        request = "SELECT * FROM employes_number_of_each_client"
        columns = [
                "id_client",
                "nom_client",
                "count_employes",
                ]


        # Execute request
        cur.execute(request)
        rows = cur.fetchall()

    # Display result
    print(tabulate.tabulate(rows, columns, tablefmt='grid'))


def insert (conn: sqlite3.Connection) :
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


