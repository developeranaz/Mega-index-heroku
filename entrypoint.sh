#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
rclone version
rclone config create 'CLOUDNAME' 'mega' 'user' $UserName 'pass' $PassWord
rclone version
rclone copy /donate-developeranaz.txt CLOUDNAME:
rclone serve http CLOUDNAME: -vvv --addr :$PORT  

