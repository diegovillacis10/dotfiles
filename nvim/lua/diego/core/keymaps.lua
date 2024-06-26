-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
set("n", "<leader>q", "<cmd>bd<cr>", { desc = "Close current buffer" })

set("n", "x", [["_x]], { desc = "Delete single character without copying into register" })

set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

set("v", "<", "<gv", { desc = "Indent block to the left" })
set("v", ">", ">gv", { desc = "Indent block to the right" })

set("n", "J", "mzJ`z", { desc = "Keep cursor position while inlining" })

set("n", "n", "nzzzv", { desc = "Keep forward search terms centered" })
set("n", "N", "Nzzzv", { desc = "Keep backward search terms centered" })

-- nops for Q and <space>
set({ "n", "v" }, "Q", "<Nop>", { silent = true })
set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- substitute word on cursor in document
set(
  "n",
  "<leader>cw",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Substitute word on cursor in document" }
)

set("n", "<leader>hh", ":set eol<cr>", { desc = "Set end of line (for handlebars)" })
