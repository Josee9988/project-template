<!-- markdownlint-disable MD032 MD033-->
# 🔥 **Josee9988's Github Project Template**

<p align="center">
  <img width="100" height="100" src="https://i.imgur.com/Njl3HJc.png" alt="Logo">
  <br>
  <a href="https://github.com/Josee9988/project-template/issues">
    <img alt="Issues" src="https://img.shields.io/github/issues/Josee9988/project-template?color=0088ff&style=for-the-badge&logo=github" />
  </a>
  <a href="https://github.com/josee9988/project-template/pulls">
    <img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/Josee9988/project-template?color=0088ff&style=for-the-badge&logo=github" />
  </a>
  <a href="https://github.com/Josee9988/project-template/generate">
    <img src="https://img.shields.io/badge/use%20this-template-blue?logo=github-sponsors&style=for-the-badge&color=red">
  </a>
</p>

---

## 🤔 **What is this template all about?**

* This template can be used as a base layer for any of your future repositories/projects.
* Make your project easy to maintain with **7 issue templates**.
* Quickstart your documentation with personalized **readme badges** and a cool readme structure.
* Manage your issues with **19 issue labels** created just for you!
* Make your _community healthier_ with all the guides like code of conduct, contributing, support, security...
* Learn more with the [official Github guide on creating repositories from a template](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template).
* To start using it; "**[click use this template](https://github.com/Josee9988/project-template/generate)**", create your new repository,
clone your new repository and execute the `SETUP_TEMPLATE.sh` shell script to personalize the markdowns with your private details. Check how to execute it [here](https://asciinema.org/a/398761).
* All the markdown follows [MarkdownLint rules](https://github.com/DavidAnson/markdownlint).

---

## ⚡ **Installation**

1. To create a new repository from this template **[generate your new repository from this template](https://github.com/Josee9988/project-template/generate)**
for more information or guidance, follow the [Github guide](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template).
2. Clone your new repository **[generated from this template](https://github.com/Josee9988/project-template/generate)** and `cd` into it.
3. **Execute** the `SETUP_TEMPLATE.sh` shell script to **customize** the files with your data.
  
    ```bash
    bash SETUP_TEMPLATE.sh # additional parameters [Username] [Project-Name]
    ```

    Or you can also do it like this:

    ```bash
    chmod u+x SETUP_TEMPLATE.sh && ./SETUP_TEMPLATE.sh # additional parameters [Username] [Project-Name]
    ```

    Additionally, watch *[this video](https://asciinema.org/a/404568)* to see **how to execute the script**.
  
    If the automatic detection of the username and project name are NOT right, please post an issue, and you can **manually correct** them like: `bash SETUP_TEMPLATE.sh RightUsername RightProjectName` being `$1` the new username and `$2` the new project name.

4. **Review** every single file and **customize** it as you like.
5. Build your project. 🚀

⚠️ _Customize every file to fit your requirements_ ⚠️

---

## 📚 **What does it include?**

1. A **`SETUP_TEMPLATE.sh`** script that **MUST be executed right when you clone your repository**.
The script will replace Jose's username and email (the author) with yours from all the.

   1. A README template file with a default template to start documenting your project. (it includes personalized badges and text with your project details)
   1. A CHANGELOG template file based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
   1. An [issue_label_bot.yaml](/.github/issue_label_bot.yaml) file to use the issue adder Github bot. [Activate it or check its documentation](https://github.com/marketplace/issue-label-bot).
   1. A [config.yml](/.github/config.yml) file to modify multiple bot's behaviour.
   1. A [settings.yml](/.github/settings.yml) file to use the popular settings Github bot. [Activate it or check its documentation](https://probot.github.io/apps/settings/).
   1. A [CONTRIBUTING](/.github/CONTRIBUTING.md) explaining how to contribute to the project. [Learn more with the Github guide](https://docs.github.com/en/github/building-a-strong-community/setting-guidelines-for-repository-contributors).
   1. A [SUPPORT](/.github/SUPPORT.md) explaining how to support the project. [Learn more with the Github guide](https://docs.github.com/en/github/building-a-strong-community/adding-support-resources-to-your-project).
   1. A [SECURITY](/.github/SECURITY.md) with a guide on how to post a security issue. [Learn more with the Github guide](https://docs.github.com/es/github/managing-security-vulnerabilities/adding-a-security-policy-to-your-repository).
1. A [CODEOWNERS](/.github/CODEOWNERS) with the new user as the main owner. [Learn more with the Github guide](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-code-owners).
1. A [CODE_OF_CONDUCT](/.github/CODE_OF_CONDUCT.md) with a basic code of conduct. [Learn more with the Github guide](https://docs.github.com/en/github/building-a-strong-community/adding-a-code-of-conduct-to-your-project).
1. A [PULL_REQUEST_TEMPLATE](/.github/pull_request_template.md) with a template for your pull request that closes issues with keywords. [Learn more with the Github guide](https://docs.github.com/es/github/building-a-strong-community/creating-a-pull-request-template-for-your-repository).
1. Multiple [issues templates](/.github/ISSUE_TEMPLATE). [Learn more with the Github guide](https://docs.github.com/en/github/building-a-strong-community/configuring-issue-templates-for-your-repository).
      1. A [config.yml](/.github/ISSUE_TEMPLATE/config.yml) with the config and information about the issue templates.
      1. A [Blank issue template](/.github/ISSUE_TEMPLATE) with the super basic stuff, all the issues should contain.
      1. A [Bug issue template](/.github/ISSUE_TEMPLATE/1-bug-report.md).
      1. A [Failing test issue template](/.github/ISSUE_TEMPLATE/2-failing-test.md).
      1. A [Documentation issue template](/.github/ISSUE_TEMPLATE/3-docs-bug.md).
      1. A [Feature request issue template](/.github/ISSUE_TEMPLATE/4-feature-request.md).
      1. A [Security report issue template](/.github/ISSUE_TEMPLATE/5-security-report.md).
      1. A [Question or support issue template](/.github/ISSUE_TEMPLATE/6-question-support.md).

---

### 🌲 **Project tree**

Files that will get removed after the execution of `SETUP_TEMPLATE.sh` are not shown! 🙈

```text
.
├── CHANGELOG.md
├── .github
│   ├── CODE_OF_CONDUCT.md
│   ├── CODEOWNERS
│   ├── CONTRIBUTING.md
│   ├── FUNDING.yml
│   ├── issue_label_bot.yaml
│   ├── config.yml
│   ├── ISSUE_TEMPLATE
│   │   ├── 1-bug-report.md
│   │   ├── 2-failing-test.md
│   │   ├── 3-docs-bug.md
│   │   ├── 4-feature-request.md
│   │   ├── 5-security-report.md
│   │   ├── 6-question-support.md
│   │   └── config.yml
│   ├── ISSUE_TEMPLATE.md
│   ├── pull_request_template.md
│   ├── SECURITY.md
│   ├── settings.yml
│   └── SUPPORT.md
├── .gitignore
└── README.md

2 directories, 20 files
```

---

## 📝 **Additional notes**

* After **[generating your new repo with this template](https://github.com/Josee9988/project-template/generate)**, make sure to, right after you clone it, run the script `SETUP_TEMPLATE.sh`.

* Then you will be presented with all the files modified with your project details and information. It is very important to **manually review every file** to check if it fits your requirements and performs any necessary changes to customize the project as you want.

* If you are using **Windows** and you don't know how to execute the `SETUP_TEMPLATE.sh` script:
  1. Install **[git for Windows](https://git-scm.com/download/win)**.
  2. Right-click on the git repository folder and click "*git bash here*".
  3. Then just perform *`bash SETUP_TEMPLATE.sh`* **or** *`chmod u+x SETUP_TEMPLATE.sh && ./SETUP_TEMPLATE.sh`*.

### 🤖 **Used Github bots**

1. The `issue_label_bot.yaml` file depends on the **[issue label bot](https://github.com/marketplace/issue-label-bot)**.
2. The `settings.yml` file depends on the **[settings label bot](https://probot.github.io/apps/settings/)**.
3. The `config.yml` file depends on the bot **[welcome bot](https://probot.github.io/apps/welcome/)**.

---

## 📸 **Screenshots**

A couple of screenshots to delight you before you use this template.

### 🔺 All the issue templates

<p align="center">
  <img width="70%" height="70%" src="https://i.imgur.com/BWOdDCb.png" alt="All the issue templates.">
</p>

### 🔻 An issue template opened

<p align="center">
  <img width="70%" height="70%" src="https://i.imgur.com/r5AiLWu.png" alt="Bug issue template opened.">
</p>

### 📘 The README template

Badges and texts will be replaced with your project details!

<p align="center">
  <img width="70%" height="70%" src="https://i.imgur.com/dKKh53K.png" alt="README.md template.">
  
  Or watch [this video](https://gifs.com/gif/josee9988-s-readme-md-MwO5E3) to see the whole README template.
</p>

### 🔖 The labels for your issues

If the bot [probot-settings](https://probot.github.io/apps/settings/) is not installed you will not have these beautiful labels!

<p align="center">
  <img width="70%" height="70%" src="https://i.imgur.com/dS91k6R.png" alt="LABELS">
</p>

### 📝 The CHANGELOG template

(project name and project type will be replaced with yours)

<p align="center">
  <img width="70%" height="70%" src="https://i.imgur.com/ScWgQKI.png" alt="CHANGELOG.md template.">
</p>

### 🛡️ Security policy

<p align="center">
  <img width="70%" height="70%" src="https://i.imgur.com/ArwDQTi.png" alt="Security issue.">
</p>

### 💼 Community profile at 100%

<p align="center">
  <img width="70%" height="70%" src="https://i.imgur.com/kRt3lPs.png" alt="Community profile.">
</p>

---

## 🕵️ **Extra recommendations**

For the right maintenance of the CHANGELOG.md, we recommend this [VSCode extension](https://github.com/Josee9988/Changelog-and-Markdown-snippets)
and the read and understanding of the [keep a changelog guide](https://keepachangelog.com/en/1.0.0/).
Read and comment about it in this [dev.to post](https://dev.to/josee9988/the-ultimate-github-project-template-1264).
We also recommend installing all the [used bots](https://github.com/Josee9988/project-template#-used-github-bots).

---

## 🎉 Was the template helpful? Help us raise these numbers up

[![Github followers](https://img.shields.io/github/followers/Josee9988.svg?style=social)](https://github.com/Josee9988)
[![Github stars](https://img.shields.io/github/stars/Josee9988/project-template.svg?style=social)](https://github.com/Josee9988/project-template/stargazers)
[![Github watchers](https://img.shields.io/github/watchers/Josee9988/project-template.svg?style=social)](https://github.com/Josee9988/project-template/watchers)
[![Github forks](https://img.shields.io/github/forks/Josee9988/project-template.svg?style=social)](https://github.com/Josee9988/project-template/network/members)
[![Sponsor](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=github-sponsors&color=red&style=social)](https://github.com/sponsors/Josee9988)

Enjoy! 😃

> ⚠️Remember that this template should be reviewed and modified to fit your requirements.
> The script **SETUP_TEMPLATE.sh** should be executed right when you clone your new repository.
> There will be files that will need *manual revision*⚠️

_Made with a lot of ❤️❤️ by **[@Josee9988](https://github.com/Josee9988)**_
