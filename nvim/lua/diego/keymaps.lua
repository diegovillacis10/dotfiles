-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- delete single character without copying into register
vim.keymap.set("n", "x", [["_x]])

-- clear search highlights
vim.keymap.set("n", "<leader>nh", "<Cmd>nohl<CR>")



vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor position while inlining
vim.keymap.set("n", "J", "mzJ`z")

-- keep search terms centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- easy maximize split
vim.keymap.set("n", "<C-w>m", "<C-w>|<C-w>_")

-- delete highlighted word into void register and then paste over
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- nops for Q and <space>
vim.keymap.set({ 'n', 'v' }, "Q", '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- format buffer
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- easy buffer navigation
vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<C-h>", "<cmd>bprev<CR>")

-- substitute word on cursor in document
vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


vim.keymap.set("n", "<leader>mf", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>la", "<cmd>Lazy<CR>")
vim.keymap.set("n", "<leader>ma", "<cmd>Mason<CR>")

