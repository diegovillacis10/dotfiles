return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim",     build = "make" },
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local layout = require("telescope.actions.layout")
    local lga_actions = require("telescope-live-grep-args.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-t>"] = layout.toggle_preview,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = {         -- extend mappings
            i = {
              ["<C-o>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-f>"] = lga_actions.quote_prompt({ postfix = " --type " }),
            },
          },
        },
      },
    })

    telescope.load_extension("live_grep_args")
    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>f?", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set('n', '<leader>fr', "<cmd>Telescope registers<cr>", { desc = 'Find registers' })
    keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>", { desc = 'Find buffers' })
    keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", { desc = 'Find available help tags' })
    keymap.set('n', '<leader>fk', "<cmd>Telescope keymaps<cr>", { desc = 'Filter keymaps' })
    keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
  end,
}
