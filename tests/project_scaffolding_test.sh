#! /bin/bash
# file: examples/project_scaffolding_test.sh

TESTS_TRASH_DIR="tests/.ignore.tests_trash"
USERNAME="FAKE_USERNAME_TESTS"
NAME="FAKE_NAME_TESTS"
MAIL="FAKE_EMAIL_TESTS"
TYPE="FAKE_TYPE_TESTS"
OMIT_STR="--omit-commit-and-confirmation"

oneTimeSetUp() {
    cp -r * $TESTS_TRASH_DIR --copy-content 2>/dev/null || :
    cp -r .github/ $TESTS_TRASH_DIR --copy-contents
    cp -r bin/ $TESTS_TRASH_DIR --copy-contents
    cp .gitignore $TESTS_TRASH_DIR --copy-contents
    rm -r $TESTS_TRASH_DIR/tests/ 2>/dev/null || :
    rm -r $TESTS_TRASH_DIR/.git/ 2>/dev/null || :
    cd $TESTS_TRASH_DIR || exit
    bash SETUP_TEMPLATE.sh $USERNAME $NAME $MAIL $TYPE $OMIT_STR >/dev/null
}

oneTimeTearDown() {
    cd "../.." || exit
}

# TESTS
suite() {
    suite_addTest testDotGithubFolder
    suite_addTest testDotGithubISSUE_TEMPLATE
    suite_addTest testDotGithubISSUE_TEMPLATEFiles
    suite_addTest testDotGithubFiles
    suite_addTest testTestRemovedFiles
    suite_addTest testGlobalFiles
    suite_addTest testRemovedFiles
}

testDotGithubFolder() {
    githubFolderFound=0
    if [ -e ".github/" ]; then
        githubFolderFound=1
    fi
    assertEquals 1 $githubFolderFound
}

testDotGithubISSUE_TEMPLATE() {
    folderFound=0
    if [ -e ".github/ISSUE_TEMPLATE" ]; then
        folderFound=1
    fi
    assertEquals 1 $folderFound
}

testDotGithubISSUE_TEMPLATEFiles() {
    declare -a files=(
        ".github/ISSUE_TEMPLATE/1-bug-report.md" ".github/ISSUE_TEMPLATE/2-failing-test.md"
        ".github/ISSUE_TEMPLATE/3-docs-bug.md" ".github/ISSUE_TEMPLATE/4-feature-request.md"
        ".github/ISSUE_TEMPLATE/5-enhancement-request.md" ".github/ISSUE_TEMPLATE/6-security-report.md"
        ".github/ISSUE_TEMPLATE/7-question-support.md")

    for file in "${files[@]}"; do
        assertTrue " $file does not exist" "[ -e \"$file\" ]"
    done
}

testDotGithubFiles() {
    declare -a files=(
        ".github/CODEOWNERS" ".github/CODE_OF_CONDUCT.md" ".github/CONTRIBUTING.md" ".github/ISSUE_TEMPLATE.md"
        ".github/pull_request_template.md" ".github/SECURITY.md" ".github/SUPPORT.md" ".github/issue_label_bot.yaml"
        ".github/config.yml" ".github/FUNDING.yml" ".github/settings.yml")
    for file in "${files[@]}"; do
        assertTrue " $file does not exist" "[ -e \"$file\" ]"
    done
}

testTestRemovedFiles() {
    filesFound=0
    if [ -e "tests/" ] && [ -e "tests/shunit2" ] && [ -e "tests/TESTS_RUNNER.sh" ]; then
        filesFound=1
    fi
    assertNotEquals 1 $filesFound
}

testGlobalFiles() {
    filesFound=0
    if [ -e ".gitignore" ] && [ -e "CHANGELOG.md" ] && [ -e "README.md" ]; then
        filesFound=1
    fi
    assertEquals 1 $filesFound
}

testRemovedFiles() {
    filesFound=0
    if [ -e "LICENSE" ] && [ -e "bin" ] && [ -e "bin/FUNCTION_HELPERS.sh" ]; then
        filesFound=1
    fi
    assertNotEquals 1 $filesFound
}

# Load and run shUnit2.
. tests/shunit2
