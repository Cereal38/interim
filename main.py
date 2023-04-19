#!/usr/bin/python3

import inquirer
import os
# import re

from utils import db
from utils import cli
from utils import tables
from utils import steps


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

        # Clear the screen
        os.system('clear')

        # Ask the user for the action he wants
        user_choice = cli.selection_menu(inquirer.List(
                "choice",
                message="What do you want to do ?",
                choices=["DISPLAY", "INSERT", "DELETE", "UPDATE", "EXIT"],
            ))


        if (user_choice == "EXIT") :
            print("Thank you for using our program !")
            return


        # If user want to display a table, ask for which one
        if (user_choice == "DISPLAY") :
            steps.display(conn)


        # Ask a user input before looping
        print("\n\nPress ENTER to continue...")
        input()


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

