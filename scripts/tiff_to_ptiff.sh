#!/bin/sh
#
# Author: nvanderperren
#
# Tiff to Pyramid tiff converter. Script places the converted files in
# the /var/www folder.
#
# Execute as root. Give absolute paths to folders with tiff-files as argument.

 i=1
 while (( $# ))
 do
 FOLDER=$1 # folder with tiff files that should converted.
 GOAL=/var/www/localhost/data/  # define folder where the converted files will be stored
 cd $FOLDER # go into the folder with tiff-files

  for PHOTO in *.tif # loop each tif-file in folder 
  do
    echo "busy"
    PTIF=amvk_${i} # define name for ouput files
    # you can also use basename
    convert ${PHOTO} -define tiff:tile-geometry=256x256 -compress jpeg ptif:${PTIF} # convert the file
    echo "${PHOTO} ${i} done" 
    mv ${PTIF} ${GOAL} # move the file
    echo "moved to ${GOAL}"
    let "i++"
   done

  shift
 done
