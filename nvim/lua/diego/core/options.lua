local opt = vim.opt

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrap
opt.wrap = false -- disable line wrapping

-- search settings
opt.hlsearch = false -- disable highlight all matches from search
opt.incsearch = true -- show pattern as it gets typed
opt.ignorecase = true -- ignores case in search patterns
opt.smartcase = true -- if you include mixed cas

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the botton

-- turn on tuemguicolors for `THEME` colorschemeto work
-- (have to use a true color terminal)
opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so tha text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor.

-- enable mouse mode
opt.mouse = 'a'

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- backup
opt.swapfile = false -- disable swapfile for buffer
opt.backup = false -- disable backup when overwriting the buffer
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- sets unfile location
opt.undofile = true -- enables undofile

