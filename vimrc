execute pathogen#infect()
syntax on
filetype plugin on
filetype indent on

colorscheme lucius
set t_Co=256

set sw=4
set tabstop=4
set expandtab
set number

set guifont=Inconsolata\ for\ Powerline

set modelines=5
set novisualbell
set t_vb=
set updatetime=1000

set laststatus=2
set history=1000

"
" Set some default stuff that allows for better integration
"
set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set cursorline
set dictionary=/usr/share/dict/words
set encoding=utf-8
set fillchars=diff:⣿,vert:│
set gdefault
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=tab:▸\ ,trail:¬,extends:❯,precedes:❮
set matchtime=3
set modeline
set ruler
set scrolloff=3
set shiftround
set showbreak=↪
set showcmd
set showmatch
set showmode
set smartcase
set spellfile=~/.vim/custom-dictionary.utf-8.add
set splitbelow
set splitright
set title
set ttyfast
set wildmenu
set wildmode=list:longest
" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800
" Time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=10

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

"
"Make line wrapping act sanely
"
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

set wildignore+=**/.svn
set wildignore+=*.class
set wildignore+=**/tmp

if exists('+colorcolumn')
  set colorcolumn=+1
endif

if exists('+undofile')
  set undofile
  set undoreload=10000
endif

if exists('+relativenumber')
  set relativenumber
else
  set number
endif

"
" PLUGINS
"

" Add fugitive statusline if available.
" set statusline+=%{fugitive#statusline()}

" let g:Powerline_coloscheme = 'badwolf'
let g:Powerline_cache_enabled = 0
let g:Powerline_symbols = 'fancy'

function! SetupJava()
  set path=src/main/java,src/test/java,$JAVA_HOME/src
  set suffixesadd=.java
endfunction

function! SetupPHP()
  set noexpandtab
  set suffixesadd=.php
endfunction

function! SetupPython()
  nmap <leader>d :!pydoc <cfile><CR>
  nmap <leader>x :w<cr>!python %<CR>
  set suffixesadd=.py
endfunction

function! SetupRuby()
  set tabstop=2
  set shiftwidth=2
  set suffixesadd=.rb
endfunction

function! SetupEPL()
  set filetype=sql
endfunction

if has("autocmd")
  " do all autocmd stuff here
  " autocmd FileType javascript <cmd>
  autocmd BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e
  autocmd BufNewFile,BufRead *.java :call SetupJava()
  autocmd BufNewFile,BufRead *.py :call SetupPython()
  autocmd BufNewFile,BufRead *.php :call SetupPHP()
  autocmd BufNewFile,BufRead *.rb :call SetupRuby()
  autocmd BufNewFile,BufRead *.epl :call SetupEPL()
  autocmd BufNewFile,BufRead *.pp set filetype=puppet
endif

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$', '\.pyc$', '\~$']

" tab navigation like firefox
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>

noremap <Left>  <NOP>
inoremap <Left>  <NOP>
noremap <Right> <NOP>
inoremap <Right> <NOP>
noremap <Up>    <NOP>
inoremap <Up>    <NOP>
noremap <Down>  <NOP>
inoremap <Down>  <NOP>

" :inoremap <Esc>   <NOP>
" :inoremap kj <Esc>

"
" Custom Highlights
"
highlight NonText guifg=#909090
highlight SpecialKey guifg=#909090

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

let mapleader = ","
let maplocalleader = '\'


"
" Improve search
"
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<CR>
nnoremap <tab> %
vnoremap <tab> %

"
" orgmode settings
"
if exists("g:loaded_org")
  let g:org_agenda_files = ['~/.vim/org/index.org']
  let g:pymode_rope = 1
  let g:pymode_folding = 1
endif

"
" Highlight extra whitespace.
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"
" Syntastic
"

if exists("g:loaded_syntastic_plugin")
  let g:syntastic_enable_signs = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_disabled_filetypes = ['html', 'rst', 'css']
  let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
  let g:syntastic_javascript_jslint_conf = "--maxerr 1000 --white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars --continue"
  let g:syntastic_python_checker = 'flake8'
  let g:syntastic_python_checker_args = '--ignore=E501'  " Ignore line too long
endif

"
" Custom mappings
"
nnoremap <leader>t :CommandT<cr>
nnoremap <leader>r :NERDTreeFind<cr>

"
" Enable rainbow parameters.
"
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

