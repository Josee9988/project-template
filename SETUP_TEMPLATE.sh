#!/bin/bash

#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
# SCRIPT:        SETUP_TEMPLATE.sh
# USAGE:         bash SETUP_TEMPLATE.sh | ./SETUP_TEMPLATE.sh
# PURPOSE:       Shell script that prompts the user for their GitHub username, email name of their project and
#                the type of project that it is. Then it will replace the author's (josee9988) username and email
#                with the new ones (the user that is using this template). It will fully remove the LICENSE file,
#                delete all of the content of the README.md file, and add a simple header,
#                delete all of the content of the CHANGELOG.md and add a basic CHANGELOG versioning and 1st version,
#                then this script will auto remove itself, to leave the new project without this file (SETUP_TEMPLATE.sh).
# TITLE:         SETUP_TEMPLATE
# AUTHOR:        Jose Gracia
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

RED='\033[1;31m'
NC='\033[0m' # No Color
UPurple='\033[4;35m'
BBLUE='\033[1;34m'
GREEN='\033[1;32m'
OMIT_STR="--omit-commit-and-confirmation"
will_omit_commit_and_confirmation=false
NAME_AND_PROJECT_UNPARSED=$(git ls-remote --get-url) # READ GITHUB USERNAME AND GITHUB PROJECT NAME
NEW_USERNAME=$(echo "$NAME_AND_PROJECT_UNPARSED" | cut -d':' -f 2 | cut -d'/' -f 1)
PROJECT_NAME=$(echo "$NAME_AND_PROJECT_UNPARSED" | cut -d'/' -f 2 | cut -d'.' -f 1)
NEW_EMAIL=$(git config user.email)
PROJECT_TYPE="repository"

FILE_FUNCTION_HELPERS=bin/FUNCTION_HELPERS.sh

if [ ! -f "$FILE_FUNCTION_HELPERS" ]; then # check if the function helpers file is not found
  echo -e "${RED}Can not find ${FILE_FUNCTION_HELPERS}"
  exit 1 # it will exit if the function helpers file is not found
else
  # shellcheck source=bin/FUNCTION_HELPERS.sh disable=SC1091
  source $FILE_FUNCTION_HELPERS || exit # obtain some global functions and variables, if the file isn't found exit
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
  -o | --omit | "$OMIT_STR")
    will_omit_commit_and_confirmation=true
    choice="y"
    shift # past argument with no value
    ;;
  *)
    # unknown option
    ;;
  esac
done

checkFiles # check if the main files exist before starting the project

echo -e "Thanks for using ${GREEN}Josee9988/project-template${NC}"
echo -e "Read carefully all the documentation before you continue executing this script: ${UPurple}https://github.com/Josee9988/project-template${NC}\n"

if [ "$PROJECT_TYPE" = "repository" ]; then # if the project's type has not been manually specified
  read -p "Enter $(echo -e "$BBLUE""what your project is""$NC") (program/extension/API/web/CLI tool/backend/frontend/scrapper/automation tool/etc): " PROJECT_TYPE
fi

if [ $will_omit_commit_and_confirmation = false ]; then # if the ignore flag has not been manually specified
  read -p "Is this data correct: username \"$(echo -e "$GREEN""$NEW_USERNAME""$NC")\", email: \"$(echo -e "$GREEN""$NEW_EMAIL""$NC")\", project name: \"$(echo -e "$GREEN""$PROJECT_NAME""$NC")\", of type: \"$(echo -e "$GREEN""$PROJECT_TYPE""$NC")\" (y/n)? " choice
fi

###### START OF THE SCRIPT ######

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
  writeREADME                                                 # write the new README.md
  writeCHANGELOG                                              # write the basic structure of the CHANGELOG.md
  echo -e "# add your own funding links" >.github/FUNDING.yml # remove author's custom funding links

  if [ $will_omit_commit_and_confirmation = false ]; then                                 # if the ignore option for tests has been specified
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
  echo -e "\nIf your username, project name or email were NOT right (the auto selection wasn't successful), execute the script and give as a first argument your username, as a second argument your project name and as a third you email.\n"
  displayHelpTexts
  ;;
*) echo -e "${RED}Invalid option${NC}" ;;
esac

exit 0
