alias gcm="git commit -m"
alias gcmmu="git commit -m misc-update"
alias gp="git push"
alias gu="git add -u"

auto_commit () {
   git add -u
   git commit -m auto_commit-msg:none
   git push
}

alias sb="source ~/.bashrc"
alias edbrc="vim ~/.bashrc && sb"

alias ls="exa"

alias t="echo test"
