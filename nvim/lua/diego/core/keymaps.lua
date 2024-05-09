-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>q", "<cmd>bd<cr>", { desc = "Close current buffer" })
keymap.set("n", "<leader>Q", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all buffers but current" })

keymap.set("n", "x", [["_x]], { desc = "Delete single character without copying into register" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

keymap.set("v", "<", "<gv", { desc = "Indent block to the left" })
keymap.set("v", ">", ">gv", { desc = "Indent block to the right" })

keymap.set("n", "J", "mzJ`z", { desc = "Keep cursor position while inlining" })

keymap.set("n", "n", "nzzzv", { desc = "Keep forward search terms centered" })
keymap.set("n", "N", "Nzzzv", { desc = "Keep backward search terms centered" })

-- nops for Q and <space>
keymap.set({ "n", "v" }, "Q", "<Nop>", { silent = true })
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- substitute word on cursor in document
keymap.set(
  "n",
  "<leader>cw",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Substitute word on cursor in document" }
)

keymap.set("n", "<leader>hh", ":set eol<cr>", { desc = "Set end of line (for handlebars)" })
