#!/bin/bash

# ADD AS MANY LINES AS TESTS FILE YOU HAVE TO RUN THEM ALL

mkdir -p tests/.tests_trash/

echo -e "\n\n--------------------------------\nrunning ./tests/project_scaffolding.sh"
./tests/project_scaffolding.sh

rm -r tests/.tests_trash
