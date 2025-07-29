-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- Exit insert mode with jk
vim.keymap.set("i", "jk", "<Esc>", opts)

-- Move between buffers
vim.keymap.set("n", "<C-h>", "<cmd>bprev<CR>", opts)
vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>", opts)

-- Close current buffer
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", opts)
-- Delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Move selected text up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dp', opts)
vim.keymap.set("v", "P", '"_dP', opts)

-- Indent block to the left/right
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep cursor position while inlining
vim.keymap.set("n", "J", "mzJ`z", opts)

-- Keep forward search terms centered
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "*", "*zzzv", opts)
vim.keymap.set("n", "#", "#zzzv", opts)

-- Move to start/end of line with H and L
vim.keymap.set({ "n", "x", "o" }, "H", "^", opts)
vim.keymap.set({ "n", "x", "o" }, "L", "g_", opts)

-- Split line with X
vim.keymap.set("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- copy everything between { and } including the brackets
vim.keymap.set("n", "YY", "va{y", opts)

-- nops for Q and <space>
vim.keymap.set({ "n", "v" }, "Q", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- substitute word on cursor in document
vim.keymap.set(
  "n",
  "<leader>cw",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]],
  { desc = "Substitute word on cursor in document" }
)

-- Set end of line (for handlebars)
vim.keymap.set("n", "<leader>hh", ":set eol<cr>", { desc = "Set end of line (for handlebars)" })
