#!/bin/bash

LGREEN='\033[0;32m'
NC='\033[0m' # No Color
TESTS_TRASH_DIR="tests/.ignore.tests_trash/"
declare -a files=("tests/project_scaffolding_test.sh" "tests/custom_data_test.sh") # all the tests

center() {
    term_width="$(tput cols)"
    padding="$(printf '%0.1s' +{1..500})"
    echo -e "\n${LGREEN}$(printf '%*.*s %s %*.*s\n' 0 "$(((term_width - 2 - ${#1}) / 2))" "$padding" "$1" 0 "$(((term_width - 1 - ${#1}) / 2))" "$padding")${NC}"
}

for file in "${files[@]}"; do
    mkdir -p tests/.ignore.tests_trash
    center "TEST: running test ./$file"
    ./"$file"
    rm -r $TESTS_TRASH_DIR
done
