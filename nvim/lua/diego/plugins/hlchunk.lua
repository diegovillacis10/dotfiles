return {
  "shellRaining/hlchunk.nvim",
  event = { "BufNewFile", "BufReadPre" },
  config = function()
    require("hlchunk").setup({
      line_num = {
        enable = false,
      }
    })
  end,
}
