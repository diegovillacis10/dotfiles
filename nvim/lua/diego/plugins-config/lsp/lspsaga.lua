local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  -- keybinds for navigation in lspsaga window
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  -- use enter to open file with definition preview
  definition = {
    edit = "<CR>",
  },
  finder = {
    keys = {
      vsplit = 'v',
      split = 'x'
    }
  },
  outline = {
    close_after_jump = true,
    layout = 'float',
    keys = {
      toggle_or_jump = "<CR>",
    }
  },
  ui = {
    colors = {
      normal_bg = "#022746",
    },
  },
})

