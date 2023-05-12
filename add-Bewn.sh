#!/usr/bin/env sh
#

add_as_user () {
   sudo bash -c "useradd -m Bewn
   		 groupadd bewn
		 usermod -a -G bewn Bewn
		 usermod -a -G bewn $USER
		 chown --recursive :bewn /home/Bewn
		 chmod --recursive g+rx /home/Bewn"
}

get_and_clone () {
   tmploc=$RANDOM
   mkdir /tmp/$tmploc
   sudo -H -u Bewn bash -c "cp -r /home/Bewn /tmp/$tmploc
			    cd /home/Bewn
				   ls -A1 | xargs rm -rf
				git clone https://github.com/Bewn/Bewn .
			    cp -r /tmp/$tmploc /home/Bewn"
}

run () {
   add_as_user
   get_and_clone
}
run
