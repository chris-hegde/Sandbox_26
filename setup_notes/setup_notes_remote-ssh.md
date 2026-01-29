# Set up - Link VS code to HPC using remote-ssh

## In VS code, install the following:
- R (REditorSupport) - R syntax, debugging 
- GitLens (GitKraken) - viz git
- Remote SSH (Microscft) - connect to HPC

```bash
#Check SSH config 
cat ~/.ssh/config  # shows SSH configuration file 

#to create if there's none 
code ~/.ssh/config               # opens it in VS Code

#Paste the following and save file 
#Host amarel
#    HostName amarel.rutgers.edu
#    User <netid>

```

## To connect to host 
- cmd+shift+P to palette and enter Remote-SSH 
- select >Connect to host and amarel (should be visible after saving the config file)

## This opens a new VS code window and password prompts. However, it does not work. 
