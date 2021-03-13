#!/bin/bash

#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
# SCRIPT:        EXECUTEME.sh
# USAGE:         bash EXECUTEME.sh | ./EXECUTEME.sh
# PURPOSE:       Shell script that prompts the user for their GitHub username, email name of their project and
#                the type of project that it is. Then it will replace the author's (josee9988) username and email
#                with the new ones (the user that is using this template). It will fully remove the LICENSE file,
#                delete all of the content of the README.md file, and add a simple header,
#                delete all of the content of the CHANGELOG.md and add a basic CHANGELOG versioning and 1st version,
#                then this script will auto remove itself, to leave the new project without this file (EXECUTEME.sh).
# TITLE:         EXECUTEME.sh
# AUTHOR:        Jose Gracia
# VERSION:       1.0.3
# NOTES:         This script will auto remove itself, and in case of wanting to run it again, the user must download
#                it again or do a 'git stash' and revert the changes.
# BASH_VERSION:  5.0.17(1)-release
# LICENSE:       see in ../LICENSE (project root) or https://github.com/Josee9988/project-template/blob/master/LICENSE
# GITHUB:        https://github.com/Josee9988/
# REPOSITORY:    https://github.com/Josee9988/project-template
# ISSUES:        https://github.com/Josee9988/project-template/issues
# MAIL:          jgracia9988@gmail.com
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

ACTUAL_DATE=$(date '+%Y-%m-%d')
RED='\033[1;31m'
NC='\033[0m' # No Color
UPurple='\033[4;35m'
BBLUE='\033[1;34m'
GREEN='\033[1;32m'

### Check if the .github directory does exist ###
if [ ! -d ".github/" ]; then
  echo -e "${RED}Directory .github/ DOES NOT EXIST.${NC}"
  exit 1 # exit with error code 1
fi

### Checks if the root giles exist ###
if [ ! -f "CHANGELOG.md" ] || [ ! -f "README.md" ] || [ ! -f ".gitignore" ]; then
  echo -e "${RED}There are files missing. Have you modified the repository before executing this command?${NC}"
  echo -e "${RED}The script couldn't found one or many of these files${NC}: '${UPurple}CHANGELOG.md${NC}', '${UPurple}README.md${NC}' or '${UPurple}.gitignore${NC}'.\n"
  echo -e "You should try to 'git stash' your changes and execute this script from the project root again, or clone again the repository without any changes.\n"
  echo -e "For more information visit: ${UPurple}https://github.com/Josee9988/project-template${NC}"
  echo -e "If you think this may be an issue please post it at: ${UPurple}https://github.com/Josee9988/project-template/issues${NC}"
  exit 1 # exit with error code 1
fi

# prompt for the username, mail and name of the project
read -p "Enter your $(echo -e "$BBLUE""username""$NC") (without '@'): " NEW_USERNAME
read -p "Enter your $(echo -e "$BBLUE""email""$NC"): " NEW_EMAIL
read -p "Enter the $(echo -e "$BBLUE""name of the project""$NC"): " PROJECT_NAME
read -p "Enter $(echo -e "$BBLUE""what your project is""$NC") (program/extension/API/web/CLI tool/backend/frontend/scrapper/automation tool/etc): " PROJECT_TYPE

# confirm that the data is correct
read -p "Is this data correct: username \"$(echo -e "$GREEN""$NEW_USERNAME""$NC")\", email: \"$(echo -e "$GREEN""$NEW_EMAIL""$NC")\", project name: \"$(echo -e "$GREEN""$PROJECT_NAME""$NC")\", of type: \"$(echo -e "$GREEN""$PROJECT_TYPE""$NC")\" (y/n)? " choice
case "$choice" in
y | Y)
  # replace the username and email
  find .github/ -type f -name "*" -print0 | xargs -0 sed -i "s/Josee9988/${NEW_USERNAME}/g"
  find .github/ -type f -name "*" -print0 | xargs -0 sed -i "s/jgracia9988@gmail.com/${NEW_EMAIL}/g"
  find .gitignore -type f -name "*" -print0 | xargs -0 sed -i "s/Josee9988\/project-template/${NEW_USERNAME}\/${PROJECT_NAME}/g"

  # remove the license
  rm LICENSE

  # delete the README.md and create one with just a header
  echo -e "# **${NEW_USERNAME}'s project**" >README.md
  echo "<!-- Write your own README.md file. Build something amazing! -->" >>README.md

  # write the basic structure of the CHANGELOG.md
  echo -e "<!-- markdownlint-disable MD024-->\n# **Change Log** 📜📝\n" >CHANGELOG.md
  echo -e "All notable changes to the \"**${PROJECT_NAME}**\" ${PROJECT_TYPE} will be documented in this file.\n" >>CHANGELOG.md
  echo -e "The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).\n" >>CHANGELOG.md
  echo -e "---\n\n## [**0.0.1**] - ${ACTUAL_DATE}\n\n### Added\n" >>CHANGELOG.md
  echo -e "* The basic project structure of [josee9988's](https://github.com/Josee9988) [project template](https://github.com/Josee9988/project-template)." >>CHANGELOG.md
  echo -e "* A basic \`.gitignore\` file ignoring some linux files and IDE trash files." >>CHANGELOG.md
  echo -e "* A \`.github/\` folder with issue templates, code of conduct, a contributing guide, pull request template security advisory file, a funding and support file and an issue label bot file." >>CHANGELOG.md

  # remove jose's custom funding links
  echo -e "# add your own funding links" >.github/FUNDING.yml

  echo -e "Remember to review every file and customize it as you like.\nYou are ready to start your brand new awesome project🚀🚀."

  # self remove this script
  rm -- "$0"
  ;;
n | N) echo "Then try it again!" ;;
*) echo -e "${RED}Invalid option${NC}" ;;
esac

exit 0
