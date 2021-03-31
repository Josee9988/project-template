#!/bin/bash

# SCRIPT WITH EXPORTED FUNCTIONS AND VARIABLES

writeREADME() {
    bash -c "NEW_USERNAME='NEW_USERNAME' PROJECT_NAME='PROJECT_NAME' PROJECT_TYPE='PROJECT_TYPE'; cat << EOF > README.md
<!-- Write your README.md file. Build something amazing! Modify this template as you wish -->
# 🔥 **$NEW_USERNAME/$PROJECT_NAME**

<p align=\"center\">
  <a href=\"https://github.com/$NEW_USERNAME/$PROJECT_NAME/issues\">
    <img alt=\"Issues\" src=\"https://img.shields.io/github/issues/$NEW_USERNAME/$PROJECT_NAME?color=0088ff&style=for-the-badge&logo=github\"/>
  </a>
  <a href=\"https://github.com/$NEW_USERNAME/$PROJECT_NAME/pulls\">
    <img alt=\"GitHub pull requests\" src=\"https://img.shields.io/github/issues-pr/$NEW_USERNAME/$PROJECT_NAME?color=0088ff&style=for-the-badge&logo=github\"/>
  </a>
</p>

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

---

## 🎉 Was the $PROJECT_TYPE helpful? Help us raise these numbers up

[![Github followers](https://img.shields.io/github/followers/$NEW_USERNAME.svg?style=social)](https://github.com/$NEW_USERNAME)
[![Github stars](https://img.shields.io/github/stars/$NEW_USERNAME/$PROJECT_NAME.svg?style=social)](https://github.com/$NEW_USERNAME/$PROJECT_NAME/stargazers)
[![Github watchers](https://img.shields.io/github/watchers/$NEW_USERNAME/$PROJECT_NAME.svg?style=social)](https://github.com/$NEW_USERNAME/$PROJECT_NAME/watchers)
[![Github forks](https://img.shields.io/github/forks/$NEW_USERNAME/$PROJECT_NAME.svg?style=social)](https://github.com/$NEW_USERNAME/$PROJECT_NAME/network/members)
[![Sponsor](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=github-sponsors&color=red&style=social)](https://github.com/sponsors/$NEW_USERNAME)

Enjoy! 😃

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
