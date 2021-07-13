#!/bin/bash

#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
# PURPOSE:       Secondary (helper) script that is called by the main SETUP_TEMPLATE.sh file by
#                obtaining some functions to better modularize the code.
# TITLE:         FUNCTION_HELPERS
# AUTHOR:        Jose Gracia
# VERSION:       See in CHANGELOG.md
# NOTES:         This script will auto remove itself, and in case of wanting to run it again, the user must download
#                it again or do a 'git stash' and revert the changes.
# BASH_VERSION:  5.1.4(1)-release (x86_64-pc-linux-gnu)
# LICENSE:       see in ../LICENSE (project root) or https://github.com/Josee9988/project-template/blob/master/LICENSE
# GITHUB:        https://github.com/Josee9988/
# REPOSITORY:    https://github.com/Josee9988/project-template
# ISSUES:        https://github.com/Josee9988/project-template/issues
# MAIL:          jgracia9988@gmail.com
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

# SCRIPT WITH EXPORTED FUNCTIONS AND VARIABLES USED IN THE MAIN SETUP_TEMPLATE
RED='\033[1;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'
UPurple='\033[4;35m'
BBLUE='\033[1;34m'
UGREEN='\033[4;92m'

# Function that centers a text in the terminal
center() {
  term_width="$(tput cols)"
  padding="$(printf '%0.1s' ={1..500})"
  echo -e "\n\n${BBLUE}$(printf '%*.*s %s %*.*s\n' 0 "$(((term_width - 2 - ${#1}) / 2))" "$padding" "$1" 0 "$(((term_width - 1 - ${#1}) / 2))" "$padding")${NC}\n"
}

checkFiles() {
  ### Check if the .github directory does exist ###
  if [ ! -d ".github/" ] && [ ! -d ".github/ISSUE_TEMPLATE" ]; then
    echo -e "${RED}Directory .github/ DOES NOT EXIST WITH ALL THE FILES NEEDED.${NC}"
    displayErrorInstructions
    exit 1 # exit with error code 1
  fi

  ### Checks if the root files exist and some extra important files ###
  if [ ! -f "CHANGELOG.md" ] && [ ! -f "README.md" ] && [ ! -f ".gitignore" ] && [ ! -f "LICENSE" ] && [ ! -f ".github/settings.yml" ] && [ ! -f ".github/pull_request_template.md" ] && [ ! -f ".github/ISSUE_TEMPLATE/1-bug-report.md" ] && [ ! -f ".github/ISSUE_TEMPLATE/config.yml" ]; then
    echo -e "${RED}The script couldn't find one or many of the template main files${NC}."
    displayErrorInstructions
    exit 1 # exit with error code 1
  fi
}

displayErrorInstructions() {
  echo -e "${RED}There are files missing! Have you modified the repository before executing this command?${NC}"
  echo -e "\nYou should try to 'git stash' your changes and execute this script from the project root again, or clone again the repository (the template) without any changes.\n"
  echo -e "For more information visit: ${UPurple}https://github.com/Josee9988/project-template${NC}"
  echo -e "If you think this may be an issue please post it at: ${UPurple}https://github.com/Josee9988/project-template/issues${NC}"
}

displayHelpTexts() { # (it will manually detect your git data and prompt for the proejct type)
  center "User help"
  echo -e "Script usage: ${UGREEN}bash $0${NC} or ${UGREEN}./$0${NC}\n"

  echo -e "${BOLD}Optional arguments and options:${NC}"
  echo -e "  -u, --username, --name\t\t\tManually specify the GitHub username instead of the autodetected username."
  echo -e "  -e, --email, --mail\t\t\t\tManually specify the GitHub email instead of the autodetected mail."
  echo -e "  -t, --projectType, --type\t\t\tManually specify the type of project (what it is, eg: npm package or website or whatever) instead of being prompted inside the script."
  echo -e "  -h, --help, --info${NC}\t\t\t\tDisplays this help text (this argument does not require a value, it is just called without any equal signs)."
  echo -e "  -o, --omit, --omit-commit-and-confirmation\tWill avoid the git commit and will not prompt if you are sure. (this argument does not require a value, it is just called without any equal signs)."
  echo -e "${BBLUE}All arguments but the '--omit-commit-and-confirmation' and the '--help' arguments require a value after an equal sign (--argument=value) eg: --email=etc@abc.com${NC}."

  echo -e "\n${BOLD}Examples of use:${NC}"
  echo -e "  bash $0"
  echo -e "  bash $0 -h"
  echo -e "  bash $0 --projectType=Angular-Website --omit-commit-and-confirmation"
  echo -e "  bash $0 --email=jgracia9988@gmail.com"
  echo -e "  bash $0 --username=whatever --projectName=whatever --email=whatever --projectType=whatever${NC}"
  echo -e "  bash $0 -u=Josee9988 --projectType=Github-template --omit-commit-and-confirmation${NC}\n"

  echo -e "The username, project-name and email are automatically gathered from your git repository and git config."
  echo -e "Make sure you have ${BBLUE}read the documentation before executing${NC} this script: ${UPurple}https://github.com/Josee9988/project-template${NC}"
  echo -e "If you have any questions or if any issue is found, please make sure to report it at: ${UPurple}https://github.com/Josee9988/project-template/issues${NC}"
}

writeREADME() {
  PROJECT_NAME_PARSED=${PROJECT_NAME/-/ }
  bash -c "NEW_USERNAME='NEW_USERNAME' PROJECT_NAME='PROJECT_NAME' PROJECT_TYPE='PROJECT_TYPE'; cat << EOF > README.md
<!-- markdownlint-disable MD032 MD033-->
<!-- Write your README.md file. Build something amazing! This README.md template can guide you to build your project documentation, but feel free to modify it as you wish 🥰 -->
# 🔥 **$NEW_USERNAME/$PROJECT_NAME**

<div align=\"center\">
  <a href=\"https://github.com/$NEW_USERNAME/$PROJECT_NAME/issues\">
    <img alt=\"Issues\" src=\"https://img.shields.io/github/issues/$NEW_USERNAME/$PROJECT_NAME?color=0088ff&style=for-the-badge&logo=github\"/>
  </a>
  <a href=\"https://github.com/$NEW_USERNAME/$PROJECT_NAME/pulls\">
    <img alt=\"GitHub pull requests\" src=\"https://img.shields.io/github/issues-pr/$NEW_USERNAME/$PROJECT_NAME?color=0088ff&style=for-the-badge&logo=github\"/>
  </a>
</div>

---

## 🤔 **About the project**

* <!-- ... [WHY DID YOU CREATED THIS PROJECT?, MOTIVATION, PURPOSE, DESCRIPTION, OBJECTIVES, etc] -->

---

## ⚡ **Installation**

* <!-- ... [SHOW HOW YOUR PROJECT IS INSTALLED] -->

---

## 🚀 **Usage**

* <!-- ... [SHOW HOW YOUR PROJECT IS USED] -->

---

## 🌲 **Project tree**

<!-- ... [SHOW YOUR PROJECT TREE HERE IF USEFUL] -->

---

## 📝 **Additional notes**

* <!-- ... [ADD ADDITIONAL NOTES] -->

---

## 📸 **Screenshots**

<!-- ... [SOME DESCRIPTIVE IMAGES] -->

---

## 🍰 **Supporters and donators**

We are currently looking for new donators to help and maintain this project! ❤️

By donating, you will help the development of this project, and *you will be featured in this $PROJECT_NAME's README.md* so everyone can see your kindness and visit your content ⭐.

<a href=\"https://github.com/sponsors/$NEW_USERNAME\"> <!-- MODIFY THIS LINK TO YOUR MAIN DONATING SITE IF YOU ARE NOT IN THE GITHUB SPONSORS PROGRAM -->
  <img src=\"https://img.shields.io/badge/Sponsor-$NEW_USERNAME/$PROJECT_NAME_PARSED-blue?logo=github-sponsors&style=for-the-badge&color=red\">
</a>

<!-- LINK TO YOUR DONATING PAGES HERE -->

---

$PROJECT_NAME was generated from *[Josee9988/project-template](https://github.com/Josee9988/project-template)* 📚

---

## 🕵️ Extra recommendations

* <!-- If you recommend installing anything special, or if you recommend using X thing for the good use of your project...-->

---

## 🎉 Was the $PROJECT_TYPE helpful? Help us raise these numbers up

[![Github followers](https://img.shields.io/github/followers/$NEW_USERNAME.svg?style=social)](https://github.com/$NEW_USERNAME)
[![Github stars](https://img.shields.io/github/stars/$NEW_USERNAME/$PROJECT_NAME.svg?style=social)](https://github.com/$NEW_USERNAME/$PROJECT_NAME/stargazers)
[![Github watchers](https://img.shields.io/github/watchers/$NEW_USERNAME/$PROJECT_NAME.svg?style=social)](https://github.com/$NEW_USERNAME/$PROJECT_NAME/watchers)
[![Github forks](https://img.shields.io/github/forks/$NEW_USERNAME/$PROJECT_NAME.svg?style=social)](https://github.com/$NEW_USERNAME/$PROJECT_NAME/network/members)
<!-- MODIFY THIS LINK TO YOUR MAIN DONATING SITE IF YOU ARE NOT IN THE GITHUB SPONSORS PROGRAM -->
[![Sponsor](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=github-sponsors&color=red&style=social)](https://github.com/sponsors/$NEW_USERNAME)

Enjoy! 😃

---

## ⚖️📝 **License and Changelog**

See the license in the '**[LICENSE](LICENSE)**' file.

Watch the changes in the '**[CHANGELOG.md](CHANGELOG.md)**' file.

---

_Made with a lot of ❤️❤️ by **[@$NEW_USERNAME](https://github.com/$NEW_USERNAME)**_
EOF"
}

writeCHANGELOG() {
  ACTUAL_DATE=$(date '+%Y-%m-%d')
  bash -c "PROJECT_NAME='PROJECT_NAME' PROJECT_TYPE='PROJECT_TYPE' ACTUAL_DATE='ACTUAL_DATE'; cat << EOF > CHANGELOG.md
<!-- markdownlint-disable MD024-->
# **Change Log** 📜📝

All notable changes to the \"**$PROJECT_NAME**\" $PROJECT_TYPE will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [**0.0.1**] - $ACTUAL_DATE

### Added

* The basic project structure from **[josee9988/project-template](https://github.com/Josee9988/project-template)**.
EOF"
}
