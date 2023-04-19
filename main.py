#!/usr/bin/python3

import inquirer
import os
# import re

from utils import db
from utils import cli
from utils import tables


def main():

    # Nom de la BD à créer
    db_file = "data/interim.db"

    # Créer une connexion a la BD
    conn = db.creer_connexion(db_file)

    # Remplir la BD
    # print("1. On crée la bd et on l'initialise avec des premières valeurs.")
    db.mise_a_jour_bd(conn, "data/creation.sql")
    db.mise_a_jour_bd(conn, "data/inserts_ok.sql")

    while (True) :

        # Ask the user for the action he wants
        user_choice = cli.selection_menu(inquirer.List(
                "choice",
                message="What do you want to do ?",
                choices=["DISPLAY", "INSERT", "DELETE", "UPDATE", "EXIT"],
            ))


        if (user_choice == "EXIT") :
            print("Thank for using our program !")
            return


        # If user want to display a table, ask for which one
        if (user_choice == "DISPLAY") :
            table_name = cli.selection_menu(inquirer.List(
                    "choice",
                    message="Select a table",
                    choices=[table for table in tables.tables_name(conn)],
                ))

            # Ask the user if he wants to display the table or a column
            user_choice = cli.selection_menu(inquirer.List(
                    "choice",
                    message="Do you want to display the full table or only a column ?",
                    choices=["FULL TABLE", "ONLY A COLUMN"],
                ))

            if (user_choice == "FULL TABLE") :
                db.display_table(conn, table_name)

            if (user_choice == "ONLY A COLUMN") :
                column_name = cli.selection_menu(inquirer.List(
                        "choice",
                        message="Choose a column",
                        choices=tables.columns_name(conn, table_name),
                    ))
                db.display_column(conn, table_name, column_name)


        # Ask a user input before clearing screen and loop
        print("\n\nPress ENTER to continue...")
        input()
        os.system('clear')


if __name__ == "__main__":
    main()

# user_choice = cli.selection_menu(inquirer.Checkbox(
#         "choice",
#         message="What do you want to do ?",
#         choices=["DISPLAY", "INSERT", "DELETE", "UPDATE", "EXIT"],
#     ))

# questions = [
#   inquirer.Text('name', message="What's your name"),
#   inquirer.Text('surname', message="What's your surname"),
#   inquirer.Text('phone', message="What's your phone number",
#                 validate=lambda _, x: re.match('\+?\d[\d ]+\d', x),
#                 )
# ]
# answers = inquirer.prompt(questions)

