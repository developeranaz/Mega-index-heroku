#!/usr/bin/expect

spawn heroku login -i
expect "Email"
send "Heroku-Email-Id";
send "\r"
expect "Password"
send "Heroku-Password"
expect "Logged"
interact
