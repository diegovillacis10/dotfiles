return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local barbecue = require("barbecue")
    local ui = require("barbecue.ui")

    barbecue.setup()

    -- Transparent background
    -- https://www.reddit.com/r/neovim/comments/1k354os/comment/mnzsyt7
    vim.api.nvim_create_autocmd({ "UiEnter", "ColorScheme" }, {
      callback = function()
        vim.cmd([[ hi WinBar gui=nocombine ]])
        vim.cmd([[ hi WinBar gui=none ]])
        vim.cmd([[ hi! link WinBar Normal ]])
      end,
    })

    vim.keymap.set("n", "<leader>tw", function()
      ui.toggle()
    end, { desc = "Toggle barbecue winbar" })
  end,
}
