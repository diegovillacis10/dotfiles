return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "kkharji/sqlite.lua", module = "sqlite" },
  },
  config = function()
    require("neoclip").setup({
      history = 500,
      enable_persistent_history = true,
    })

    vim.keymap.set("n", "<leader>y", "<cmd>Telescope neoclip<cr>", { desc = "Open neoclip" })
  end,
}
