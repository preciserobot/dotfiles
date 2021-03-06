# Git
alias gi="git init"
alias gs="git status"
alias gd="git diff"
alias gdh="git diff HEAD"
alias gcl="git clone"
alias gc="git commit"
alias gaa="git add -A ."
alias gpo="git push origin"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glo="git log --oneline"
alias grhh="git reset --hard HEAD"
alias gcp="git cherry-pick"

# npm
alias ni="npm install";
alias nis="npm i -S "
alias nid="npm i -D "
alias nig="npm i -g "
alias nr="npm run";
alias nrs="npm run start";
alias nrb="npm run build";
alias nrt="npm run test";
alias nrc="npm run commit";

# Clipboard
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# MIME open
alias open="mimeopen -M"

# dockViz
alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"

# Files
alias l="ls -o -hX --group-directories-first"
alias ll='ls -lGtr'
alias la="ls -o -AhX --group-directories-first"
alias j="jump"
alias v='nvim'
alias vi='vim'
#alias vim='nvim'

# pretty json
alias jess="python -m json.tool | pygmentize -l json | less -r"

# change directory
alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# functions
function git-search
    git log -S"$argv" --pretty=format:%H | map git show 
end

function serve
    if test (count $argv) -ge 1
        if python -c 'import sys; sys.exit(sys.version_info[0] != 3)'
            /bin/sh -c "(cd $argv[1] && python -m http.server)"
        else
            /bin/sh -c "(cd $argv[1] && python -m SimpleHTTPServer)"
        end
    else
        python -m SimpleHTTPServer
    end
end
