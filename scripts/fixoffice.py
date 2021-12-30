#!/usr/bin/python3
# Script to change /proc to /prod in libreoffice oosplash

import os
from shutil import copyfile
# make backup of oosplash
copyfile('/usr/lib/libreoffice/program/oosplash', '/usr/lib/libreoffice/program/oosplash.bak')

# open it in write and binary mode
f = open('/usr/lib/libreoffice/program/oosplash', 'rb')

# read binary file
s = f.read()
f.close()

# replace /proc with /prod
s = s.replace(b'/proc', b'/prod')

# write changed file to oosplash
f = open('/usr/lib/libreoffice/program/oosplash', 'wb')
f.write(s)
f.close()

# create /prod folder
if not os.path.exists('/prod'):
    os.mkdir('/prod')

# create version file
path='/prod/version'
with open(path, 'a'):
    os.utime(path, None)
