# Git Practice 
Learning git and version control 

## What I did today
- Check git version and git connection to GitHub

```bash
git --version 

git config --global user.name
git config --global user.email

```
- To configure git with my ID

```bash
git config --global user.name "Your Name" #email and username used for github
git config --global user.email "your.email@example.com"

```
- SSH test to confirm authentication
```bash
ssh -T git@github.com

```

- Set up SSH key for GitHub as it wasn't set up

```bash
ssh-keygen -t ed25519 -C "your.email@example.com" #used github email and ed25519 is a secure algorithm for generating keys, C flag to comment with email; saved in default locations

cat ~/.ssh/id_ed25519.pub #Copy public key and pasted to ssh key tab in github profile settings 

ssh -T git@github.com #verify it authenticated

```
- Next, I set up a local test-repo directory within ~/Documents/Projects/setup-learning/ for practice work/troubleshooting. 
- Create a local git repository

```bash
git init 

```

## Using VS Code to organise files 
- First I added code to PATH
- I entered shell command in the Command Palette and > installed code to enable command line 

```bash
code --version #verify vs code version
```
- I then opened the test-repo in VS code and created a new file, this README.md (Cmd + N)
- Use built in terminal window (Ctrl + `)

## Using git to save this permanently after saving locally with Cmd + S

```bash 

#check file status
git status

#stage files, prepares it to commit 
git add README.md 

#check status again
git status 

git commit -m "Initial commit: add README with git setup notes"  
# -m flag adds message describing what I did

#on github repo set up page, scrolled down and copied these ssh version commands
git remote add origin git@github.com:chris-hegde/Sandbox_26.git #connect local repo to github
git branch -M main #rename branch (created with git init) to main 
git push -u origin main  #push commits to github
```