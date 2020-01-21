" vim-sublime - A minimal Sublime Text -like vim experience bundle
"               http://github.com/grigio/vim-sublime
" Best view with a 256 color terminal and Powerline fonts

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=/usr/local/opt/fzf
call vundle#rc()
execute pathogen#infect()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-surround'
Bundle 'gcmt/breeze.vim'
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

let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"


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
nnoremap <Leader>n :terminal bash<CR>
nnoremap <Leader>p :FZF<CR>
nnoremap <Leader>o :VimroomToggle<CR>

let g:auto_type_info = 0
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview
let g:ycm_enable_diagnostic_signs = 0
let g:fzf_layout = { 'down': '~80%' }
let g:vimroom_sidebar_height = 0
let g:vimroom_navigational_keys = 0
let g:vimroom_scrolloff = 0

set pastetoggle=<F2>
autocmd BufEnter *.tsx set filetype=typescript
