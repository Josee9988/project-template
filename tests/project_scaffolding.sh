#! /bin/bash
# file: examples/arguments_test.sh

TESTS_TRASH_DIR="tests/.tests_trash"

cp -r * $TESTS_TRASH_DIR --copy-content 2>/dev/null || :
cp -r .github/ $TESTS_TRASH_DIR --copy-contents
cp -r bin/ $TESTS_TRASH_DIR --copy-contents
rm -r $TESTS_TRASH_DIR/tests/
rm -r $TESTS_TRASH_DIR/.git/ 2>/dev/null || :

#cd "tests/.tests_trash" || exit
# TESTS

suite() {
    suite_addTest testDotGithubFolder
    suite_addTest testDotGithubISSUE_TEMPLATE
    suite_addTest testDotGithubISSUE_TEMPLATEFiles
    suite_addTest testDotGithubFiles

}

testDotGithubFolder() {
    githubFolderFound=0
    if [ -e "$TESTS_TRASH_DIR/.github/" ]; then
        githubFolderFound=1
    fi
    assertEquals 1 $githubFolderFound

}

testDotGithubISSUE_TEMPLATE() {
    folderFound=0
    if [ -e "$TESTS_TRASH_DIR/.github/ISSUE_TEMPLATE" ]; then
        folderFound=1
    fi
    assertEquals 1 $folderFound
}

testDotGithubISSUE_TEMPLATEFiles() {
    filesFound=0
    if [ -e "$TESTS_TRASH_DIR/.github/ISSUE_TEMPLATE/1-bug-report.md" ] && [ -e "$TESTS_TRASH_DIR/.github/ISSUE_TEMPLATE/2-failing-test.md" ] && [ -e "$TESTS_TRASH_DIR/.github/ISSUE_TEMPLATE/3-docs-bug.md" ] && [ -e "$TESTS_TRASH_DIR/.github/ISSUE_TEMPLATE/4-feature-request.md" ] && [ -e "$TESTS_TRASH_DIR/.github/ISSUE_TEMPLATE/5-enhancement-request.md" ] && [ -e "$TESTS_TRASH_DIR/.github/ISSUE_TEMPLATE/6-security-report.md" ] && [ -e "$TESTS_TRASH_DIR/.github/ISSUE_TEMPLATE/7-question-support.md" ] && [ -e "$TESTS_TRASH_DIR/.github/ISSUE_TEMPLATE/config.yml" ]; then
        filesFound=1
    fi
    assertEquals 1 $filesFound
}

testDotGithubFiles() {
    filesFound=0
    if [ -e "$TESTS_TRASH_DIR/.github/CODEOWNERS" ] && [ -e "$TESTS_TRASH_DIR/.github/CODE_OF_CONDUCT.md" ] && [ -e "$TESTS_TRASH_DIR/.github/CONTRIBUTING.md" ] && [ -e "$TESTS_TRASH_DIR/.github/ISSUE_TEMPLATE.md" ] && [ -e "$TESTS_TRASH_DIR/.github/pull_request_template.md" ] && [ -e "$TESTS_TRASH_DIR/.github/SECURITY.md" ] && [ -e "$TESTS_TRASH_DIR/.github/SUPPORT.md" ] && [ -e "$TESTS_TRASH_DIR/.github/issue_label_bot.yaml" ] && [ -e "$TESTS_TRASH_DIR/.github/config.yml" ] && [ -e "$TESTS_TRASH_DIR/.github/FUNDING.yml" ] && [ -e "$TESTS_TRASH_DIR/.github/settings.yml" ]; then
        filesFound=1
    fi
    assertEquals 1 $filesFound
}

# Load and run shUnit2.
#cd "../.." || exit
. tests/shunit2
