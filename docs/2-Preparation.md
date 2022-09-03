
## 1. Organize Folder Structure

This action uses the following configuration files

-   **User-specific Configuration File:** This file is automatically created by this GitHub Action with Enterprise License Downloaded from JFrog using credentials you are providing to this action as input. Also it used the input ADO Project URL. File is created at "$HOME/.local/share/SpecSync/specsync.json" in Linux Runners.
-   **Parent configuration files** Parent config file needs to be located at the Root of your project repo with name "specsync-common.json". This config has config variables which are common for whole project. We have a [template specsync-common.json](../specsync-templates/specsync-common.json) that you can copy and make changes. [Reference Documentation Located at](https://specsolutions.gitbook.io/specsync/features)
-   **Feature File Level (Child) configuration files** Feature File Level configuration files need to be located at Feature level and has definitions for only feature level specific config. For example if you have different Test Suites for each Feature File.


## 2. 