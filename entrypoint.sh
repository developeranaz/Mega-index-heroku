#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
#refreshing Rclone
rclone version
#serving to port 8080
rclone serve http 1sundaran1: --addr :$PORT
#screen -d -m rclone sync 1sundaran1: /usr/share/nginx/html/cop
#mounting cloud to /usr/share/nginx/html/cop
#rclone sync 1sundaran1: /usr/share/nginx/html/cop
#starting nginx to http://appname.herokuapp.com/cop/
#/bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
