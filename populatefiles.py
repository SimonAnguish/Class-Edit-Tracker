#!/usr/bin/python

import subprocess
print "populating text files"
subprocess.call("./class_populate.sh")
print "finished populating text files"

print "comparing classes"
subprocess.call("./compare_classes.sh")
print "finished comparing"