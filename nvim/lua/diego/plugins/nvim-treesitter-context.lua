return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("treesitter-context").setup({
        enable = false, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })

      vim.api.nvim_set_hl(0, "TreesitterContext", { link = "NONE" })
      vim.api.nvim_set_hl(0, "TreesitterContextBottom", { special = "#3b4261", sp = "#3b4261", underline = true })

      vim.keymap.set("n", "[h", function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end, { desc = "Jump to upwards context" })

      vim.keymap.set(
        "n",
        "<leader>tc",
        "<CMD>TSContextToggle<CR>",
        { desc = "Toggle Treesitter Context (sticky scroll)" }
      )
    end,
  },
}
