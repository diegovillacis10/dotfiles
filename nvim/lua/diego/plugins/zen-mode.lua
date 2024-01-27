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
	config = function()
		local zenmode = require("zen-mode")

		zenmode.setup({
			window = {
				backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
				width = 110, -- width of the Zen window
				height = 0.90, -- height of the Zen window
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
				},
				gitsigns = { enabled = true }, -- disables git signs
				tmux = { enabled = true }, -- disables the tmux statusline
				alacritty = {
					enabled = false,
					font = "14", -- font size
				},
			},
		})
	end,
}
