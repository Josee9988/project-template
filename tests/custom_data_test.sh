#! /bin/bash
# file: examples/custom_data_test.sh

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
    suite_addTest testDotGithubISSUE_TEMPLATEAsignees
    suite_addTest testDotGithubISSUE_TEMPLATEConfig
    suite_addTest testDotGithubConfig
    suite_addTest testDotGithubSecurity
    suite_addTest testDotGithubCODEOWNERS
    suite_addTest testDotGitignore
    suite_addTest testChangelog
}

testDotGithubISSUE_TEMPLATEAsignees() {
    assigneesWithName="assignees: $USERNAME"
    declare -a files=(
        ".github/ISSUE_TEMPLATE/1-bug-report.md" ".github/ISSUE_TEMPLATE/2-failing-test.md"
        ".github/ISSUE_TEMPLATE/3-docs-bug.md" ".github/ISSUE_TEMPLATE/4-feature-request.md"
        ".github/ISSUE_TEMPLATE/5-enhancement-request.md" ".github/ISSUE_TEMPLATE/6-security-report.md"
        ".github/ISSUE_TEMPLATE/7-question-support.md")

    for file in "${files[@]}"; do
        assertTrue " assignee was not found for file $file" "grep -q \"$assigneesWithName\" \"$file\""
    done
}
testDotGithubISSUE_TEMPLATEConfig() {
    mailInConfig="url: mailto:$MAIL"
    assertTrue "The mail $MAIL was not found in .github/ISSUE_TEMPLATE/config.yml" "grep -q \"$mailInConfig\" \".github/ISSUE_TEMPLATE/config.yml\""
}

testDotGithubConfig() {
    newIssueWelcomeComment="Thanks for opening your first issue in $USERNAME/$NAME! Be sure to"
    assertTrue "The $USERNAME/$NAME was not found in " "grep -q \"$newIssueWelcomeComment\" \".github/config.yml\""
}

testDotGithubSecurity() {
    securityData1="(mailto:$MAIL)"
    securityData2="[$MAIL]"
    securityData3="he project's team and community take security issues"
    assertTrue "The mail $MAIL was not found in .github/SECURITY.md" "grep -q \"$securityData1\" \".github/SECURITY.md\" && grep -q \"$securityData2\" \".github/SECURITY.md\" && grep -q \"$securityData3\" \".github/SECURITY.md\""
}

testDotGithubCODEOWNERS() {
    usernameData="$USERNAME"
    assertTrue "Could not find the username $USERNAME in the file .github/CODEOWNERS" "grep -q \"$usernameData\" \".github/CODEOWNERS\""
}

testDotGitignore() {
    gitignoreData1="###> $USERNAME/$NAME ###"
    gitignoreData2="###< $USERNAME/$NAME ###"

    assertTrue "Could not find the username $USERNAME and the name $NAME in the .gitignore file" "grep -q \"$gitignoreData1\" \".gitignore\" && grep -q \"$gitignoreData2\" \".gitignore\""
}

testChangelog() {
    changelogData1="All notable changes to the"
    changelogData2="**$NAME**"
    changelogData3="$TYPE will be documented in this file."

    assertTrue "Could not find the name $NAME or the type $TYPE in the CHANGELOG.md file" "grep -q \"$changelogData1\" \"CHANGELOG.md\" && grep -q \"$changelogData2\" \"CHANGELOG.md\" && grep -q \"$changelogData3\" \"CHANGELOG.md\""
}

# Load and run shUnit2.
. tests/shunit2
