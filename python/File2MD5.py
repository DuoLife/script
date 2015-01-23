#!/usr/bin/env python

import hashlib
import imghdr
import os
import os.path

BLOCKSIZE = 65536
imagetypes = ['gif', 'png', 'jpeg', 'jpg']
cwd = os.getcwd()
dirname = raw_input('Please enter a valid dirctory name: ')
dirpath = os.path.join(cwd, dirname)
if os.path.isdir(dirpath):
    images = os.listdir(dirpath)
    os.chdir(dirpath)
    for image in images:
        imagetype = imghdr.what(image)
        if not imagetype in imagetypes:
            continue
        hasher = hashlib.md5()
        fobj = open(image,'rb')
        buf = fobj.read(BLOCKSIZE)
        while len(buf) > 0:
            hasher.update(buf)
            buf = fobj.read(BLOCKSIZE)
        newfilename = hasher.hexdigest()
        print newfilename
        fobj.close()
        os.rename(image, newfilename)
    print 'Done!'
else:
    print "Invalid dirctory!"



