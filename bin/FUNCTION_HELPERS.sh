#!/bin/bash

#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
# PURPOSE:       Secondary (helper) script that is called by the main SETUP_TEMPLATE.sh file to call
#                some functions and obtain some exported variables to better modularize the code.
# TITLE:         FUNCTION_HELPERS
# AUTHOR:        @Josee9988 | Jose Gracia
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
export NC='\033[0m' # No Color
export BOLD='\033[1m'
export UPURPLE='\033[4;35m'
export BBLUE='\033[1;34m'
export UGREEN='\033[4;92m'
export GREEN='\033[1;32m'
export CYAN='\e[36m'
export DGRAY='\e[90m'

# Function that centers a text in the terminal
center() {
  term_width="$(tput cols)"
  padding="$(printf '%0.1s' ={1..500})"
  echo -e "\n${BBLUE}$(printf '%*.*s %s %*.*s\n' 0 "$(((term_width - 2 - ${#1}) / 2))" "$padding" "$1" 0 "$(((term_width - 1 - ${#1}) / 2))" "$padding")${NC}\n"
}

# Function that displays the error texts in case the project's tests fails.
displayTestErrorTexts() {
  echo -e "${RED}X ERROR: The tests failed!${NC}. Please, make sure that you are running this script with its original scaffolding (folder/file) structure without any modification.${NC}"
  echo -e "You should try to 'git stash' your changes and execute this script from the project root again, or clone again the repository (the template) without any changes."
  echo -e "Remember that your brand new repository should be created from here: ${BOLD}${UPURPLE}https://github.com/Josee9988/project-template/generate${NC}"
  echo -e "\nThe program will now exit for you to check if this script is executed right when creating your new repository from the link above."
  echo -e "To omit this error and proceed please execute this script again with the flag '${GREEN}--omit-test-check${NC}'"
  echo -e "For more information about the script, use the '${BBLUE}--help${NC}' flag."
}

# Displays the help texts, normally called by the '--help' flag
displayHelpTexts() { # (it will manually detect your git data and prompt for the project type)
  center "User help ${DGRAY}$SCRIPT_VERSION${BBLUE}"
  echo -e "Script usage: ${UGREEN}bash $0${NC} or ${UGREEN}./$0${NC}\n"

  echo -e "${BOLD}Optional arguments and flags:${NC}"
  echo -e "  ${CYAN}-u, --username, --name${NC}\t\tManually specify the GitHub username instead of the autodetected username."
  echo -e "  ${CYAN}-e, --email, --mail${NC}\t\t\tManually specify the GitHub email instead of the autodetected mail."
  echo -e "  ${CYAN}-t, --projectType, --type${NC}\t\tManually specify the type of project (what it is, eg: npm package or website or whatever) instead of being prompted inside the script."
  echo -e "  ${CYAN}-h, --help, --info${NC}\t\t\t(${BOLD}${DGRAY}FLAG${NC}) Displays this help text."
  echo -e "  ${CYAN}-v, --version${NC}\t\t\t\t(${BOLD}${DGRAY}FLAG${NC}) Displays the current script version."
  echo -e "  ${CYAN}--omit-verification${NC}\t\t\t(${BOLD}${DGRAY}FLAG${NC}) Will not prompt if you are sure about the data."
  echo -e "  ${CYAN}--omit-commit${NC}\t\t\t\t(${BOLD}${DGRAY}FLAG${NC}) Will not commit the data for your."
  echo -e "  ${CYAN}--omit-tests, --omit-test-check${NC}\t(${BOLD}${DGRAY}FLAG${NC}) Will not perform the script's tests."
  echo -e "${BBLUE}\nAll arguments but the ones marked with ${NC}'${BOLD}${DGRAY}FLAG${NC}'${BBLUE}, require a value after an equal sign (--argument=value) eg: --email=etc@abc.com, the flags are just called without any equal signs.${NC}"

  echo -e "\n${BOLD}Examples of use:${NC}"
  echo -e "  bash $0"
  echo -e "  bash $0 -h"
  echo -e "  bash $0 --projectType=Angular-Website --omit-commit --omit-verification"
  echo -e "  bash $0 --email=jgracia9988@gmail.com"
  echo -e "  bash $0 --username=whatever --projectName=whatever --email=whatever --projectType=whatever${NC}"
  echo -e "  bash $0 -u=Josee9988 --projectType=Github-template --omit-commit${NC}\n"

  echo -e "The username, project-name and email are automatically gathered from your git repository and git config."
  echo -e "Make sure you have ${BBLUE}read the documentation before executing${NC} this script: ${UPURPLE}https://github.com/Josee9988/project-template${NC}"
  echo -e "If you have any questions or if any issue is found, please make sure to report it at: ${UPURPLE}https://github.com/Josee9988/project-template/issues${NC}"
}

# Function that writes and parses variables to write the new generated README.md file
writeREADME() {
  PROJECT_NAME_PARSED=${PROJECT_NAME/-/ }
  bash -c "NEW_USERNAME='NEW_USERNAME' PROJECT_NAME='PROJECT_NAME' PROJECT_TYPE='PROJECT_TYPE'; cat << EOF > README.md
<!-- markdownlint-disable MD032 MD033-->
<!-- Write your README.md file. Build something amazing! This README.md template can guide you to build your project documentation, but feel free to modify it as you wish 🥰 -->
# 🔥 **$NEW_USERNAME/$PROJECT_NAME**

<div align=\"center\">
  <!-- Change your logo -->
  <a href=\"https://github.com/$NEW_USERNAME/$PROJECT_NAME\">
    <img width=\"100%\" src=\"https://i.imgur.com/SVvgxJF.png\" alt=\"@$NEW_USERNAME/$PROJECT_NAME's logo\">
  </a>
  <br>
  <a href=\"https://github.com/$NEW_USERNAME/$PROJECT_NAME/issues\">
    <img src=\"https://img.shields.io/github/issues/$NEW_USERNAME/$PROJECT_NAME?color=0088ff&style=for-the-badge&logo=github\" alt=\"$NEW_USERNAME/$PROJECT_NAME's issues\"/>
  </a>
  <a href=\"https://github.com/$NEW_USERNAME/$PROJECT_NAME/pulls\">
    <img src=\"https://img.shields.io/github/issues-pr/$NEW_USERNAME/$PROJECT_NAME?color=0088ff&style=for-the-badge&logo=github\"  alt=\"$NEW_USERNAME/$PROJECT_NAME's pull requests\"/>
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

<!-- Change your small logo -->
<a href=\"https://github.com/$NEW_USERNAME/$PROJECT_NAME_PARSED\">
  <img alt=\"@$NEW_USERNAME/$PROJECT_NAME_PARSED's brand logo without text\" align=\"right\" src=\"https://i.imgur.com/3qK1sie.png\" width=\"18%\" />
</a>


We are currently looking for new donators to help and maintain this project! ❤️

By donating, you will help the development of this project, and *you will be featured in this $PROJECT_NAME's README.md*, so everyone can see your kindness and visit your content ⭐.

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

[![GitHub followers](https://img.shields.io/github/followers/$NEW_USERNAME.svg?style=social)](https://github.com/$NEW_USERNAME)
[![GitHub stars](https://img.shields.io/github/stars/$NEW_USERNAME/$PROJECT_NAME.svg?style=social)](https://github.com/$NEW_USERNAME/$PROJECT_NAME/stargazers)
[![GitHub watchers](https://img.shields.io/github/watchers/$NEW_USERNAME/$PROJECT_NAME.svg?style=social)](https://github.com/$NEW_USERNAME/$PROJECT_NAME/watchers)
[![GitHub forks](https://img.shields.io/github/forks/$NEW_USERNAME/$PROJECT_NAME.svg?style=social)](https://github.com/$NEW_USERNAME/$PROJECT_NAME/network/members)
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

# Function that writes and parses variables to write the new generated CHANGELOG.md file
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
