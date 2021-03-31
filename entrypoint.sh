#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
#refreshing Rclone
rclone version
#serving to port 8080
rclone serve http $STORAGENAME: --addr :$PORT
