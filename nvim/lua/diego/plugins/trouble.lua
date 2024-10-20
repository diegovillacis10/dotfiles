return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xt",
      "<cmd>Trouble todo toggle<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xT",
      "<cmd>Trouble todo toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false win.position=right win.size=0.25<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "gR",
      "<cmd>Trouble lsp toggle focus=false win.position=right win.size=0.25<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
  config = function()
    local trouble = require("trouble")

    trouble.setup({
      modes = {
        relative_preview = {
          mode = "diagnostics",
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.3,
          },
        },
        preview_float = {
          mode = "diagnostics",
          preview = {
            type = "float",
            relative = "editor",
            border = "rounded",
            title = "Preview",
            title_pos = "center",
            position = { 0, -2 },
            size = { width = 0.3, height = 0.3 },
            zindex = 200,
          },
        },
      },
      keys = {
        ["<c-n>"] = "next",
        ["}"] = "next",
        ["]]"] = "next",
        ["<c-p>"] = "prev",
        ["{"] = "prev",
        ["[["] = "prev",
      },
      icons = {
        indent = {
          top = "│ ",
          middle = "├╴",
          -- last = "└╴",
          last = "╰╴", -- rounded
          fold_open = " ",
          fold_closed = " ",
          ws = "  ",
        },
      },
    })
  end,
}
