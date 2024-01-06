-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Explorer" })

-- delete single character without copying into register
-- keymap.set("n", "x", [["_x]])

keymap.set("n", "<leader>nh", "<Cmd>nohl<CR>", { desc = "Clear search highlights" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

keymap.set("v", "<", "<gv", { desc = "Indent block to the left" })
keymap.set("v", ">", ">gv", { desc = "Indent block to the right" })

keymap.set("n", "J", "mzJ`z", { desc = "Keep cursor position while inlining" })

keymap.set("n", "n", "nzzzv", { desc = "Keep forward search terms centered" })
keymap.set("n", "N", "Nzzzv", { desc = "Keep backward search terms centered" })

keymap.set("n", "<C-l>", "<cmd>bnext<CR>", { desc = "Navigate to next buffer"})
keymap.set("n", "<C-h>", "<cmd>bprev<CR>", { desc = "Navigate to prev buffer"})

keymap.set("n", "<C-w>m", "<C-w>|<C-w>_", { desc = "Maximize split"})

-- delete highlighted word into void register and then paste over
-- keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard
-- keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- keymap.set("n", "<leader>Y", [["+Y]])

-- nops for Q and <space>
keymap.set({ 'n', 'v' }, "Q", '<Nop>', { silent = true })
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- format buffer
-- keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- substitute word on cursor in document
keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 
    { desc = "Substitute word on cursor in document" })

-- Diagnostic keymaps
-- keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- keymap.set("n", "<leader>mf", "<cmd>CellularAutomaton make_it_rain<CR>")
-- keymap.set("n", "<leader>la", "<cmd>Lazy<CR>")
-- keymap.set("n", "<leader>ma", "<cmd>Mason<CR>")

