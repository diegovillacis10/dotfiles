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

" colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
let g:gruvbox_italic=1

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')

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
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'andrewradev/tagalong.vim'
Plug 'pangloss/vim-javascript'
Plug 'andrewradev/tagalong.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()
" }}}

" PLUGINS CONFIG ---------------------------------------------------------------- {{{
" preservim/nerdtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = "right"

" airblade/vim-gitgutter
let g:gitgutter_show_msg_on_hunk_jumping = 0
command! Gqf GitGutterQuickFix | copen
nmap ghd :GitGutterFold<CR>
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" vim-airline/vim-airline-themes
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" neoclide/coc.nvim
" https://github.com/neoclide/coc.nvim#example-vim-configuration

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()

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

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <leader> do <Plug>(coc-codeaction)
nmap <leader> rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0 " Enable just for html/css
autocmd FileType html,css,typescriptreact EmmetInstall
let g:user_emmet_leader_key='<C-f>' " Redefine trigger key

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

" MAPPINGS ---------------------------------------------------------------- {{{
" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Yank into the system clipboard register
map <leader>y "+y
map <leader>p "+p

nnoremap <Leader>b :bprevious<CR>
nnoremap <Leader>f :bnext<CR>
nnoremap <Leader>w :bd<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>
noremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>

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
