<!-- markdownlint-disable MD032 MD033-->
# 🔥 **Josee9988's GitHub Project Template**

<p align="center">
  <a href="https://github.com/Josee9988/project-template/generate">
    <img width="100%" src="https://i.imgur.com/SVvgxJF.png" alt="@Josee9988/project-template's">
  </a>
  <br>
  <a href="https://github.com/Josee9988/project-template/issues">
    <img src="https://img.shields.io/github/issues/Josee9988/project-template?color=0088ff&style=for-the-badge&logo=github" alt="@Josee9988/project-template's issues"/>
  </a>
  <a href="https://github.com/josee9988/project-template/pulls">
    <img src="https://img.shields.io/github/issues-pr/Josee9988/project-template?color=0088ff&style=for-the-badge&logo=github" alt="@Josee9988/project-template's pull requests"/>
  </a>
  <a href="https://github.com/Josee9988/project-template/generate">
    <img src="https://img.shields.io/badge/use%20this-template-blue?logo=github-sponsors&style=for-the-badge&color=green" alt="@Josee9988/project-template link to create a new repository from the template">
  </a>
  <a href="ttps://github.com/Josee9988/project-template/actions/workflows/shelltest.yml">
    <img src="https://github.com/Josee9988/project-template/actions/workflows/shelltest.yml/badge.svg" alt="@Josee9988/project-template's tests">
  </a>
</p>

---

## 🤔 **What is this template all about?**

* This template can be used as a base layer for any of your future repositories/projects.
* Make your project easy to maintain with **8 issue templates**.
* Quick start your documentation with personalized **README badges** and a cool README structure.
* Manage your issues with **20 issue labels** created just for you!
* Make your _community healthier_ with all the guides like code of conduct, contributing, support, security...
* Learn more with the [official GitHub guide on creating repositories from a template](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template).
* To start using it; "**[click use this template](https://github.com/Josee9988/project-template/generate)**" and create your new repository,
* All the basic setup is made through an easy script that will auto-detect all your data to make it lightning fast! 🗲🗲 clone your new repository and execute the `SETUP_TEMPLATE.sh` shell script to personalize the files with your private details. Check how to execute it [here](https://asciinema.org/a/425259).
* All the markdown follows ["MarkdownLint" rules](https://github.com/DavidAnson/markdownlint).

---

## ⚡ **Installation**

1. To create a new repository from this template **[generate your new repository from this template](https://github.com/Josee9988/project-template/generate)**
for more information or guidance, follow the [GitHub guide](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template).
2. Install the [🤖 used GitHub bots](https://github.com/Josee9988/project-template#-used-github-bots) (recommended)
3. Clone your new repository **[generated from this template](https://github.com/Josee9988/project-template/generate)** and `cd` into it.
4. **Execute** the `SETUP_TEMPLATE.sh` shell script to **customize** the files with your data.

    ```bash
    bash SETUP_TEMPLATE.sh
    ```

    Or

    ```bash
    ./SETUP_TEMPLATE.sh
    ```

    Additionally, watch *[this video](https://asciinema.org/a/425259)* to see **how to execute the script** or use *`bash SETUP_TEMPLATE.sh --help`* to obtain some extra information.

    If the automatic detection of the username, project name or email is NOT right, please post an issue, and you can **manually correct** them using the optional arguments like: *`bash SETUP_TEMPLATE.sh --username=whatever --projectName=whatever --email=whatever --projectType=whatever`*

5. **Review** every single file and **customize** it as you like.
6. Build your project. 🚀

⚠️ _Customize every file to fit your requirements_ ⚠️

---

## 📚 **What does it include?**

1. A **`SETUP_TEMPLATE.sh`** script that **MUST be executed right when you clone your repository**.
The script will customize all the data with yours in all the files.

   1. A README template file with a default template to start documenting your project. (it includes personalized badges and text with your project details)
   1. A CHANGELOG template file based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
   1. An [issue_label_bot.yaml](/.github/issue_label_bot.yaml) file to use the issue adder GitHub bot. [Activate it or check its documentation](https://github.com/marketplace/issue-label-bot).
   1. A [config.yml](/.github/config.yml) file to modify multiple bot's behaviours.
   1. A [settings.yml](/.github/settings.yml) file to use the popular settings GitHub bot. [Activate it or check its documentation](https://probot.github.io/apps/settings/).
   1. A [CONTRIBUTING](/.github/CONTRIBUTING.md) explaining how to contribute to the project. [Learn more with the GitHub guide](https://docs.github.com/en/github/building-a-strong-community/setting-guidelines-for-repository-contributors).
   1. A [SUPPORT](/.github/SUPPORT.md) explaining how to support the project. [Learn more with the GitHub guide](https://docs.github.com/en/github/building-a-strong-community/adding-support-resources-to-your-project).
   1. A [SECURITY](/.github/SECURITY.md) with a guide on how to post a security issue. [Learn more with the GitHub guide](https://docs.github.com/en/code-security/getting-started/adding-a-security-policy-to-your-repository).
   1. A [CODEOWNERS](/.github/CODEOWNERS) with the new user as the main owner. [Learn more with the GitHub guide](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-code-owners).
   1. A [CODE_OF_CONDUCT](/.github/CODE_OF_CONDUCT.md) with a basic code of conduct. [Learn more with the GitHub guide](https://docs.github.com/en/github/building-a-strong-community/adding-a-code-of-conduct-to-your-project).
   1. A [PULL_REQUEST_TEMPLATE](/.github/pull_request_template.md) with a template for your pull request that closes issues with keywords. [Learn more with the GitHub guide](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository).
   1. Multiple [issues templates](/.github/ISSUE_TEMPLATE). [Learn more with the GitHub guide](https://docs.github.com/en/github/building-a-strong-community/configuring-issue-templates-for-your-repository).
        1. A [config.yml](/.github/ISSUE_TEMPLATE/config.yml) with the config and information about the issue templates.
        1. A [Blank issue template](/.github/ISSUE_TEMPLATE) with the super basic stuff, all the issues should contain.
        1. A [Bug issue template](/.github/ISSUE_TEMPLATE/1-bug-report.md).
        1. A [Failing test issue template](/.github/ISSUE_TEMPLATE/2-failing-test.md).
        1. A [Documentation issue template](/.github/ISSUE_TEMPLATE/3-docs-bug.md).
        1. A [Feature request issue template](/.github/ISSUE_TEMPLATE/4-feature-request.md).
        1. An [Enhancement request issue template](/.github/ISSUE_TEMPLATE/5-enhancement-request.md).
        1. A [Security report issue template](/.github/ISSUE_TEMPLATE/6-security-report.md).
        1. A [Question or support issue template](/.github/ISSUE_TEMPLATE/7-question-support.md).

---

### 🌲 **Project tree**

Files that will get removed after the execution of `SETUP_TEMPLATE.sh` are not shown! 🙈

```text
.
├── CHANGELOG.md
├── .github
│   ├── CODE_OF_CONDUCT.md
│   ├── CODEOWNERS
│   ├── config.yml
│   ├── CONTRIBUTING.md
│   ├── FUNDING.yml
│   ├── issue_label_bot.yaml
│   ├── ISSUE_TEMPLATE
│   │   ├── 1-bug-report.md
│   │   ├── 2-failing-test.md
│   │   ├── 3-docs-bug.md
│   │   ├── 4-feature-request.md
│   │   ├── 5-enhancement-request.md
│   │   ├── 6-security-report.md
│   │   ├── 7-question-support.md
│   │   └── config.yml
│   ├── ISSUE_TEMPLATE.md
│   ├── pull_request_template.md
│   ├── SECURITY.md
│   ├── settings.yml
│   └── SUPPORT.md
├── .gitignore
└── README.md

2 directories, 22 files
```

---

## 📝 **Additional notes**

* After **[generating your new repo with this template](https://github.com/Josee9988/project-template/generate)**, make sure to, right after you clone it, run the script `SETUP_TEMPLATE.sh`.

* Then you will be presented with all the files modified with your project details and information. It is very important to **manually review every file** to check if it fits your requirements and performs any necessary changes to customize the project as you want.

* If you are using **Windows** and you don't know how to execute the `SETUP_TEMPLATE.sh` script:
  1. Install **[git for Windows](https://git-scm.com/download/win)**.
  2. Right-click on the git repository folder and click "*git bash here*".
  3. Then just perform *`bash SETUP_TEMPLATE.sh`* **or** *`chmod u+x SETUP_TEMPLATE.sh && ./SETUP_TEMPLATE.sh`*.

### 🤖 **Used GitHub bots**

These are recommended bots that are prepared and configured for this template. If you install them your coding experience will probably be much better.
We deeply recommend at least installing the [issue label bot](https://github.com/marketplace/issue-label-bot) as this bot is the one that adds all the labels used in the issue templates.

1. The `issue_label_bot.yaml` file depends on the **[issue label bot](https://github.com/marketplace/issue-label-bot)** (✓ highly recommended).
2. The `settings.yml` file depends on the **[settings label bot](https://probot.github.io/apps/settings/)** (optional).
3. The `config.yml` file depends on the bot **[welcome bot](https://probot.github.io/apps/welcome/)** and **[to-do bot](https://probot.github.io/apps/todo/)** (optional).

---

## 📸 **Screenshots**

A couple of screenshots to delight you before you use this template.

### 🔺 All the issue templates

<p align="center">
  <img width="70%" height="70%" src="https://i.imgur.com/SDJixBz.png" alt="All the issue templates.">
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

If the bot [probot-settings](https://probot.github.io/apps/settings/) is not installed you will not have these beautiful labels! (there are actually more issue labels than in the image!)

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

## 💉 **Project tests**

If you want to improve the development of this project, you must, after changing or improving whatever, run the project's tests to prove that they are working.

To do so:

```bash
bash tests/TESTS_RUNNER.sh
```

---

## 🍰 **Supporters and donators**

<a href="https://github.com/Josee9988/project-template/generate">
  <img alt="@Josee9988/project-template's brand logo without text" align="right" src="https://i.imgur.com/3qK1sie.png" width="18%" />
</a>

We are currently looking for new donators to help and maintain this project! ❤️

By donating, you will help the development of this project, and *you will be featured in this project's README.md*, so everyone can see your kindness and visit your content ⭐.

<a href="https://github.com/sponsors/Josee9988">
  <img src="https://img.shields.io/badge/Sponsor-Josee9988/project template-blue?logo=github-sponsors&style=for-the-badge&color=red">
</a>

---

## 🎉 Was the template helpful? Help us raise these numbers up

[![GitHub's followers](https://img.shields.io/github/followers/Josee9988.svg?style=social)](https://github.com/Josee9988)
[![GitHub stars](https://img.shields.io/github/stars/Josee9988/project-template.svg?style=social)](https://github.com/Josee9988/project-template/stargazers)
[![GitHub watchers](https://img.shields.io/github/watchers/Josee9988/project-template.svg?style=social)](https://github.com/Josee9988/project-template/watchers)
[![GitHub forks](https://img.shields.io/github/forks/Josee9988/project-template.svg?style=social)](https://github.com/Josee9988/project-template/network/members)

Enjoy! 😃

> ⚠️ Remember that this template should be reviewed and modified to fit your requirements.
> The script **SETUP_TEMPLATE.sh** should be executed right when you clone your new repository generated from [here](https://github.com/Josee9988/project-template/generate).
> There will be files that will need *manual revision* ⚠️

_Made with a lot of ❤️❤️ by **[@Josee9988](https://github.com/Josee9988)**_
