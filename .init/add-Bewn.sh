#!/usr/bin/env sh
#

add_as_user () {
	if [ ! -d /home/Bewn ]
     then sudo bash -c "useradd -m Bewn
   		   groupadd bewn
		   usermod -a -G bewn Bewn
		   usermod -a -G bewn $USER
		   chown --recursive :bewn /home/Bewn
		   chmod --recursive g+rx /home/Bewn
		   mkdir /bshare
		   chown :bewn /bshare
		   chmod g+rw /bshare"
	fi
	echo "summary:
		added user Bewn, group bewn, and directory /bshare 
		Bewn can only access /home/Bewn and /bshare
		users in group bewn can read and execute but not write to files in /home/Bewn
		users in bewn can read and write but not execute in /bshare 
		it will now clone the Bewn github repository
		   i.e. it's my up-to-date github home that you can use and share with
		it can't access or affect anything on the systems it's installed to"
}

get_and_clone () {
   tmploc=$RANDOM
   sudo -H -u Bewn bash -c "mkdir /tmp/$tmploc
   			    cp -r /home/Bewn /tmp/$tmploc
			    cd /home/Bewn
				   ls -A1 | xargs rm -rf
				git clone https://github.com/Bewn/Bewn .
			    mv /tmp/$tmploc /home/Bewn"
}

run () {
    read -p "would you like to 
	add Bewn as an isolated user and create a directory you and it can share to?
	[Y/n]" input
	    case $input in
	        'Y'|'y'|'') add_as_user && get_and_clone ;;
		    'N'|'n') echo "doing nothing.";;
		esac
}
run
