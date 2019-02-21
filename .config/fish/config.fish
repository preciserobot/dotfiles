# load aliases
. ~/.config/fish/aliases.fish

# env
set -g -x PATH /usr/local/bin $PATH
set -g -x PATH ~/.scripts $PATH
set -g -x PATH ~/.vim/plugged/vim-live-latex-preview/bin $PATH
#set -g -x PATH ~/.gem/ruby/2.5.0/bin $PATH
set -g -x GOPATH ~/Syncthing/private/go
set -g -x SNAPPYHOME $HOME/snappy
set -g -x SNAPPYWORK $HOME/work
set -g -x SQVDAPIUSER admin
set -g -x SQVDAPIPASS admin
set -g -x EDITOR vim
# set -g -x BROWSER 'firefox-developer-edition'
# set -g -x BROWSER 'google-chrome-stable'
set -g -x BROWSER 'brave'

# autocorrect
thefuck --alias | .

# direnv
eval (direnv hook fish)
