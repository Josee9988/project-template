#!/bin/bash

# prompt for the username and email
read -p "Enter your username (without '@'): " NEW_USERNAME
read -p "Enter your email: " NEW_EMAIL

# confirm that the data is correct
read -p "Is this data correct: username \"$NEW_USERNAME\", email: \"$NEW_EMAIL\" (y/n)?" choice
case "$choice" in
  y|Y )
  echo "yes"
  ;;
  n|N ) exit 0;;
  * ) echo "Invalid option";;
esac


