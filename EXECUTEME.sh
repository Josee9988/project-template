#!/bin/bash

ACTUAL_DATE=$(date '+%Y-%m-%d')

# prompt for the username and email
read -p "Enter your username (without '@'): " NEW_USERNAME
read -p "Enter your email: " NEW_EMAIL
read -p "Enter the name of the project: " PROJECT_NAME
read -p "Enter what is your project (program/extension/API/web/CLI tool/backend/frontend/scrapper/automation tool/etc): " PROJECT_TYPE

# confirm that the data is correct
read -p "Is this data correct: username \"$NEW_USERNAME\", email: \"$NEW_EMAIL\" (y/n)?" choice
case "$choice" in
  y|Y )
  # replace the username and email
  find .github/ -type f -name "*" -print0 | xargs -0 sed -i "s/Josee9988/${NEW_USERNAME}/g"
  find .github/ -type f -name "*" -print0 | xargs -0 sed -i "s/jgracia9988@gmail.com/${NEW_EMAIL}/g"

  # delete the README.md and create one with just a header
  echo "# **${NEW_USERNAME}'s project**" > README.md
  echo "<!-- Write your own README.md file. Build something amazing! -->" >> README.md

  # write the basic structure of the CHANGELOG.md
  echo -e "# **Change Log** 📜📝\n" > CHANGELOG.md
  echo -e "All notable changes to the \"**${PROJECT_NAME}**\" ${PROJECT_TYPE} will be documented in this file.\n" >> CHANGELOG.md
  echo -e "The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).\n" >> CHANGELOG.md
  echo -e "---\n\n## [**0.0.1**] - ${ACTUAL_DATE}\n\n### Added\n" >> CHANGELOG.md
  echo -e "* The basic project structure of [josee9988's](https://github.com/Josee9988) [project template](https://github.com/Josee9988/project-template)." >> CHANGELOG.md
  echo -e "* A basic \`.gitignore\` file ignoring some linux files and IDE trash files." >> CHANGELOG.md
  echo -e "* A \`.github/\` folder with issue templates, code of conduct, a contributing guide, pull request template security advisory file, a funding and support file and an issue label bot file." >> CHANGELOG.md

  # self remove this script
  rm -- "$0"
  ;;
  n|N ) exit 0;;
  * ) echo "Invalid option";;
esac


