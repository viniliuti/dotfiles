# Crontab options for WSL

Runs every Wednesday to clear some garbage using disk space

```sh
16 12 * * 2 docker system prune --all --volumes --force
16 12 * * 2 kill -9 $(ps aux | grep vscode-server | grep $USER | grep -v grep | awk '{print $2}') 2>/dev/null && rm -rf /home/vliutix/.vscode-server
16 12 * * 2 yes | rm -rf ~/.cache/*
```
