# Antigen plugin manager
source /usr/share/zsh/share/antigen.zsh

# -- CUSTOM --
source /home/dbrawand/.gmail

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme robbyrussell
#antigen theme agnoster

# Tell antigen that you're done.
antigen apply

# HiDPI display scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=2
export GDK_SCALE=1
export ELM_SCALE=2

# Aliases
source ~/.aliases.zsh

# Editor
export EDITOR=vim
export BROWSER="firefox-developer-edition"

# set priority binaries/scripts
export PATH=~/bin:$PATH
export PATH=~/.scripts:$PATH

# LaTeX Live preview with vim
export PATH=~/.vim/plugged/vim-live-latex-preview/bin:$PATH

# Snappy/SQVD
export SNAPPYHOME=${HOME}/snappy
export SNAPPYWORK=/srv/work
#export SNAPPYWORK=${HOME}/work
export SQVDAPIUSER=admin
export SQVDAPIPASS=admin
# anaconda
# export ANACONDA=${HOME}/anaconda
# export PATH=$ANACONDA/bin:$PATH

# powerline
powerline-daemon -q
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

eval $(thefuck --alias)
