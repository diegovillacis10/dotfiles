return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/trouble.nvim",
    { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
  },
  config = function()
    local telescope = require("telescope")
    local layout = require("telescope.actions.layout")
    local lga_actions = require("telescope-live-grep-args.actions")
    local trouble = require("trouble.providers.telescope")

    telescope.setup({
      defaults = require("telescope.themes").get_ivy({
        cycle_layout_list = { "bottom_pane", "center", "horizontal", "vertical" },
        path_display = { "truncate" },
        mappings = {
          n = {
            ["<C-t>"] = layout.toggle_preview,
            ["<C-e>"] = trouble.open_with_trouble,
            ["<C-s>"] = layout.cycle_layout_prev,
          },
          i = {
            ["<C-t>"] = layout.toggle_preview,
            ["<C-e>"] = trouble.open_with_trouble,
            ["<C-s>"] = layout.cycle_layout_prev,
          },
        },
      }),
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          theme = "ivy",
          mappings = { -- extend mappings
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
    telescope.load_extension("git_worktree")

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>f?", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find changed files" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", { desc = "Find registers" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find available help tags" })
    keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Filter keymaps" })
    keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
    keymap.set("n", "<leader>sr", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
    keymap.set("n", "<leader>sR", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
  end,
}
