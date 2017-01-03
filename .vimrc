set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"
" color scheme
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
"
" airline (status bar)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" git-gutter (git status line
Plugin 'git://github.com/airblade/vim-gitgutter.git'

" auto file encoding detection
Plugin 'git://github.com/s3rvac/AutoFenc.git'

" Syntastic Syntax checker
Plugin 'git://github.com/vim-syntastic/syntastic.git'

" VIM hardmode (disables the easy but inefficenct keybindings such as pgUp
" PgDn etc...
Plugin 'git://github.com/wikitopian/hardmode.git'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Extension Enabler
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

syntax on
set t_Co=256
set cursorline
colorscheme onehalflight
let g:airline_theme='onehalfdark'
" lightline
" " let g:lightline.colorscheme='onehalfdark'




" Set the default file encoding to UTF-8:
set encoding=utf-8

" use visual bell instead of beeping
set vb

" incremental search
set incsearch

" Use UNIX (\n) line endings for new files
autocmd BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" autoindent (smart and keep, fold accordingly, based on filetype)
set autoindent
set smartindent
set foldmethod=indent
filetype indent on

" 4 space tabs
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4
autocmd BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=8
autocmd BufRead,BufNewFile *.py,*pyw set shiftwidth=4
autocmd BufRead,BufNewFile *.py,*.pyw set expandtab
fu Select_c_style()
    if search('^\t', 'n', 150)
        set shiftwidth=8
        set noexpandtab
    el 
        set shiftwidth=4
        set expandtab
    en
endf
autocmd BufRead,BufNewFile *.c,*.h call Select_c_style()
autocmd BufRead,BufNewFile Makefile* set noexpandtab

" show matching brackets
autocmd FileType perl set showmatch

" show line numbers
autocmd FileType perl set number
autocmd FileType python set number

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" my perl includes pod
let perl_include_pod = 1

" syntax highlighting
"set bg=light " tells vim what the background looks like to make nice readable colors
let perl_extended_vars = 1
let python_highlight_all = 1
syntax on

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

" Deparse obfuscated code
nnoremap <silent> _d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> _d :!perl -MO=Deparse 2>/dev/null<cr>

" Bottom line
set ruler
set showcmd
set showmode

" often used commands (wrapping,linenumbers,tabs,scolling)
set nowrap
set sidescroll=10
" set list " displays hidden chars (line-endings, tabs etc...)
set number

function! NumberToggle()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" ####### PYTHON #########

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
"autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79
autocmd BufRead,BufNewFile *.c,*.h set textwidth=79

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
autocmd BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r





