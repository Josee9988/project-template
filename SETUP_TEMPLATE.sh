#!/bin/bash

#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
# SCRIPT:        SETUP_TEMPLATE.sh
# USAGE:         bash SETUP_TEMPLATE.sh | ./SETUP_TEMPLATE.sh
# PURPOSE:       Shell script that setups the @Josee9988/project-template github project template.
#                It detects the user's GitHub username, email and project name,
#                then it prompts for the type of project that it is. All the data can be manually specified using the
#                script optional arguments. For more information please execute the script with the '--help' flag.
#                After it will customize all the files with the user's data, and remove some files and folders,
#                even this own script.
# TITLE:         SETUP_TEMPLATE
# AUTHOR:        @Josee9988
# VERSION:       See in CHANGELOG.md
# NOTES:         This script will auto remove itself, and in case of wanting to run it again, the user must download
#                it again or do a 'git stash' and revert the changes.
# BASH_VERSION:  5.1.4(1)-release (x86_64-pc-linux-gnu)
# LICENSE:       see in LICENSE (project root) or https://github.com/Josee9988/project-template/blob/master/LICENSE
# GITHUB:        https://github.com/Josee9988/
# REPOSITORY:    https://github.com/Josee9988/project-template
# ISSUES:        https://github.com/Josee9988/project-template/issues
# MAIL:          jgracia9988@gmail.com
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

RED='\033[1;31m'                                     # color red
NAME_AND_PROJECT_UNPARSED=$(git ls-remote --get-url) # READ GITHUB USERNAME AND GITHUB PROJECT NAME
NEW_USERNAME=$(echo "$NAME_AND_PROJECT_UNPARSED" | cut -d':' -f 2 | cut -d'/' -f 1)
PROJECT_NAME=$(echo "$NAME_AND_PROJECT_UNPARSED" | cut -d'/' -f 2 | cut -d'.' -f 1)
NEW_EMAIL=$(git config user.email)
TEMP_TEST_OUTPUT=".ignore.test_output.txt"
PROJECT_TYPE="repository" # default value if not specified
will_omit_verification=false
will_omit_commit=false
will_omit_test=false
SCRIPT_VERSION="1.11.0"

FILE_FUNCTION_HELPERS=bin/FUNCTION_HELPERS.sh

if [ ! -f "$FILE_FUNCTION_HELPERS" ]; then # check if the function helpers file is not found
  echo -e "${RED}X Can not find ${FILE_FUNCTION_HELPERS}"
  exit 1 # it will exit if the function helpers file is not found
else
  # shellcheck source=bin/FUNCTION_HELPERS.sh disable=SC1091
  source $FILE_FUNCTION_HELPERS || exit 1 # obtain some global functions and variables, if the file isn't found exit
fi

# PARSE THE ARGUMENTS
for i in "$@"; do
  case $i in
  -u=* | --user=* | --username=* | --name=*)
    NEW_USERNAME="${i#*=}"
    shift # past argument=value
    ;;
  -p=* | --project=* | --project-name=* | --project_name=* | --projectName=*)
    PROJECT_NAME="${i#*=}"
    shift # past argument=value
    ;;
  -e=* | --email=* | --mail=*)
    NEW_EMAIL="${i#*=}"
    shift # past argument=value
    ;;
  -t=* | --type=* | --project_type=* | --projectType=*)
    PROJECT_TYPE="${i#*=}"
    shift # past argument=value
    ;;
  -h | --help | --info | --information)
    displayHelpTexts
    exit 0
    shift # past argument=value
    ;;
  -v | --version)
    echo -e "${GREEN}$SCRIPT_VERSION${NC}"
    exit 0
    shift # past argument=value
    ;;
  -o | --omit | --omit-commit-and-confirmation)
    echo -e "${BBLUE}X Deprecated:${NC} The arguments '--omit-commit-and-confirmation', '-o' and '--omit' are ${RED}deprecated${NC}. Use '--omit-verification' and/or ' --omit-commit' instead."
    will_omit_verification=true
    will_omit_commit=true
    choice="y"
    shift # past argument with no value
    ;;
  --omit-verification)
    will_omit_verification=true
    choice="y"
    shift # past argument with no value
    ;;
  --omit-commit)
    will_omit_commit=true
    shift # past argument with no value
    ;;
  --omit-test-check | --omit-tests-check | --omit-tests)
    will_omit_test=true
    shift # past argument with no value
    ;;
  *) # unknown option
    echo -e "${RED}X Unknown option:${NC} '${i}', type the flag '${BBLUE}--help${NC}' to view all the options and flags."
    ;;
  esac
done

echo -e "Thanks for using ${GREEN}@Josee9988/project-template${NC}"
echo -e "Read carefully all the documentation before you continue executing this script: ${UPURPLE}https://github.com/Josee9988/project-template${NC}\n"

bash tests/TESTS_RUNNER.sh >/dev/null 2>&1 # PERFORM the TESTS

if [ "$?" -eq 1 ] && [ $will_omit_test = false ]; then # if when running the tests any error was found
  rm "$TEMP_TEST_OUTPUT" 2>/dev/null || :
  displayTestErrorTexts
  exit 1
fi

rm "$TEMP_TEST_OUTPUT" 2>/dev/null || :

if [ "$PROJECT_TYPE" = "repository" ]; then # if the project's type has not been manually specified
  read -p "Enter $(echo -e "$BBLUE""what your project is""$NC") (program/extension/API/web/CLI tool/backend/frontend/scrapper/automation tool/etc): " PROJECT_TYPE
fi

if [ $will_omit_verification = false ]; then # if the ignore flag has not been manually specified
  read -p "Is this data correct: username \"$(echo -e "$GREEN""$NEW_USERNAME""$NC")\", email: \"$(echo -e "$GREEN""$NEW_EMAIL""$NC")\", project name: \"$(echo -e "$GREEN""$PROJECT_NAME""$NC")\", of type: \"$(echo -e "$GREEN""$PROJECT_TYPE""$NC")\" (y/n)? " choice
fi

# confirm that the data is correct
case "$choice" in
y | Y)
  center "Setting everything up for you ;)"

  # replace the username and email
  find .github/ -type f -name "*" -print0 | xargs -0 sed -i "s/Josee9988/${NEW_USERNAME}/g"
  find .github/ -type f -name "*" -print0 | xargs -0 sed -i "s/jgracia9988@gmail.com/${NEW_EMAIL}/g"
  find .github/ -type f -name "*" -print0 | xargs -0 sed -i "s/project-template/${PROJECT_NAME}/g"
  find .gitignore -type f -name "*" -print0 | xargs -0 sed -i "s/Josee9988\/project-template/${NEW_USERNAME}\/${PROJECT_NAME}/g"

  rm LICENSE                                                  # remove the license
  rm -r bin/                                                  # remove the bin folder
  rm -r tests/ 2>/dev/null || :                               # remove the tests folder
  rm -r .github/workflows/ 2>/dev/null || :                   # remove the workflow folder
  writeREADME                                                 # write the new README.md
  writeCHANGELOG                                              # write the basic structure of the CHANGELOG.md
  echo -e "# add your own funding links" >.github/FUNDING.yml # remove author's custom funding links

  if [ $will_omit_commit = false ]; then                                                  # if the ignore option for tests has been specified
    git add CHANGELOG.md README.md .gitignore .github SETUP_TEMPLATE.sh LICENSE bin tests # commit the new files
    git -c color.status=always status | less -REX                                         # show git status with colours
    echo -e "Committing the changes for you :)\n"
    git commit -m "Set up '@Josee9988/project-template' template: Personalized files by executing the SETUP_TEMPLATE.sh script.🚀"
    echo -e "\nRemember to review every file and customize it as you like.\nYou are ready to start your brand new awesome project🚀🚀." else
  fi

  # self remove this script
  rm -- "$0"
  ;;
n | N)
  echo -e "\nIf your username, project name or email were NOT right, you can manually change them. Read how to do it with the script's help: ${UPURPLE}bash SETUP_TEMPLATE.sh --help${NC}\n"
  ;;
*) echo -e "${RED}X Invalid option${NC}" ;;
esac

exit 0
