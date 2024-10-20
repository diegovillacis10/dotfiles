return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/trouble.nvim",
    { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
    "stevearc/aerial.nvim",
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local layout = require("telescope.actions.layout")
    local lga_actions = require("telescope-live-grep-args.actions")
    local trouble_telescope_source = require("trouble.sources.telescope")

    telescope.setup({
      defaults = require("telescope.themes").get_ivy({
        cycle_layout_list = { "center", "horizontal", "vertical", "bottom_pane" },
        path_display = { "smart" },
        mappings = {
          n = {
            ["<C-t>"] = layout.toggle_preview,
            ["<C-e>"] = trouble_telescope_source.open,
            ["<C-s>"] = layout.cycle_layout_prev,
          },
          i = {
            ["<C-t>"] = layout.toggle_preview,
            ["<C-e>"] = trouble_telescope_source.open,
            ["<C-s>"] = layout.cycle_layout_prev,
          },
        },
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        -- squared borders
        -- borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
      }),
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
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
        aerial = {
          -- Display symbols as <root>.<parent>.<symbol>
          show_nesting = {
            ["_"] = false, -- This key will be the default
            json = true, -- You can set the option for specific filetypes
            yaml = true,
          },
        },
        undo = {
          side_by_side = true,
        },
      },
    })

    telescope.load_extension("live_grep_args")
    telescope.load_extension("fzf")
    -- telescope.load_extension("git_worktree")
    telescope.load_extension("aerial")
    telescope.load_extension("undo")

    -- set keymaps
    local keymap = vim.keymap
    local builtin = require("telescope.builtin")

    keymap.set("n", "<C-p>", function()
      builtin.find_files({
        find_command = { "rg", "--ignore", "--hidden", "-L", "--files" },
      })
    end, {
      desc = "Fuzzy find files in cwd",
    })
    keymap.set("n", "<leader>f?", builtin.oldfiles, { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", builtin.git_status, { desc = "Find changed files" })
    keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find changed files" })
    keymap.set("n", "<leader>fr", builtin.registers, { desc = "Find registers" })
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find available help tags" })
    keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Filter keymaps" })
    keymap.set("n", "<leader>ff", builtin.resume, { desc = "Opens the previous picker in the identical state" })
    keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Fuzzily search in current buffer" })
    keymap.set("n", "<leader>fw", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
    -- keymap.set("n", "<leader>sr", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
    keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

    -- Shortcut for searching your neovim configuration files
    keymap.set("n", "<leader>fn", function()
      builtin.find_files({
        cwd = vim.fn.stdpath("config"),
        find_command = { "rg", "--ignore", "--hidden", "-L", "--files" },
      })
    end, { desc = "[S]earch [N]eovim files" })
  end,
}
