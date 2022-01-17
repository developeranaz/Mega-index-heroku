from selenium import webdriver
from selenium.webdriver.firefox.options import Options
import time
import os
import pickle
#web: https://id.heroku.com/login
#user: THEHEROKUUSEREMAIL
#pass: THEHEROKUUSERPASSWORD
options = Options()
options.headless = True
#driver = webdriver.Firefox(options=options, executable_path=r'E:\Downloads\geckodriver.exe')
driver = webdriver.Firefox(options=options, executable_path=r'/usr/bin/geckodriver')
driver.get("https://id.heroku.com/login")
time.sleep(1)
driver.find_element_by_css_selector('#email').send_keys("THEHEROKUUSEREMAIL")
driver.find_element_by_css_selector('#password').send_keys("THEHEROKUUSERPASSWORD")
driver.find_element_by_css_selector('.btn').click()
time.sleep(1)
driver.find_element_by_css_selector('button.btn:nth-child(3)').click()
#driver.set_window_size(1343, 816)
time.sleep(1)
time.sleep(5)
driver.execute_script("alert (localStorage.getItem('ember_simple_auth-session'));")
value = driver.switch_to.alert.text
os.environ['keyword'] = value
print(os.getenv('keyword'))
driver.quit()
