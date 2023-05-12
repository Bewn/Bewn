#!/usr/bin/env sh

## check for Bewn user and add if not found
if [ -z $(cat /etc/group | grep Bewn) ]; 
  then sudo useradd --no-create-home Bewn
fi

## clone Bewn home or pull if already a user
if [ ! -d /home/Bewn ];
  then cd /home && sudo git clone https://github.com/Bewn/Bewn
  sudo chown --recursive Bewn /home/Bewn;
  else cd /home/Bewn && login Bewn && git pull
fi




