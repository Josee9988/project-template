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
    suite_addTest testDotChangelog
}

testDotGithubISSUE_TEMPLATEAsignees() {
    isTheAssigneeNotFound=0
    assigneesWithName="assignees: $USERNAME"
    declare -a files=(
        ".github/ISSUE_TEMPLATE/1-bug-report.md" ".github/ISSUE_TEMPLATE/2-failing-test.md"
        ".github/ISSUE_TEMPLATE/3-docs-bug.md" ".github/ISSUE_TEMPLATE/4-feature-request.md"
        ".github/ISSUE_TEMPLATE/5-enhancement-request.md" ".github/ISSUE_TEMPLATE/6-security-report.md"
        ".github/ISSUE_TEMPLATE/7-question-support.md")

    for file in "${files[@]}"; do
        if ! grep -q "$assigneesWithName" "$file"; then
            isTheAssigneeNotFound=1
        fi
    done
    assertNotEquals 1 $isTheAssigneeNotFound
}

testDotGithubISSUE_TEMPLATEConfig() {
    isTheAssigneeNotFound=0
    mailInConfig="url: mailto:$MAIL"

    if grep -q "$mailInConfig" ".github/ISSUE_TEMPLATE/config.yml"; then
        isTheAssigneeNotFound=1
    fi
    assertEquals 1 $isTheAssigneeNotFound
}

testDotGithubConfig() {
    isNewIssueWelcomeCommentFound=0
    newIssueWelcomeComment="Thanks for opening your first issue in $USERNAME/$NAME! Be sure to"

    if grep -q "$newIssueWelcomeComment" ".github/config.yml"; then
        isNewIssueWelcomeCommentFound=1
    fi
    assertEquals 1 $isNewIssueWelcomeCommentFound
}

testDotGithubSecurity() {
    isSecurityDataFound=0
    securityData1="(mailto:$MAIL)"
    securityData2="[$MAIL]"
    securityData3="he project's team and community take security issues"

    if grep -q "$securityData1" ".github/SECURITY.md" && grep -q "$securityData2" ".github/SECURITY.md" && grep -q "$securityData3" ".github/SECURITY.md"; then
        isSecurityDataFound=1
    fi
    assertEquals 1 $isSecurityDataFound
}

testDotGithubCODEOWNERS() {
    isCodeownersDataFound=0
    usernameData="$USERNAME"

    if grep -q "$usernameData" ".github/CODEOWNERS"; then
        isCodeownersDataFound=1
    fi
    assertEquals 1 $isCodeownersDataFound
}

testDotGitignore() {
    isGitignoreDataFound=0
    gitignoreData1="###> $USERNAME/$NAME ###"
    gitignoreData2="###< $USERNAME/$NAME ###"

    if grep -q "$gitignoreData1" ".gitignore" && grep -q "$gitignoreData2" ".gitignore"; then
        isGitignoreDataFound=1
    fi
    assertEquals 1 $isGitignoreDataFound
}

testDotChangelog() {
    isChangelogDataFound=0
    changelogData1="All notable changes to the"
    changelogData2="**$NAME**"
    changelogData3="$TYPE will be documented in this file."

    if grep -q "$changelogData1" "CHANGELOG.md" && grep -q "$changelogData2" "CHANGELOG.md" && grep -q "$changelogData3" "CHANGELOG.md"; then
        isChangelogDataFound=1
    fi
    assertEquals 1 $isChangelogDataFound
}

# Load and run shUnit2.
. tests/shunit2
