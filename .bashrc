alias gcm="git commit -m"
alias gcmmu="git commit -m misc-update"
alias gp="git push"
alias gu="git add -u"

auto_commit () {
   git pull
   git add -u
   if [ ! -z "$1" ]; then msg=$1 ; else msg='' ; fi
   git commit -m "auto_commit: $msg"
   git push
}

alias flpull="git pull --recurse-submodules"

alias sb="source ~/.bashrc"
alias edbrc="vim ~/.bashrc && sb" #quick edit this rc file then source it on close so it auto applied. Kinda neat

alias ls="exa"
alias grep='grep --color=auto'
alias t="echo test"

PS1='\u % \w\$'
