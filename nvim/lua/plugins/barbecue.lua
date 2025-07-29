return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
    config = function()
      local ui = require("barbecue.ui")
      require("barbecue").setup({
        create_autocmd = false, -- prevent barbecue from updating itself automatically
      })

      -- Transparent background
      -- https://www.reddit.com/r/neovim/comments/1k354os/comment/mnzsyt7
      vim.api.nvim_create_autocmd({ "UiEnter", "ColorScheme" }, {
        callback = function()
          vim.cmd([[ hi WinBar gui=nocombine ]])
          vim.cmd([[ hi WinBar gui=none ]])
          vim.cmd([[ hi! link WinBar Normal ]])
        end,
      })

      vim.keymap.set("n", "<leader>uB", function()
        ui.toggle()
      end, { desc = "Toggle Winbar" })

      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        -- "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          ui.update()
        end,
      })
    end,
  },
}
