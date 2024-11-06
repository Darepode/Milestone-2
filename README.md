# Report on Overleaf
>https://www.overleaf.com/project/6718b0e07d03821d876d5d55

# Quartus Project's Drive
>https://drive.google.com/drive/folders/11YV9bqOE44pIyt_7uzh9uudnhMhNMt9u

# Demonstration Video
<div align="center">
  <a href="https://www.youtube.com/watch?v=q0suqnxl2Yo">
    <img src="https://img.youtube.com/vi/q0suqnxl2Yo/0.jpg" alt="Centered Image" width="300"/>
  </a>
</div>

# Git in WSL Guide

## Table of Contents
- [Setting Up Git](#setting-up-git)
- [Basic Git Commands](#basic-git-commands)
  - [Clone Project From GitHub](#clone-project_from-github)
  - [Upload Project To GitHub](#clone-project_from-github)


## 1. Setting Up Git
> **MAKE SURE THAT GIT IS INSTALLED ON THE WINDOWS HOST !!!**

If Git is not installed on the Windows host, download and install it in powershell/cmd:
```powershell
winget install --id Git.Git -e --source winget
```
Update Git:
```powershell
git update-git-for-windows
```
Check for Git version:
```powershell
git --version
```
After that create a new repository on GitHub, clone that repository to your Windows host.
Follow step in section 2.1 to make changes in this local repo.
When you reach the step to push the code, a GitHub login window will appear as shown below:
<div align="center">
  <img src="https://i.sstatic.net/xFWKt4fi.png" alt="Centered Image" width="400"/>
</div>

Choose Sign in with your browser, sign in GitHub account and changes are updated to GitHub.

Above steps - Install the latest Git for Windows in order to share credentials & settings between 
WSL and the Windows host.
> **Configure Git Credential Manager**

_ If GIT installed on the Windows host is >= v2.39.0, type this command in WSL:
```bash
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
```
For older Git version and more detail please visit the link in the end of this section

_ Set up your **username** and **email** that will be used for commits:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

After complete configuration, use Git as usual on WSL.

>Above is the summary of the article "Get started using Git on Windows Subsystem for Linux"
>
>For more detail information, access the following link:
>https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-git


## 2. Basic Git Commands
### 2.1 Clone Project From GitHub
Cloning a project from GitHub:  (*IMPORTANT*)
```bash
git clone <repository-url>
```
To check the status of your repository and see if there are any changes:
```bash
git status
```
Make changes then add those changes to the staging area:    (*IMPORTANT*)
```bash
git add <file-name>   # To stage a specific file, or
git add .             # To stage all modified files
```
See the specific changes you've made to the files before staging them,
```bash
git diff
```
After staging the files, commit changes with a descriptive message:    (*IMPORTANT*)
```bash
git commit -m "Your commit message"
```
View the history of commits:
```bash
git log
```
Send local commits to the GitHub repository:    (*IMPORTANT*)
```bash
git push
```
Pull the latest updates from the remote GitHub repository:    (*IMPORTANT*)
```bash
git pull
```

### 2.2 Upload Project To GitHub
Initialize a Local Working Directory to Local Git Repository:
```bash
git init
```
Make changes then use some commands in section 1.1:  `add`, `commit`
Go to GitHub and log into your account, then create a new repository.
Add the GitHub Repository as a Remote:
```bash
git remote add origin <repository-url>
```
Change the main branch name from "master" to "main" :
```bash
git branch -M main
```
Push the Local Repository to GitHub:
```bash
git push -u origin main

```
>Just do above commands for the first time, after that use other commands in section 2.1 as usual.
