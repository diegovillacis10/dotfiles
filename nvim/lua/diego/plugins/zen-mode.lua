return {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>z",
      "<cmd>ZenMode<cr>",
      desc = "Toggle Zen Mode",
    },
  },
  opts = {
    window = {
      backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      width = 120, -- width of the Zen window
      height = 0.9, -- height of the Zen window
      options = {
        signcolumn = "no", -- disable signcolumn
        number = false, -- disable number column
        relativenumber = false, -- disable relative numbers
        cursorline = false, -- disable cursorline
        cursorcolumn = false, -- disable cursor column
        foldcolumn = "0", -- disable fold column
        list = false, -- disable whitespace characters
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false, -- disables the ruler text in the cmd line area
        showcmd = false, -- disables the command in the last line of the screen
        -- you may turn on/off statusline in zen mode by setting 'laststatus'
        -- statusline will be shown only if 'laststatus' == 3
        laststatus = 0, -- turn off the statusline in zen mode
      },
      twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
      gitsigns = { enabled = true }, -- disables git signs
      tmux = { enabled = true }, -- disables the tmux statusline
      todo = { enabled = true }, -- if set to "true", todo-comments.nvim highlights will be disabled
      wezterm = {
        enabled = true,
        -- can be either an absolute font size or the number of incremental steps
        font = "+2", -- (10% increase per step)
      },
    },
  },
}
