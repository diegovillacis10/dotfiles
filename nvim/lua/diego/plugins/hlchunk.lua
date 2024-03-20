return {
  "shellRaining/hlchunk.nvim",
  event = { "BufNewFile", "BufReadPre" },
  enabled = false,
  config = function()
    require("hlchunk").setup({
      line_num = {
        enable = false,
      }
    })
  end,
}
