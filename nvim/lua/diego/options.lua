vim.opt.guicursor = ""

-- line numbers
vim.opt.number = true -- shows absolute line number on cursor line
vim.opt.relativenumber = true -- show relative line numbers

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.smartindent = true -- smart indent on a new line

-- line wrap
vim.opt.wrap = false -- disable line wrapping

-- backup
vim.opt.swapfile = false -- disable swapfile for buffer
vim.opt.backup = false -- disable backup when overwriting the buffer
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- sets unfile location
vim.opt.undofile = true -- enables undofile

-- search settings
vim.opt.hlsearch = false -- disable highlight all matches from search
vim.opt.incsearch = true -- show pattern as it gets typed
vim.opt.ignorecase = true -- ignores case in search patterns
vim.opt.smartcase = true -- if you include mixed cas

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the botton

-- turn on tuemguicolors for `THEME` colorschemeto work
-- (have to use a true color terminal)
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" -- show sign column so tha text doesn't shift

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor.

vim.opt.colorcolumn = "80" -- vertical column position

-- enable mouse mode
vim.o.mouse = 'a'

-- clipboard
vim.o.clipboard = 'unnamedplus' -- use system clipboard as default register

-- Enable break indent
vim.o.breakindent = true -- every wrapped line will continue visually indented

vim.o.updatetime = 250 -- decrease update time
vim.o.timeoutlen = 300 -- time in milliseconds to wait for a mapped sequence to complete

vim.o.completeopt = 'menuone,noselect' -- set completeopt to have a better completion experience

