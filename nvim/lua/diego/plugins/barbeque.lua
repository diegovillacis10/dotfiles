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

    vim.keymap.set("n", "<leader>tw", function()
      ui.toggle()
    end, { desc = "Toggle barbecue winbar" })
  end,
}
