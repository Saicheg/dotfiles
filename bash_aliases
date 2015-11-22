alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c="clear"
alias ie7="wine 'C:\Program Files\Internet Explorer\iexplore'"
alias frspec="SKIP_SLOW=true rspec"

# Rails
alias rs="rails server"
alias rc="rails console"
alias pr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"
alias rr="rake routes"
alias rrg="rake routes | grep "

# Git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git checkout"
alias gd="git diff --color"
alias grр="git reset HEAD"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold yellow)<%an>%Creset' --abbrev-commit --"
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

# Fix tmux vim color
alias tmux="TERM=screen-256color-bce tmux"
