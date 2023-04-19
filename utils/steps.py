
import inquirer

from utils import cli


def display (conn) :
    """
    Dislay a table or a column
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

