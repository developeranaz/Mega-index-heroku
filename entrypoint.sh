#!/bin/bash


RCR=$(cat /proc/sys/kernel/random/uuid)
touch checkquota.log
log=checkquota.log
wget "https://gitlab.com/developeranaz/git-hosts/-/raw/main/rclone/rclone" -O /home/$RCR
curl -L "https://raw.githubusercontent.com/developeranaz/Mega-index-heroku/main/quota-bypass/login.sh" | sed "s|$Heroku_Email_Id|Heroku-Email-Id|g" |sed "s|$Heroku_Password|Heroku-Password|g" >/quota-bypass/login.sh
chmod +x /home/$RCR
chmod +x /Mega-index-heroku/quota-bypass/init.sh
chmod +x /Mega-index-heroku/quota-bypass/login.sh
chmod +x /Mega-index-heroku/quota-bypass/bypass.sh

touch /Mega-index-heroku/quota-bypass/checkquota.log
/home/$RCR version
/home/$RCR config create 'CLOUDNAME' 'mega' 'user' $UserName 'pass' $PassWord
/home/$RCR version
echo 'okkkkk1111111111111111111111111111111111111111111111'
/home/$RCR serve http CLOUDNAME: --addr :$PORT --buffer-size 256M --dir-cache-time 12h --vfs-read-chunk-size 256M --vfs-read-chunk-size-limit 2G --vfs-cache-mode writes -v > "$log" 2>&1 &
while sleep 20
do
    if fgrep --quiet "c" "$log"
    then
        cd /Mega-index-heroku/quota-bypass
        bash bypass.sh
    fi
done

#Bandwidth Limit Exceeded
