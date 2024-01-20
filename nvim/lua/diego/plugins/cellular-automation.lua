return {
  'eandrju/cellular-automaton.nvim',
  event = { "BufNewFile", "BufReadPre" },
  config = function()
    vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
  end
}
