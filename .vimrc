execute pathogen#infect()
syntax on
filetype plugin indent on

set number
set relativenumber
set nowrap
set showbreak=+++
set textwidth=100
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
" This is not showing for some reason
set colorcolumn=100
highlight colorcolumn ctermbg=7
set ruler
set undolevels=1000
set backspace=indent,eol,start
set nobackup
set noswapfile

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark

" Key mapping
let mapleader = ","
map <C-n> :NERDTreeToggle<CR>
nmap <C-k> :bnext<CR>
nmap <C-j> :bprev<CR>
nmap <leader>w :bd<CR>

" Auto reload files
autocmd CursorHold * checktime

" Disable cursorline on insert mode
autocmd InsertEnter,InsertLeave * set cursorline!

" Plugins config
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
