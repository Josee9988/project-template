#!/bin/bash

#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
# PURPOSE:       Main test script that will call all the individual unitary tests. Exit code 1 means an error in one
#                or more tests was found, otherwise, the exit code will be 0.
# TITLE:         TESTS_RUNNER
# AUTHOR:        @Josee9988 | Jose Gracia
# VERSION:       See in ./../CHANGELOG.md
# NOTES:         This script does not contain any test, it only calls all the tests one by one.
# BASH_VERSION:  5.1.4(1)-release (x86_64-pc-linux-gnu)
# LICENSE:       see in ../LICENSE (project root) or https://github.com/Josee9988/project-template/blob/master/LICENSE
# GITHUB:        https://github.com/Josee9988/
# REPOSITORY:    https://github.com/Josee9988/project-template
# ISSUES:        https://github.com/Josee9988/project-template/issues
# MAIL:          jgracia9988@gmail.com
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

LGREEN='\033[0;32m'
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color
TESTS_TRASH_DIR="tests/.ignore.tests_trash/"
TEMP_TEST_OUTPUT=".ignore.test_runner_output.txt"
declare -a test_files=("tests/project_scaffolding_test.sh" "tests/custom_data_test.sh" "tests/argument_help_parser.sh") # all the tests

center() {
    term_width="$(tput cols)"
    padding="$(printf '%0.1s' +{1..500})"
    echo -e "\n${LGREEN}$(printf '%*.*s %s %*.*s\n' 0 "$(((term_width - 2 - ${#1}) / 2))" "$padding" "$1" 0 "$(((term_width - 1 - ${#1}) / 2))" "$padding")${NC}"
}

rm -r $TESTS_TRASH_DIR 2>/dev/null || : # remove any possible old test run trash files

# run all the tests
for file in "${test_files[@]}"; do
    mkdir -p tests/.ignore.tests_trash # create the files where the tests will attack upon
    center "TEST: running test ./$file"
    ./"$file" | tee -a $TEMP_TEST_OUTPUT # run the test
    rm -r $TESTS_TRASH_DIR               # remove the previously created files
done

if grep -q "FAILED" "$TEMP_TEST_OUTPUT"; then # if when running the tests any error was found
    echo -e "\n${RED}X TESTS FAILED: One or more tests have failed!\nPlease check the output above${NC}"
    rm "$TEMP_TEST_OUTPUT" 2>/dev/null || :
    exit 1 # exit unsuccessfully
else       # tests ran OK
    rm "$TEMP_TEST_OUTPUT" 2>/dev/null || :
    echo -e "\n${GREEN}✓ All tests ran successfully${NC}"
    exit 0 # exit successfully
fi
