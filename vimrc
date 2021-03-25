let mapleader = ' '
let g:mapleader = ' '

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
  if has('macunix')
      autocmd VimEnter * ++nested colorscheme gruvbox
  endif
  set bg=dark

Plug 'preservim/nerdtree'
  map <C-n> :NERDTreeToggle<CR>
  let g:NERDTreeQuitOnOpen = 1
  let g:NERDTreeShowHidden = 1

Plug 'vim-syntastic/syntastic'
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

Plug 'ap/vim-buftabline'
  set hidden
  nnoremap <leader>n :bnext<CR>
  nnoremap <leader>p :bprev<CR>
  nmap <leader>w :bd<CR>

Plug 'tpope/vim-commentary'
  autocmd FileType apache setlocal commentstring=#\ %s

Plug 'airblade/vim-gitgutter'

if has('macunix')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
    nnoremap <silent> <C-f> :Files<CR>
    nnoremap <silent> <Leader>f :Rg<CR>
    set rtp+=/usr/local/opt/fzf
endif

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'pangloss/vim-javascript'

Plug 'leafgarland/typescript-vim'

Plug 'peitalin/vim-jsx-typescript'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'jparise/vim-graphql'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  nnoremap <silent> K :call CocAction('doHover')<CR>
  let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json'
    \ ]
  if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
    let g:coc_global_extensions += ['coc-prettier']
  endif

  if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
    let g:coc_global_extensions += ['coc-eslint']
  endif

call plug#end()

" Basic Configuration
set number
set relativenumber
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

" Git conflicts resolution
" https://gist.github.com/karenyyng/f19ff75c60f18b4b8149/e6ae1d38fb83e05c4378d8e19b014fd8975abb39
if &diff
  map <silent> <leader>1 :diffget LOCAL<CR>
  map <silent> <leader>2 :diffget BASE<CR>
  map <silent> <leader>3 :diffget REMOTE<CR>
  map <silent> <leader>u :diffupdate<CR>
endif

" Pasting code
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Auto reload files
autocmd CursorHold * checktime
autocmd VimEnter * colorscheme gruvbox

" Highlighting for large files
" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim#highlighting-for-large-files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


" Disable cursorline on insert mode
autocmd InsertEnter,InsertLeave * set cursorline!
