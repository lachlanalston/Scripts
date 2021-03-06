#!/bin/dash
# ------------------------------------------------------------------
# Script Name   : SIRS
# Description   : Simple Image Renaming Scheme
# Bugs          : 
#                 only works with filenames with lowercase extension jpgs
#                 need to setup error handling for when exif data is missing;
#                       no date/time
#                       no camera make
#                       no camera model, 
#                       no camera make and model, 
#                       wiped exif
# Format        : Date.Time_Brand.Mode.jpg
# Author        : Lachlan Alston
# Dependency    :
#                 https://www.sentex.ca/~mwandel/jhead/
# ------------------------------------------------------------------
Version=1.0
SUBJECT=
USAGE= "Usage: sh run.sh"

Make=$(jhead -nofinfo *.jpg)
Model=$Make
Make=${Make#*Camera[[:space:]]make*:}
Make=${Make%%$'\n'*}
Model=${Model#*Camera[[:space:]]model*:}
Model=${Model%%$'\n'*}
MakeModel="$(echo -e "${Make}.${Model}" | tr -d '[:space:]')"
jhead -n"%Y%m%d.%H%M%S_$MakeModel" *.jpg
