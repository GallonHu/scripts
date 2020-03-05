#!/bin/sh
localDir="$HOME/Pictures/BingWallpaper"
filenameRegex=".*"$(date "+%Y-%m-%d")".*jpg"
log="$localDir/log.log"

findResult=$(find $localDir -regex $filenameRegex)
while [ ! -n "$findResult" ]
do
    baseUrl="cn.bing.com"
    target=$(curl -L $baseUrl | grep href=\"/th)
    imgUrl=$(expr "$target" : '.*href=\"\(\/th.*\.jpg\)')
    imgName=$(expr "$imgUrl" : '.*\.\(.*\.jpg\)\&')
    localpath="$localDir/$(date "+%Y-%m-%d")-$imgName"
    echo "$imgUrl $imgName $localpath"
    curl -o $localpath $baseUrl/$imgUrl
    osascript -e "                              \
        tell application \"System Events\" to   \
            tell every desktop to               \
                set picture to \"$localpath\""
    osascript -e "display notification \"$filename Downloaded\" with title \"BingWallpaper\""
    # echo "$(date +"%Y-%m-%d %H:%M:%S") Downloaded $filename" >> $log
    findResult=$(find $localDir -regex $filenameRegex)
done
echo "done"
