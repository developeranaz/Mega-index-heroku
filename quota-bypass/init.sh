#!/usr/bin/expect
spawn ./login.sh
sleep 5
expect "**"
send "\r"
expect "Logged"
interact
