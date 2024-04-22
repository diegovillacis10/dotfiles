return {
  "mrjones2014/smart-splits.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local splits = require("smart-splits")
    splits.setup({})

    local keymap = vim.keymap

    keymap.set("n", "<leader>wh", splits.resize_left, { desc = "Resize split Left" })
    keymap.set("n", "<leader>wj", splits.resize_down, { desc = "Resize split Down" })
    keymap.set("n", "<leader>wk", splits.resize_up, { desc = "Resize split Up" })
    keymap.set("n", "<leader>wl", splits.resize_right, { desc = "Resize split Right" })
  end,
}
