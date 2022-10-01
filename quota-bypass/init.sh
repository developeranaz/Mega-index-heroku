#!/usr/bin/expect
spawn ./login.sh
expect "**"
send "\r"
expect "Logged"
interact
