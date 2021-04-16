#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
#refreshing Rclone
rclone version
rclone copy /donate.developeranaz.txt $CLOUDNAME:
#serving to port 8080
rclone serve http $CLOUDNAME: --addr :$PORT
