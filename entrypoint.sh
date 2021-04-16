#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
#refreshing Rclone
rclone version
rclone copy /donate.developeranaz.txt $CLOUDNAME:
#serving to port 8080
rclone serve http $CLOUDNAME: --addr :$PORT --buffer-size 256M  --dir-cache-time 12h  --vfs-read-chunk-size 256M  --vfs-read-chunk-size-limit 2G  --vfs-cache-mode writes
