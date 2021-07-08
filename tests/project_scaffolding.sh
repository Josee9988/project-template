#! /bin/bash
# file: examples/arguments_test.sh

TESTS_TRASH_DIR="tests/.ignore.tests_trash"
USERNAME="FAKE_USERNAME_TESTS"
NAME="FAKE_NAME_TESTS"
MAIL="FAKE_EMAIL_TESTS"
OMIT_STR="--omit-commit-and-confirmation"

cp -r * $TESTS_TRASH_DIR --copy-content 2>/dev/null || :
cp -r .github/ $TESTS_TRASH_DIR --copy-contents
cp -r bin/ $TESTS_TRASH_DIR --copy-contents
cp .gitignore $TESTS_TRASH_DIR --copy-contents
rm -r $TESTS_TRASH_DIR/tests/ 2>/dev/null || :
rm -r $TESTS_TRASH_DIR/.git/ 2>/dev/null || :

# TESTS

suite() {
    cd $TESTS_TRASH_DIR || exit

    bash SETUP_TEMPLATE.sh $USERNAME $NAME $MAIL $OMIT_STR

    suite_addTest testDotGithubFolder
    suite_addTest testDotGithubISSUE_TEMPLATE
    suite_addTest testDotGithubISSUE_TEMPLATEFiles
    suite_addTest testDotGithubFiles

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
    filesFound=0
    if [ -e ".github/ISSUE_TEMPLATE/1-bug-report.md" ] && [ -e ".github/ISSUE_TEMPLATE/2-failing-test.md" ] && [ -e ".github/ISSUE_TEMPLATE/3-docs-bug.md" ] && [ -e ".github/ISSUE_TEMPLATE/4-feature-request.md" ] && [ -e ".github/ISSUE_TEMPLATE/5-enhancement-request.md" ] && [ -e ".github/ISSUE_TEMPLATE/6-security-report.md" ] && [ -e ".github/ISSUE_TEMPLATE/7-question-support.md" ] && [ -e ".github/ISSUE_TEMPLATE/config.yml" ]; then
        filesFound=1
    fi
    assertEquals 1 $filesFound
}

testDotGithubFiles() {
    filesFound=0
    if [ -e ".github/CODEOWNERS" ] && [ -e ".github/CODE_OF_CONDUCT.md" ] && [ -e ".github/CONTRIBUTING.md" ] && [ -e ".github/ISSUE_TEMPLATE.md" ] && [ -e ".github/pull_request_template.md" ] && [ -e ".github/SECURITY.md" ] && [ -e ".github/SUPPORT.md" ] && [ -e ".github/issue_label_bot.yaml" ] && [ -e ".github/config.yml" ] && [ -e ".github/FUNDING.yml" ] && [ -e ".github/settings.yml" ]; then
        filesFound=1
    fi
    assertEquals 1 $filesFound
}

# Load and run shUnit2.
. tests/shunit2
cd "../.." || exit
