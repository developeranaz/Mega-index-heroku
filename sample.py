from selenium import webdriver
from selenium.webdriver.firefox.options import Options
import time
import os
import pickle
#web: https://id.heroku.com/login
#user: xXXXevX0X@yandex.com
#pass: MyStRoNgPaSs
options = Options()
#options.headless = True
driver = webdriver.Firefox(options=options, executable_path=r'E:\Downloads\geckodriver.exe')
#driver = webdriver.Firefox(options=options, executable_path=r'/usr/bin/geckodriver')
driver.get("https://id.heroku.com/login")
time.sleep(1)
driver.find_element_by_css_selector('#email').send_keys("xXXXevX0X@yandex.com")
driver.find_element_by_css_selector('#password').send_keys("MyStRoNgPaSs")
driver.find_element_by_css_selector('.btn').click()
time.sleep(1)
driver.find_element_by_css_selector('button.btn:nth-child(3)').click()
#driver.set_window_size(1343, 816)
time.sleep(1)
time.sleep(5)
#driver.execute_script("localStorage.setItem('testkey', 'myValue');")
driver.execute_script("alert (localStorage.getItem('ember_simple_auth-session'));")

value = driver.switch_to.alert.text
# Set environment variables
os.environ['keyword'] = value
# get the environment variable
print(os.getenv('keyword'))
driver.quit()
#SAMPLE REQUEST
#curl "https://api.heroku.com/apps/THEAPPNAME/dynos" -X DELETE -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:96.0) Gecko/20100101 Firefox/96.0" -H "Accept: application/vnd.heroku+json; version=3.cedar-acm" -H "Accept-Language: en-US,en;q=0.5" -H "Accept-Encoding: gzip, deflate, br" -H "Referer: https://dashboard.heroku.com/" -H "X-Origin: https://dashboard.heroku.com" -H "X-Heroku-Requester: dashboard" -H "Authorization: Bearer eXXXXX8-3XX7-4XXd-bXX3-40f5XXXc10" -H "Origin: https://dashboard.heroku.com" -H "Connection: keep-alive" -H "Sec-Fetch-Dest: empty" -H "Sec-Fetch-Mode: cors" -H "Sec-Fetch-Site: same-site" -H "TE: trailers" -O

# FIND "access_token":"eXXXXX8-3XX7-4XXd-bXX3-40f5XXXc10"


#DUMMY RESPONsE BELOW
#{"authenticated":{"authenticator":"authenticator:oauth2","access_token":"eXXXXX8-3XX7-4XXd-bXX3-40f5XXXc10","expires_in":28799,"refresh_token":"xxxxx24-08x5-4bxx0-8dxx7-007xxxxxabb","session_nonce":"13xxxxe1-xxx1-448c-9xxxx-15xxxxxx2","token_type":"Bearer","user_id":"2cxxxx7f-3xxx1-xxxx2-xxxx76-bxxxxxa5x3x5","expires_at":16xxxxxx340}}


