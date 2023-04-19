#!/usr/bin/python3

import inquirer
# import re

from utils import db
from utils import cli


def main():
    # Nom de la BD à créer
    db_file = "data/voile.db"

    # Créer une connexion a la BD
    conn = db.creer_connexion(db_file)

    # Remplir la BD
    print("1. On crée la bd et on l'initialise avec des premières valeurs.")
    db.mise_a_jour_bd(conn, "data/voile_creation.sql")
    db.mise_a_jour_bd(conn, "data/voile_inserts_ok.sql")

    while (True) :

        # Ask the user for the action he wants
        user_choice = cli.selection_menu(inquirer.List(
                "choice",
                message="What do you want to do ?",
                choices=["DISPLAY", "INSERT", "DELETE", "UPDATE", "EXIT"],
            ))

        # questions = [
        #   inquirer.Text('name', message="What's your name"),
        #   inquirer.Text('surname', message="What's your surname"),
        #   inquirer.Text('phone', message="What's your phone number",
        #                 validate=lambda _, x: re.match('\+?\d[\d ]+\d', x),
        #                 )
        # ]
        # answers = inquirer.prompt(questions)

        if (user_choice == "EXIT") :
            print("Thank for using our program !")
            return

        # If user want to display a table, ask for which one
        if (user_choice == "DISPLAY") :
            user_choice = cli.selection_menu(inquirer.List(
                    "choice",
                    message="Select a table",
                    choices=["Missions", "Clients", "Employes", "Diplomes", "Certifications", "TypesMissions"],
                ))
            db.display_table(conn, user_choice)


if __name__ == "__main__":
    main()
