#!/bin/bash
cat login.sh > logcache.sh
cat logcache.sh |sed "s/Heroku-Email-Id/$Heroku_Email_Id/g" |sed "s/Heroku-Password/$Heroku_Password/g" >login.sh
chmod +x init.sh
chmod +x login.sh
./init.sh
heroku authorizations:create >access_token
htoken="$(cat access_token |grep 'Token:'|sed 's|Token:||g' |sed 's/ //g')"
curl "https://api.heroku.com/apps/$APPNAME/dynos" -X DELETE -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0" -H "Accept: application/vnd.heroku+json; version=3.cedar-acm" -H "Accept-Language: en-US,en;q=0.5" --compressed -H "Referer: https://dashboard.heroku.com/" -H "X-Origin: https://dashboard.heroku.com" -H "X-Heroku-Requester: dashboard" -H "Authorization: Bearer $htoken" -H "Origin: https://dashboard.heroku.com" -H "Connection: keep-alive" -H "Sec-Fetch-Dest: empty" -H "Sec-Fetch-Mode: cors" -H "Sec-Fetch-Site: same-site" -H "TE: trailers"
