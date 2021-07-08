#!/bin/bash

# ADD AS MANY LINES AS TESTS FILE YOU HAVE TO RUN THEM ALL

mkdir -p tests/.ignore.tests_trash

echo -e "\n\n--------------------------------\nrunning ./tests/project_scaffolding.sh"
./tests/project_scaffolding.sh

#rm -r tests/.ignore.tests_trash
