" vim-sublime - A minimal Sublime Text -like vim experience bundle
"               http://github.com/grigio/vim-sublime
" Best view with a 256 color terminal and Powerline fonts

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
execute pathogen#infect()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-surround'
Bundle 'gcmt/breeze.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'maksimr/vim-yate'

" Color Themes
Bundle 'flazz/vim-colorschemes'
colorscheme Monokai

""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list

inoremap <C-U> <C-G>u<C-U>

set number
set hlsearch
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" do not history when leavy buffer
set hidden

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac


" exit insert mode
inoremap <C-c> <Esc>

set completeopt=menuone,longest,preview

"
" Plugins config
"

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" https://github.com/kien/ctrlp.vim/issues/234#issuecomment-19874334
let g:ctrlp_max_files = 0

" Ultisnip
" NOTE: <f1> otherwise it overrides <tab> forever
" let g:UltiSnipsExpandTrigger="<f1>"
" let g:UltiSnipsJumpForwardTrigger="<c-k>"
" let g:UltiSnipsJumpBackwardTrigger="<c-l>"
" let g:did_UltiSnips_vim_after = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1

"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S

" Tabs
let g:airline_theme='badwolf'

nnoremap <C-h>  :tabprevious<CR>
inoremap <C-h>  <Esc>:tabprevious<CR>i
nnoremap <C-l>  :tabnext<CR>
inoremap <C-l>  <Esc>:tabnext<CR>i

nnoremap <C-j>  :tabnew<CR>
inoremap <C-j>  <Esc>:tabnew<CR>i

inoremap <C-s>  <Esc>:w<CR>i
" lazy ':'
map \ :

let mapleader = ','
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>
noremap  <Leader>f :NERDTreeFind<CR>
noremap  <Leader>t :NERDTreeToggle<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nnoremap - <C-y>
nnoremap = <C-e>

Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'

" Track the engine.
" Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'Valloric/YouCompleteMe'
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>""

" jsdoc plugin
Plugin 'joegesualdo/jsdoc.vim'
nnoremap qj :<C-u>call JSDocAdd()<CR>

Bundle 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_autofind=1
let NERDTreeShowHidden=1
let NERDTreeMouseMode=2

" keepin' highlight while tabbing
vnoremap > ><CR>gv
vnoremap < <<CR>gv

map <Esc><Esc> :w<CR>

" local configs
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
" remove whitespaces
autocmd BufWritePre * :%s/\s\+$//ei


" cursor
" source: https://gist.github.com/andyfowler/1195581
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" autohighlight line in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" add new line without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

set path+=**
set wildmenu

nnoremap <Leader>e :Explore<CR>
nnoremap <Leader>s :vsplit<CR><C-w>l
nnoremap <Leader>v :split<CR><C-w>j
nnoremap <Leader>q :qa!<CR>
nnoremap <Leader>w :wa<CR>
nnoremap <Leader>, :terminal bash<CR>

let g:ctrlp_custom_ignore = 'node_modules'
