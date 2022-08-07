<!-- markdownlint-disable MD024-->
# **Change Log** 📜📝

All notable changes to the "**Project template**" repository will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [**1.11.8**] - 2022-08-07

### Fixed

* Multiple typos and grammar issues.
* From 'cp -r *' to 'cp -r ./*' in the tests, so names with dashes won't become options.

## [**1.11.7**] - 2021-12-05

### Added

* In the main script, removing the bin/ folder, the LICENSE file and the script itself will not prompt errors if there are any problems

## [**1.11.6**] - 2021-12-04

### Added

* Two 'README.md' files at the bin/ and tests/ folder to help describe what the folder purpose is.

## [**1.11.5**] - 2021-11-19

### Fixed

* Some typos in multiple files.

## [**1.11.4**] - 2021-11-01

### Fixed

* Multiple spelling mistakes in the README and CHANGELOG files.

## [**1.11.3**] - 2021-08-03

### Added

* Improved gitignore comments

## [**1.11.2**] - 2021-07-30

### Added

* Git ignored multiple common folder and files.

## [**1.11.1**] - 2021-07-25

### Added

* Simple documentation in the bin/FUNCTION_HELPERS.sh script.

## [**1.11.0**] - 2021-07-24

### Added

* Divided the --omit-commit-and-verification argument into two separate ones '--omit-commit' and '--omit-verification'.

## [**1.10.5**] - 2021-07-21

### Added

* Improved all the documentation in the scripts.

## [**1.10.4**] - 2021-07-20

### Added

* More error information when the tests fail.
* The new logos in the generated README for the user to change them with their own one.
* More documentation in the project's readme.md
* Informational error in the script when an unknown argument is encountered.

### Removed

* Two useless FUNCTION_HELPERS's functions displaying errors.
* Useless 'chmod' declaration in the TESTS_RUNNER script
* The exit conditions of the TESTS_RUNNER script in the same if statement.

## [**1.10.3**] - 2021-07-19

### Added

* A new logo in the readme.md
* The brand logo in the sponsors part.
* Alt attribute for all the README's images
* More guidance for the used GitHub bots

### Fixed

* Some README's 'alt' attribute.
* Some README's broken links

## [**1.10.2**] - 2021-07-17

### Added

* A GitHub actions workflow to check the tests.
* Execute permissions for the SETUP_TEMPLATE.sh script

### Fixed

* Some minor issues with the README.md.

## [**1.10.1**] - 2021-07-16

### Added

* An exit code for the tests_runner script.
* The SETUP_TEMPLATE will look up for the tests_runner exit code to verify if the tests failed or not.
* All the tests which call the SETUP_TEMPLATE now will append the --omit-tests flag to avoid test recursion.

## [**1.10.0**] - 2021-07-15

### Added

* Checking of the tests before the execution of the script, avoidable using the --omit-test-check argument.

## [**1.9.2**] - 2021-07-14

### Added

* More tests for the help parser script
* A version argument that will display the current script version

### Fixed

* Some typos
* The README's link to the issues

### Changed

* The SETUP_TEMPLATE usage comments

### Removed

* When the user selects "n" in the choice, it will not show the help texts. Only if the --help argument is provided.

## [**1.9.1**] - 2021-07-13

### Changed

* Asciinema video explaining how the script works

## [**1.9.0**] - 2021-07-13

### Added

* The script will parse arguments like --argument=value.
* Added one "help" argument test.
* Updated the tests to be in sync with the new argument parse feature.
* The tests_runner will chmod the test folder before executing the tests.
* Aliases for the --omit-commit argument

### Fixed

* Some typos

## [**1.8.2**] - 2021-07-11

### Added

* Some minor comments in the test scripts

### Changed

* The asciinema video

## [**1.8.1**] - 2021-07-10

### Added

* Basic file documentation for all the tests.
* Improved the TESTS_RUNNER script.

### Fixed

* Some minor typos.
* The README's project tree

### Changed

* The comment 'BASH_VERSION' in all the scripts to the actual one.

## [**1.8.0**] - 2021-07-09

### Added

* Multiple bash unit tests.
* The SETUP_TEMPLATE.sh now takes a 4th argument which is the type of the project.
* Updated the README to add the documentation of the new test

### Fixed

* Modified a couple of files where the project name was not changed.

### Changed

* Modified the SETUP_TEMPLATE.sh to make it available for the tests.
* Improved the .github/SECURITY.md file

## [**1.7.2**] - 2021-07-08

### Added

* Multiple new .gitignore lines and improved its comment structure.

### Fixed

* Minor typo in the generated README.md

## [**1.7.1**] - 2021-07-01

### Added

* `.env` file will be ignored in the `.gitignore`.
* Disabled some Markdown link rules in the generated README.md
* Fixed some minor errors in the README.md file

## [**1.7.0**] - 2021-06-01

### Added

* Type: Test issue label.
* Failing test issue template adds the new Type Test issue label.
* Update README.md with the new label.

## [**1.6.0**] - 2021-05-21

### Added

* Divided the feature request into feature and enhancement requests, each one with its respective labels.

### Changed

* Position of disclaimers and comments in the issue templates are moved to the bottom (but the security report) as some users directly erased everything to not read the text.
* Image of the issue templates in the readme.md file.

## [**1.5.0**] - 2021-05-15

### Added

* Auto-detection of user email.

## [**1.4.5**] - 2021-04-24

### Added

* Sponsor section in the project's main readme.md file.
* Improved and added documentation in the scripts.

### Fixed

* README "What does it include" fixed list of files.
* Sponsor link in the generated README.md file.
* Some typos

## [**1.4.4**] - 2021-04-22

### Added

* --help option in the script.
* More documentation and information for the user in the script prompts

## [**1.4.3**] - 2021-04-21

### Added

* Support for GitHub to-do app.

## [**1.4.2**] - 2021-04-20

### Added

* An extra informational message in the script.
* Welcome bot and its config (.GitHub/config.yml)

### Fixed

* Issue templates now auto assigns the new labels.

## [**1.4.1**] - 2021-04-20

### Added

* Security label

### Changed

* Project tree to its updated version.

## [**1.4.0**] - 2021-04-19

### Added

* README file with the section with the recommended/used bots that the users should install.
* Some informational comments in the script referencing the project's documentation.
* A total of 18 new labels will be created right when you clone your repo using GitHub 'Probot' settings.

## [**1.3.0**] - 2021-04-14

### Added

* CODEOWNERS file inside the '.GitHub/' folder.

### Fixed

* Some README.md Markdown link bugs.

## [**1.2.0**] - 2021-04-07

### Added

* Bug report issue templates have the preceding "[BUG]" title.
* Multiple README template headings (About the project, project tree, screenshots, donators).
* Improved README.md template by fixing some minor problems.

## [**1.1.1**] - 2021-04-02

### Added

* Username and project name are automatically selected (user can manually force change them using bash parameters [Username] [Project-Name])

### Changed

* Asciinema video

## [**1.1.0**] - 2021-03-31

### Added

* Gitignore file ignores all \*.ignore.\* files.
* Basic README.md template.
* A bin/FUNCTION_HELPERS script to improve the readability of the SETUP_TEMPLATE.sh file.

### Changed

* Header's emoji from the end of the README.md headers to the beginning to be shown better by the new GitHub's README table of contents.

### Fixed

* Git status is shown before the commit.

### Fixed

* Some typos in the CHANGELOG.md.

## [**1.0.11**] - 2021-03-20

### Added

* Social links of the repo in the README.md file.
* Added badges in the README.md file.
* Added sponsor link in the contributing.yml file.

### Fixed

* Some minor typos in the README.md file.

## [**1.0.10**] - 2021-03-17

### Changed

* `EXECUTEME.sh` script changed to `SETUP_TEMPLATE.sh`.
* Changed the execution video from the README.md file (Asciinema's video).

## [**1.0.9**] - 2021-03-17

### Added

* The script will 'git add' and 'commit' the new files/changes for you.

## [**1.0.8**] - 2021-03-17

### Changed

* Improved README.md structure and fixed some typos.

### Added

* 'Extra recommendations' section in the README.md file.

## [**1.0.7**] - 2021-03-16

### Fixed

* Some minor typos

## [**1.0.6**] - 2021-03-16

### Changed

* Simplified PR template to make it easier.

## [**1.0.5**] - 2021-03-13

### Added

* Checks to the shell script (check if the files exist)
* Colorized the output of the script.

## [**1.0.4**] - 2021-02-26

### Added

* MarkdownLint disable the rule in the "CHANGELOG.md" file.

## [**1.0.3**] - 2021-02-23

### Removed

* Josee's funding links.

### Added

* Shell script now checks if the '.github' directory exists.

## [**1.0.2**] - 2020-09-08

### Added

* One more screenshot to the README.md file showing the community profile.
* Documentation for the SETUP_TEMPLATE.sh script.

### Changed

* The project tree view showing the new LICENSE file.

## [**1.0.1**] - 2020-09-08

### Added

* A LICENSE for the project will be removed with the SETUP_TEMPLATE.sh script.

### Changed

* The location of the pull request template to the '.GitHub/' folder.

## [**1.0.0**] - 2020-09-08

### Added

* Added a CHANGELOG.md.
* Support for the CHANGELOG in the SETUP_TEMPLATE.sh file (when run, it will remove all the content and create a new file from scratch).
