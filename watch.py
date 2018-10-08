#!/usr/bin/python
# change above line to point to local 
# python executable
import sys
import re
import requests
import StringIO
import time
import datetime
##This script checks for environment is ready or not and displays amount of time it took to provision the environment

print "Calculate the Time taken to provision the environment End to End (CI/CD)"
if len(sys.argv) != 2:
    print "Usage: %s <environment name>" %sys.argv[0]
    sys.exit(-1)

ENV = sys.argv[1]
url = 'https://%s.dubber.net/information/status' % ENV
version = 'https://%s.dubber.net/information/version' % ENV
print "Start : %s" % time.ctime()
a = datetime.datetime.now().replace(microsecond=0)
while True: 
    try: 
       r = requests.get(url, timeout=2) 
       if r.json()['message'] == 'holla!':
             print " %s End to End provisioning is completed" % url
             print "End : %s" % time.ctime()
             b = datetime.datetime.now().replace(microsecond=0)
             break
       else: 
           print " %s End to End provisioning is in progress" % url 
           time.sleep( 10 ) 
           print "End : %s" % time.ctime()
    except: 
        print " %s End to End provisioning is in progress" % url 
        time.sleep( 10 ) 
        print "End : %s" % time.ctime()
print "Message"
print r.json()['message']
print "Version"
g = requests.get(version, timeout=2)
print g.json()
print "Total Time taken"
print(b-a)
