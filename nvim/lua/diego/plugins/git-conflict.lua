return {
  'akinsho/git-conflict.nvim',
  event = { "BufReadPre", "BufNewFile" },
  versio = "*",
  config = function()
    require "git-conflict".setup {
      highlights = {
        ancestor = "DiffChange",
        incoming = "DiffText",
        current = "DiffAdd",
      }
    }
  end
}
