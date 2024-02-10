return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    require("neoclip").setup({
      history = 500,
    })

    vim.keymap.set("n", "<leader>y", "<cmd>Telescope neoclip<cr>", { desc = "Open neoclip" })
  end,
}
