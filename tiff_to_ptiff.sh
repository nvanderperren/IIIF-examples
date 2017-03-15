#!/bin/bash
#
# Author: nvanderperren
#
# Tiff to Pyramid tiff converter. Script places also the converted files to
# the www folder.
#
# Execute as root. Give folder as a parameter.

FOLDER=$1 # folder with tiff files that should converted.
i=1
GOAL=/var/www/localhost/data/  # folder where the converted files
# + will be stored
cd $FOLDER

 for PHOTO in *.tif # loop each tif-file in folder
 do
  echo "busy"
  PTIF=amvk_${i} # rename the file
  convert ${PHOTO} -define tiff:tile-geometry=256x256 -compress jpeg ptif:${PTIF} # convert the file
  echo "${PHOTO} ${i} done" 
  mv ${PTIF} ${GOAL} # move the file
  echo "moved to ${GOAL}"
  let "i++"
  echo ${i}
 done

