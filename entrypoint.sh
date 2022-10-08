#!/bin/bash


RCR=$(cat /proc/sys/kernel/random/uuid)
touch checkquota.log
log=checkquota.log
wget "https://gitlab.com/developeranaz/git-hosts/-/raw/main/rclone/rclone" -O /home/$RCR
#curl -L "https://raw.githubusercontent.com/developeranaz/Mega-index-heroku/main/quota-bypass/login.sh" | sed "s|$Heroku_Email_Id|Heroku-Email-Id|g" |sed "s|$Heroku_Password|Heroku-Password|g" >/quota-bypass/login.sh
chmod +x /home/$RCR
chmod +x /Mega-index-heroku/quota-bypass/init.sh
chmod +x /Mega-index-heroku/quota-bypass/login.sh
chmod +x /Mega-index-heroku/quota-bypass/bypass.sh

touch /Mega-index-heroku/quota-bypass/checkquota.log
/home/$RCR version
/home/$RCR config create 'CLOUDNAME' 'mega' 'user' $UserName 'pass' $PassWord

while :
do

if [ "$Auto_Quota_Bypass" = true ] ; then
    


/home/$RCR serve http CLOUDNAME: --addr :$PORT --buffer-size 256M --dir-cache-time 12h --vfs-read-chunk-size 256M --vfs-read-chunk-size-limit 2G --vfs-cache-mode writes > "$log" 2>&1 &
while sleep 10
do
    if fgrep --quiet "Bandwidth Limit Exceeded" "$log"
    then
        cd /Mega-index-heroku/quota-bypass
        bash bypass.sh
    fi
done

#
else 
/home/$RCR serve http CLOUDNAME: --addr :$PORT --buffer-size 256M --dir-cache-time 12h --vfs-read-chunk-size 256M --vfs-read-chunk-size-limit 2G --vfs-cache-mode writes 


fi


done


# if failed or exit run incase emergency
echo "Auto_Quota_Bypass :$Auto_Quota_Bypass, value error please use true or false. Check your Heroku config vars"
/home/$RCR serve http CLOUDNAME: --addr :$PORT --buffer-size 256M --dir-cache-time 12h --vfs-read-chunk-size 256M --vfs-read-chunk-size-limit 2G --vfs-cache-mode writes 

