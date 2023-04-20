#!/usr/bin/python3

import inquirer
import os

from utils import db
from utils import cli
from utils import tables
from utils import steps


def main():

    # Nom de la BD
    db_file = "data/interim.db"
# Créé une connexion a la BD
    conn = db.creer_connexion(db_file)

    # If DB is empty, init it
    if (db.db_is_empty(conn)) :

        db.mise_a_jour_bd(conn, "data/creation.sql")
        db.mise_a_jour_bd(conn, "data/views.sql")
        db.mise_a_jour_bd(conn, "data/inserts_ok.sql")

    while (True) :

        # Clear the screen
        os.system('clear')

        # Ask the user for the action he wants
        user_choice = cli.selection_menu(inquirer.List(
                "choice",
                message="Choose an action",
                choices=["DISPLAY", "FREE", "VIEWS", "INSERT", "DELETE", "UPDATE", "RESET", "EXIT"],
            ))


        try :
            if (user_choice == "DISPLAY") :
                steps.display(conn)


            if (user_choice == "FREE") :
                steps.free(conn)

            if (user_choice == "VIEWS") :
                steps.views(conn)

            if (user_choice == "INSERT") :
                steps.insert(conn)


            if (user_choice == "DELETE") :
                steps.delete(conn)

            if (user_choice == "UPDATE") :
                steps.update(conn)

            
            if (user_choice == "RESET") :
                steps.reset(conn)


            if (user_choice == "EXIT") :
                print("Thank you for using our program !")
                conn.close()
                return


        except Exception as e:
            cli.display_error('AN ERROR OCCURED')
            cli.display_error(e)


        # Ask a user input before looping
        print("\nPress ENTER to continue...")
        input()


if __name__ == "__main__":
    main()

