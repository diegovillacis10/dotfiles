return {
  "ray-x/navigator.lua",
  event = { "BufReadPre", "BufNewFile" },
  enabled = false,
  dependencies = {
    { "ray-x/guihua.lua",     run = "cd lua/fzy && make" },
    { "neovim/nvim-lspconfig" },
  },
  config = function()
    require("navigator").setup({
      mason = true
    })
  end,
}
