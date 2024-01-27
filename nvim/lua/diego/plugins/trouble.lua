return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local trouble = require("trouble")

    trouble.setup()

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    opts.desc = "Toggle Trouble"
    keymap.set("n", "<leader>xx", function()
      trouble.toggle()
    end, opts)

    opts.desc = "Open workspace diagnostics with Trouble"
    keymap.set("n", "<leader>xw", function()
      trouble.toggle("workspace_diagnostics")
    end, opts)

    opts.desc = "Open document diagnostics with Trouble"
    keymap.set("n", "<leader>xd", function()
      trouble.toggle("document_diagnostics")
    end, opts)

    opts.desc = "Open quickfixlist with Trouble"
    keymap.set("n", "<leader>xq", function()
      trouble.toggle("quickfix")
    end, opts)

    opts.desc = "Open loclist with Trouble"
    keymap.set("n", "<leader>xl", function()
      trouble.toggle("loclist")
    end, opts)

    opts.desc = "Open LSP references with Trouble"
    keymap.set("n", "gR", function()
      trouble.toggle("lsp_references")
    end, opts)

    opts.desc = "Trouble - jump to the previous item, skipping the groups"
    keymap.set("n", "[q", function()
      trouble.previous({ skip_groups = true, jump = true })
    end, opts)

    opts.desc = "Trouble - jump to the next item, skipping the groups"
    keymap.set("n", "]q", function()
      trouble.next({ skip_groups = true, jump = true })
    end, opts)

    opts.desc = "Trouble - jump to the first item, skipping the groups"
    keymap.set("n", "[Q", function()
      trouble.first({ skip_groups = true, jump = true })
    end, opts)

    opts.desc = "Trouble - jump to the last item, skipping the groups"
    keymap.set("n", "]Q", function()
      trouble.last({ skip_groups = true, jump = true })
    end, opts)
  end,
}
