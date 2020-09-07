#!/bin/bash

# prompt for the username and email
read -p "Enter your username (without '@'): " NEW_USERNAME
read -p "Enter your email: " NEW_EMAIL

# confirm that the data is correct
read -p "Is this data correct: username \"$NEW_USERNAME\", email: \"$NEW_EMAIL\" (y/n)?" choice
case "$choice" in
  y|Y )
  # replace the username and email
  find .github/ -type f -name "*" -print0 | xargs -0 sed -i "s/Josee9988/${NEW_USERNAME}/g"
  find .github/ -type f -name "*" -print0 | xargs -0 sed -i "s/jgracia9988@gmail.com/${NEW_EMAIL}/g"
  ;;
  n|N ) exit 0;;
  * ) echo "Invalid option";;
esac

