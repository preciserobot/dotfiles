
let mapleader=','
set nocompatible
set hidden

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive' " git command tool
Plug 'airblade/vim-gitgutter' " git diff in gutter
Plug 'jiangmiao/auto-pairs'  " automatically close brackets etc.
Plug 'tpope/vim-surround' " surround motion
"Plug 'tpope/vim-commentary' " Comment stuff
Plug 'terryma/vim-multiple-cursors' " Sublime style multiple cursors
Plug 'vim-airline/vim-airline' " powerline-style status Bar
Plug 'vim-airline/vim-airline-themes' " airline-themes
Plug 'airblade/vim-gitgutter'  " git annotations in gutter
Plug 'altercation/vim-colors-solarized'  " nice solarized colorscheme
Plug 'trevordmiller/nova-vim' " nova color scheme
Plug 'flazz/vim-colorschemes' " plenty of colorschemes
Plug 'gertjanreynaert/cobalt2-vim-theme' " Cobalt2 Theme
Plug 'dylanaraps/wal.vim' " pyWAL based colourschemes
Plug 's3rvac/AutoFenc' " auto file encoding detection
Plug 'vim-syntastic/syntastic' "Syntax checker in statusline
Plug 'w0rp/ale' " async lint engine
Plug 'mattn/emmet-vim' " Emmet
Plug 'sheerun/vim-polyglot' " support for multiple languages
"Plug 'mxw/vim-jsx' " JSX highlighting and indenting
"Plug 'pangloss/vim-javascript' " Improved javascript highlighting and indenting
Plug 'majutsushi/tagbar' " class viewer <F8>
Plug 'Yggdroot/indentLine' " Line indenting
Plug 'wikitopian/hardmode' " Yes I'm hardcore
Plug 'vimwiki/vimwiki' " vim-wiki
Plug 'aaronbieber/vim-quicktask' " vim task list
Plug 'junegunn/goyo.vim' " distraction free writing
Plug 'scrooloose/nerdtree' " Directory/file tree
Plug 'Xuyuanp/nerdtree-git-plugin' " git annotations for nerdtree
Plug 'scrooloose/nerdcommenter' " commenting of lines and blocks
Plug 'tmhedberg/SimpylFold' " folding for python code
Plug 'ctrlpvim/ctrlp.vim' " Ctrl-P Fullzy file finder
Plug 'vim-ctrlspace/vim-ctrlspace' " buffer/window manager
Plug 'bling/vim-bufferline' " Show buffers in statusline
Plug 'ying17zi/vim-live-latex-preview' "LaTeX live previews
Plug 'vim-pandoc/vim-pandoc' " pandoc plugin (eg. for RMarkdown)
Plug 'vim-pandoc/vim-pandoc-syntax' " pandoc syntax
"Plug 'lervag/vimtex' " Full featured LaTeX editing package
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " asynchronous autocompletion
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-go'  " golang autocompletion
Plug 'zchee/deoplete-jedi'  " Python autocompletion

call plug#end()  " Initialize plugin system

let g:deoplete#enable_at_startup = 1  " autocompletion
filetype plugin indent on  " detect file types
set laststatus=2  " always show statusline
nmap <F8> :TagbarToggle<CR>  " toggle classviewer

" distraction free writing
map <F10> :Goyo<CR>

" Autofenc
let g:autofenc_enable = 1
let g:SimpylFold_docstring_preview=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Nerdtree autoload
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" powerline/airline
let g:powerline_pycmd = 'py3'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'onehalfdark'

" lightline (like airline, not active currently)
let g:lightline = {
  \   'colorscheme': 'Dracula',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }

" ########################################################
" ### END OF PLUGIN CONFIG ###############################
" ########################################################

syntax on
set encoding=utf-8
set t_Co=256
set cursorline
colorscheme slate
" colorscheme zenburn
" colorscheme wal

" show tabline
set showtabline=2
set guioptions-=e  " Don't use GUI tabline
" visual bell
set vb
" immediately start searching
set incsearch
" Enable autocompletion
set wildmode=longest,list,full
set wildmenu
" split where it should and shortcuts
set splitbelow
set splitright
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" movement remap in case of wrapped lines
"nnoremap j gj
"nnoremap k gk
"vnoremap j gj
"vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Use UNIX (\n) line endings for new files
autocmd BufNewFile *.py,*.pyw,*.c,*.h,*.html,*.js,*.jsx set fileformat=unix

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" indentation
set autoindent
set smartindent
filetype indent on

" code folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" 4 space tabs as default
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4
" tab sizes for JS
autocmd BufRead,BufNewFile *.js,*.jsx set tabstop=2
autocmd BufRead,BufNewFile *.js,*.jsx set shiftwidth=2
" tabs and spaces (for now...)
autocmd BufRead,BufNewFile *.py,*.pyw,*.js,*jsx set expandtab
autocmd BufRead,BufNewFile Makefile* set noexpandtab
" indetation for c stuff
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

" show matching brackets
autocmd FileType perl set showmatch
autocmd FileType *.js,*.jsx set showmatch

" show line numbers
autocmd FileType perl set number
autocmd FileType python set number

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

" syntax highlighting
"set bg=light " tells vim what the background looks like to make nice readable colors
let python_highlight_all = 1
syntax on

" Bottom line
set ruler
set showcmd
set showmode

" often used commands (wrapping,linenumbers,tabs,scolling)
set nowrap
set sidescroll=10


" line numbers and hidden characters
set list " displays hidden chars (line-endings, tabs etc...)
set number " display line numbers
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
"set listchars=tab:>-     " > is shown at the beginning, - throughout

set relativenumber  " relative line numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
nnoremap <F12> :call NumberToggle()<cr>

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" WRITE WRITE WRITE WRITE
" WRITE WRITE WRITE WRITE
" WRITE WRITE WRITE WRITE

" auto templates
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/sh/template.sh
    autocmd BufNewFile *.tex 0r ~/.vim/templates/tex/article.tex
    autocmd BufNewFile *.rmd,*.md,*.Rmd 0r ~/.vim/templates/rmd/template.rmd
    autocmd BufNewFile *.go 0r ~/.vim/templates/go/template.go
    autocmd BufNewFile *.py 0r ~/.vim/templates/py/template.py
  augroup END
endif

" word counts and spell checker
map <F3> :!wc <C-R>%<CR>
map <F6> :setlocal spell! spelllang=en_gb spellfile=/keybase/private/preciserobot/spell/en.utf-8.add<CR>

" LaTeX stuff
map <F9> :vsp<space>~/Documents/LaTeX/uni.bib<CR>  " open bibliography
map <leader>p :!mupdf <c-r>%<backspace><backspace><backspace>pdf &<CR><CR>  " Open corresponding.pdf
map <leader>c :!compiler <c-r>%<CR>  " Compile document

" Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

"""LATEX
autocmd FileType tex set wrap
autocmd FileType tex set linebreak
" Word count:
autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
" Compile document using xelatex:
autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
" Code snippets
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ;rn (\ref{})<++><Esc>F}i

"""LATEX Logical symbols
autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;M $$$$<Enter><Enter><++><Esc>2k$hi
autocmd FileType tex inoremap ;neg {\neg}
autocmd FileType tex inoremap ;V {\vee}
autocmd FileType tex inoremap ;or {\vee}
autocmd FileType tex inoremap ;L {\wedge}
autocmd FileType tex inoremap ;and {\wedge}
autocmd FileType tex inoremap ;ra {\rightarrow}
autocmd FileType tex inoremap ;la {\leftarrow}
autocmd FileType tex inoremap ;lra {\leftrightarrow}
autocmd FileType tex inoremap ;fa {\forall}
autocmd FileType tex inoremap ;ex {\exists}
autocmd FileType tex inoremap ;dia	{\Diamond}
autocmd FileType tex inoremap ;box	{\Box}
autocmd FileType tex inoremap ;gt	{\textgreater}
autocmd FileType tex inoremap ;lt	{\textless}

"""HTML
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ;h1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;h2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;h3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ;e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ;li <Esc>o<li></li><Esc>F>a
autocmd FileType html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ;im <table<Space>class="image"><Enter><caption align="bottom"></caption><Enter><tr><td><a<space>href="pix/<++>"><img<Space>src="pix/<++>"<Space>width="<++>"></a></td></tr><Enter></table><Enter><Enter><++><Esc>4kf>a
autocmd FileType html inoremap ;td <td></td><++><Esc>Fdcit
autocmd FileType html inoremap ;tr <tr></tr><Enter><++><Esc>kf<i
autocmd FileType html inoremap ;th <th></th><++><Esc>Fhcit
autocmd FileType html inoremap ;tab <table><Enter></table><Esc>O
autocmd FileType html inoremap ;gr <font color="green"></font><Esc>F>a
autocmd FileType html inoremap ;rd <font color="red"></font><Esc>F>a
autocmd FileType html inoremap ;yl <font color="yellow"></font><Esc>F>a
autocmd FileType html inoremap ;dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
autocmd FileType html inoremap ;dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
"autocmd FileType html inoremap -- &ndash;
"autocmd FileType html inoremap --- &mdash;

""".bib
autocmd FileType bib inoremap ;a @article{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>journal<Space>=<Space>"<++>",<Enter><tab>volume<Space>=<Space>"<++>",<Enter><tab>pages<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ;b @book{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap ;c @incollection{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>booktitle<Space>=<Space>"<++>",<Enter><tab>editor<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
autocmd FileType markdown,rmd inoremap map <F3> :w !wc -w<CR>
autocmd FileType markdown,rmd set wrap|set linebreak|set nolist
autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>--pdf-engine=xelatex<space>-o<space><C-r>%.pdf<Enter><Enter>
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd Filetype rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO
