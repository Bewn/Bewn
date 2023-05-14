
misc-update () {
   git add -u
   git commit -m "misc update: see changed files for detail"
}

alias gcm="git commit -m"
alias gcmmu=misc-update
alias gp="git push"
alias gau="git add -u"



auto_commit () {
   git pull
   git add -u
   if [ ! -z "$1" ]; then msg=$1 ; else msg='' ; fi
   git commit -m "auto_commit: $msg"
   git push
}

alias flpull="git pull --recurse-submodules"

git_new_repo () {
   if [ -z $1 ];
      then read -p "please name the directory/repo
      		enter either a directory path or a name.
      		enter now: " input
	
	   if [ -d $input ];
	     then :
	        cd $input
	        repodir=$PWD
	        reponame="$input" ;
	     else mkdir $HOME/$input && cd $HOME/$input
	        repodir=$PWD
		reponame="$input"
	fi;
   fi;
   
   echo "attempting new git auto-repo $input at folder $repodir "
   echo "## $input code repository auto-init by $USER" >> readme.md
   
   git -C $repodir init
   git add "readme.md"
   git commit -m "initial commit by $USER's bashrc git_new_repo command."

   gh repo create "$reponame" --public --source="$repodir" --remote=upstream
   git branch -M main
   git push --set-upstream upstream main
}



alias sb="source ~/.bashrc"
alias edbrc="vim ~/.bashrc && sb" #quick edit this rc file then source it on close so it auto applied. Kinda neat

alias ls="exa"
alias grep='grep --color=auto'
alias t="echo test"

PS1='\u % \w\$'
