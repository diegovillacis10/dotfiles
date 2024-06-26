local opt = vim.opt

vim.g.have_nerd_font = true

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
opt.list = false

opt.listchars =
  { tab = "» ", trail = "·", nbsp = "␣", eol = "↲", extends = "▸", precedes = "◂", leadmultispace = "...│" }
-- opt.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'

-- Enable break indent
opt.breakindent = true

-- search settings
opt.inccommand = "split" -- shows command effect incrementally partially in a prev window
opt.hlsearch = true -- disable highlight all matches from search
opt.incsearch = true -- show pattern as it gets typed
opt.ignorecase = true -- ignores case in search patterns
opt.smartcase = true -- if you include mixed case

opt.showmode = false -- Don't show the mode, since it's already in status line

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the botton

-- turn on tuemguicolors for `THEME` colorschemeto work
-- (have to use a true color terminal)
opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so tha text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

opt.endofline = true
opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor.

-- enable mouse mode
opt.mouse = "a"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- backup
opt.swapfile = false -- disable swapfile for buffer
opt.backup = false -- disable backup when overwriting the buffer
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- sets unfile location
opt.undofile = true -- enables undofile
