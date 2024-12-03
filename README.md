# Git Reset to Pre-release Tag Script

## Description

This script allows you to perform a "rollback" of the `main` branch to a pre-release tag (or any commit tag) and invalidate the most recent commits. This is useful when you want a pre-release version to become the new `main`, and you want to invalidate the subsequent commits.

### Features

1. **Tag existence check**: The script checks if the specified pre-release tag exists before proceeding.
2. **Option to create a new `main` branch**: You can choose to create a new `main` branch based on the pre-release tag or reset the existing `main` branch to the tag commit.
3. **Force push**: It performs a force push to the remote repository to update the `main` branch and invalidate the most recent commits.

### Prerequisites
1. Git: The script requires Git to be installed on your system.
2. Access to the remote repository: You must be authenticated in your remote repository (e.g., GitHub, GitLab, etc.) to push changes.

### How to Use

1. **Download the script**:
   Download the script as `rollback-main.sh` to your computer.

2. **Make the script executable**:
   Once the file is downloaded, make it executable by running the following command:
   ```bash
   chmod +x rollback-main.sh
   ```

3 . **Run the script**:
   To run the script, enter the following command in your terminal:

   ```bash
   ./rollback-main.sh
   ```

Follow the interactive instructions: The script will guide you through the following steps:
-Enter the name of the pre-release tag.
-Choose whether to create a new main branch or reset the existing main branch to the tag.

**Warnings**
Force push: The force push (git push --force) will overwrite the remote branch history. This can affect other collaborators, so ensure you coordinate with your team before using it.
Backup: Make sure you have a backup of previous commits if you want to recover any changes later.




