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
alias rrg="routes | grep "

# Git
alias gs="git status"
alias ga="git add"
alias gc="git checkout"
alias gd="git diff --color"
alias gcd="git checkout --"
alias grр="git reset HEAD"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold yellow)<%an>%Creset' --abbrev-commit --"

# RMO
alias rmo-cd="cd ~/Projects/RentMineOnline/;"
alias rmo-user-upd="mysql --user=root --password=root --database=rmo_development < ~/Projects/RentMineOnline/private/sql/user.sql"
alias rmo-mysql="mysql --user=root --password=root --database=rmo_development"

# Zeus
alias zs='zeus server'
alias zr='zeus rake'
alias zg='zeus generate'
alias zc='zeus console'
alias zt='zeus rspec'
