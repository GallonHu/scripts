#!/bin/sh

rsync -aruv --delete --progress $HOME/Documents/screenshot/ $HOME/github/pic/screenshot
rsync -aruv --delete --progress $HOME/Pictures/BingWallpaper/ $HOME/github/pic/bing/

GIT=`which git`
REPO_DIR=$HOME/github/pic/
commit_msg="Daily Backup at "$(date "+%Y-%m-%d %H:%M:%S")""
cd ${REPO_DIR}
${GIT} pull
${GIT} add -A
${GIT} commit -m "$commit_msg"
${GIT} push -u origin master
