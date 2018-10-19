execute pathogen#infect()
syntax on
filetype plugin indent on

set number
set relativenumber
set hidden
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set colorcolumn=100
set ruler
set undolevels=1000
set backspace=indent,eol,start
set nobackup
set noswapfile

"Color Scheme
colorscheme gruvbox

" Key mapping
let mapleader = ","
map <C-n> :NERDTreeToggle<CR>
nmap <C-l> :bnext<CR>
nmap <C-h> :bprev<CR>
nmap <leader>w :bd<CR>

" Pasting code
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set clipboard+=unnamed
 
" Auto reload files
autocmd CursorHold * checktime

" Disable cursorline on insert mode
autocmd InsertEnter,InsertLeave * set cursorline!

" Plugins config
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
set runtimepath^=~/.vim/bundle/ctrlp.vim
