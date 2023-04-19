import inquirer


def selection_menu(choices: inquirer.List) :
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


