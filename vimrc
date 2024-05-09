let g:netrw_liststyle = 3

set encoding=utf-8

let mapleader = ','

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

" colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
let g:gruvbox_italic=1
" https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" PLUGINS {{{
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
" }}}

" PLUGINS CONFIG {{{
" tpope/vim-fugitive
nnoremap <silent> <Leader>g :G<CR>

" airblade/vim-gitgutter
let g:gitgutter_show_msg_on_hunk_jumping = 0
command! Gqf GitGutterQuickFix | copen
nmap ghf :GitGutterFold<CR>
nmap ghp <Plug>(GitGutterPrevHunk)
nmap ghn <Plug>(GitGutterNextHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghr <Plug>(GitGutterPreviewHunk)

" vim-airline/vim-airline-themes
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" junegunn/fzf.vim
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <Leader>r :Rg<CR>

" https://www.erickpatrick.net/blog/adding-syntax-highlighting-to-fzf.vim-preview-window
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" Customize fzf colors to match your color scheme
" https://github.com/morhetz/gruvbox/issues/207#issue-271309317
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" }}}

" MAPPINGS {{{
" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Buffers movement
noremap <C-h> <ESC>:bnext<CR>
noremap <C-l> <ESC>:bprev<CR>
nnoremap <Leader>q :bd<CR>

" Reindent the whole file
" http://vim.wikia.com/wiki/Fix_indentation
map <F7> gg=G<C-o><C-o>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Toggle highlights
noremap <F4> :set hlsearch! hlsearch?<CR>

" Type jk to exit insert mode quickly.
inoremap jk <Esc>

" Clipboard
nmap <leader>y "+y
nmap <leader>p "+p

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
set showmode

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

" command hint
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
" }}}

" VIMSCRIPT {{{
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
