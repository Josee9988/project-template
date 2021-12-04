# Folder **tests/**

* Folder with all the tests used to test the "../SETUP_TEMPLATE.sh" script.

## Files

### The *tests/shunit2*

* Framework used for the unit tests more info can be found in the [shunit2's GitHub repository](https://github.com/kward/shunit2).

### The *tests/argument_help_parser.sh*

* Test suite for testing the help flag (--help).

### The *tests/custom_data_test.sh*

* Test suite for testing the modified custom data, after executing the SETUP_TEMPLATE script.

### The *tests/project_scaffolding_test.sh*

* Test suite for testing the project scaffolding after executing the SETUP_TEMPLATE script.

### The *tests/TESTS_RUNNER.sh*

* Main test script that will call all the individual unitary tests. Exit code 1 means an error in one or more tests was found, otherwise, the exit code will be 0.
