#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
#refreshing Rclone
#rclone version
#serving to port 8080
#rclone serve http $STORAGENAME: --addr :$PORT
#docker run -it rclone/rclone serve http 1sundaran1: --addr :$PORT
docker run -it pfidr/rclone serve http 1sundaran1: --addr :$PORT
