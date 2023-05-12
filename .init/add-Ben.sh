#!/usr/bin/env sh

## check for Bewn user and add if not found
if [ -z $(cat /etc/group | grep Bewn) ]; 
  then sudo useradd Bewn
fi

## clone Bewn home or pull if already a user
if [ ! -z $(touch /home/Bewn) ];
  echo "please add Bewn as a user manually, or run this script again"
  sudo chown --recursive Bewn /home/Bewn;
  else cd /home/Bewn && eval "$(login Bewn && git pull)"
fi




