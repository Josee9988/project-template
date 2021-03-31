#!/bin/bash

# SCRIPT WITH EXPORTED FUNCTIONS AND VARIABLES

writeREADME() {
    bash -c "NEW_USERNAME='NEW_USERNAME' PROJECT_NAME='PROJECT_NAME'; cat << EOF > README.md
<!-- Write your README.md file. Build something amazing! Modify this template as you wish -->
# 🔥 **$NEW_USERNAME/$PROJECT_NAME**

---

# ⚡ **Getting started**

* <!-- ... [YOU AWESOME TEXT HERE :D] -->

---

# 🚀 **Usage**

* <!-- ... [YOU AWESOME TEXT HERE :D] -->

---

# 📝 **Aditional notes**

* <!-- ... [YOU AWESOME TEXT HERE :D] -->

---

# ⚖️ **License and Changelog**

See the license in **[LICENSE](LICENSE)** file.

Watch the changes in the **[CHANGELOG.md](CHANGELOG.md)** file.

---

<!-- You may delete this if you want to -->
This project was generated using *[Josee9988/project-template](https://github.com/Josee9988/project-template)* 📚

_Made with a lot of ❤️❤️ by **[@$NEW_USERNAME](https://github.com/$NEW_USERNAME)**_
EOF"
}

writeCHANGELOG() {
    ACTUAL_DATE=$(date '+%Y-%m-%d')
    bash -c "PROJECT_NAME='PROJECT_NAME' PROJECT_TYPE='PROJECT_TYPE' ACTUAL_DATE='ACTUAL_DATE'; cat << EOF > CHANGELOG.md
<!-- markdownlint-disable MD024-->
# **Change Log** 📜📝

All notable changes to the \"**$PROJECT_NAME**\" $PROJECT_TYPE will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [**0.0.1**] - $ACTUAL_DATE

### Added

* The basic project structure from **[josee9988/project-template](https://github.com/Josee9988/project-template)**.
EOF"
}
