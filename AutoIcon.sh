#!/bin/bash

# 1 - BEFORE RUN IT, PUT YOUR POSTERS FILES (NAMED AS folder.jpg) INSIDE EVERY MOVIE/TV SHOW/SEASON FOLDER
# 2 - PUT THIS FILE INSIDE YOUR TV SHOWS FOLDER AND RUN IT
# 3 - OPEN YOUR FINDER AND SEE THE MAGIC HAPPENING :)

## No bash script should be considered releasable until it has this! http://j.mp/safebash ##
# Exit if any statement returns a non-true return value (non-zero).
set -o errexit
# Exit on use of an uninitialized variable
set -o nounset

replace_icon(){
    droplet=$1
    icon=$1$'/folder.jpg'
    if [[ $icon =~ ^https?:// ]]; then
        curl -sLo /tmp/icon $icon
        icon=/tmp/icon
    fi
    rm -rf $droplet$'/Icon\r'
    sips -i $icon >/dev/null
    DeRez -only icns $icon > /tmp/icns.rsrc
    Rez -append /tmp/icns.rsrc -o $droplet$'/Icon\r'
    SetFile -a C $droplet
    SetFile -a V $droplet$'/Icon\r'
}
export -f replace_icon
# Take an image and make the image its own icon:
find ./ -iname "folder.jpg" -execdir bash -c "replace_icon ./" {} \;

# # Extract the icon to its own resource file:
# find */folder.jpg -type f -exec 'DeRez -only icns "$0" > ./tmpicns.rsrc' \;

# # Append a resource to the folder you want to icon-ize.
# find */tmpicns.rsrc -type f -execbin 'Rez -append tmpicns.rsrc -o $"{}/Icon\r' {} \;

# # Use the resource to set the icon.
# find */tmpicns.rsrc -type f -execbin 'SetFile -a C "$0"' {} \;

# # Hide the Icon\r file from Finder.
# find */tmpicns.rsrc -type f -execbin 'SetFile -a V $"{}/Icon\r"' {} \;

# # clean up.
# rm */tmpicns.rsrc
