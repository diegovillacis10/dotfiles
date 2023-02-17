set encoding=utf-8

let mapleader = ' '

set number
set relativenumber
set nojoinspaces " Use one space, not two, after punctuation.
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set backspace=indent,eol,start
set nobackup
set noswapfile
set ruler " show the cursor position all the time
set incsearch " do incremental searching
set autowrite " Automatically :write before running commands
set hlsearch
set updatetime=100
set smartcase
set ignorecase
set signcolumn=yes
set visualbell
set showmatch
set smartindent
set smarttab
set autoindent
set undolevels=1000

filetype on
filetype plugin on
filetype indent on

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" colorscheme nord
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()
" }}}

" PLUGINS CONFIG/MAPPINGS ------------------------------------------------ {{{
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = "right"

" airblade/vim-gitgutter
let g:gitgutter_show_msg_on_hunk_jumping = 0
command! Gqf GitGutterQuickFix | copen
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" vim-airline/vim-airline-themes
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" https://github.com/neoclide/coc.nvim#example-vim-configuration
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()

" neoclide/coc.nvim
let g:coc_disable_startup_warning = 1
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

" junegunn/fzf.vim
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>r :Rg<CR>

" junegunn/fzf.vim
" https://www.erickpatrick.net/blog/adding-syntax-highlighting-to-fzf.vim-preview-window
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'batcat --color=always --style=header,grid --line-range :300 {}'"
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" }}}

" MAPPINGS ---------------------------------------------------------------- {{{
" preservim/nerdtree
map <C-n> :NERDTreeToggle<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Yank into the system clipboard register
map <leader>y "+y

nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nmap <leader>d :GitGutterFold<CR>

" Reindent the whole file
" http://vim.wikia.com/wiki/Fix_indentation
nmap <F7> mzgg=G`z<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Type jk to exit insert mode quickly.
inoremap jk <Esc>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" enter the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

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

" http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>


nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>
noremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>

" command hint
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" neoclide/coc.nvim
nnoremap <silent> K :call CocAction('doHover')<CR>
" }}}

" VIMSCRIPT ---------------------------------------------------------------- {{{
" Auto reload files
autocmd CursorHold * checktime

" Highlighting for large files
" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim#highlighting-for-large-files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Disable cursorline on insert mode
autocmd InsertEnter,InsertLeave * set cursorline!
" }}}

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
