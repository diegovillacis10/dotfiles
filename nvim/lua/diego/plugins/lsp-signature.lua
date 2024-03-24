return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("lsp_signature").setup({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded",
      },
    })

    vim.keymap.set({ "n" }, "<C-k>", function()
      require("lsp_signature").toggle_float_win()
    end, { silent = true, noremap = true, desc = "toggle signature" })
  end,
}
