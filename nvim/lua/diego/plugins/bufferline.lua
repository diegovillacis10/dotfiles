return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "buffers",
        separator_style = "thin",
        numbers = "none",
        right_mouse_command = nil,
        left_mouse_command = "buffer %d",
        middle_mouse_command = "bdelete! %d",
        show_buffer_close_icons = false,
      },
    })

    -- Transparent background
    -- https://www.reddit.com/r/neovim/comments/1k354os/comment/mnzsyt7
    vim.api.nvim_create_autocmd({ "UiEnter", "ColorScheme" }, {
      callback = function()
        vim.cmd([[ hi TabLineFill gui=nocombine ]])
        vim.cmd([[ hi TabLineFill guibg=none ]])
        vim.cmd([[ hi! link TabLineFill Normal ]])
      end,
    })

    local keymap = vim.keymap

    -- the order of buffers :bnext and :bprevious will not respect the custom ordering
    keymap.set("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Navigate to next buffer" })
    keymap.set("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Navigate to prev buffer" })

    keymap.set("n", "]b", "<cmd>BufferLineMoveNext<CR>", { desc = "Move current buffer to next position" })
    keymap.set("n", "[b", "<cmd>BufferLineMovePrev<CR>", { desc = "Move current buffer to prev position" })

    keymap.set("n", "<leader>be", "<cmd>BufferLineSortByExtension<CR>", { desc = "Sort buffers by extensions" })
    keymap.set("n", "<leader>bd", "<cmd>BufferLineSortByDirectory<CR>", { desc = "Sort buffers by directory" })
    keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle buffer pin" })
    keymap.set("n", "<leader>bco", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close all other buffers" })
    keymap.set("n", "<leader>bcl", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close all buffers to the left" })
    keymap.set("n", "<leader>bcr", "<cmd>BufferLineCloseRight<CR>", { desc = "Close all buffers to the right" })

    keymap.set("n", "<leader>1", function()
      bufferline.go_to(1, true)
    end, { desc = "Go to buffer in position 1" })

    keymap.set("n", "<leader>2", function()
      bufferline.go_to(2, true)
    end, { desc = "Go to buffer in position 2" })

    keymap.set("n", "<leader>3", function()
      bufferline.go_to(3, true)
    end, { desc = "Go to buffer in position 3" })

    keymap.set("n", "<leader>4", function()
      bufferline.go_to(4, true)
    end, { desc = "Go to buffer in position 4" })

    keymap.set("n", "<leader>5", function()
      bufferline.go_to(5, true)
    end, { desc = "Go to buffer in position 5" })

    keymap.set("n", "<leader>6", function()
      bufferline.go_to(6, true)
    end, { desc = "Go to buffer in position 6" })

    keymap.set("n", "<leader>7", function()
      bufferline.go_to(7, true)
    end, { desc = "Go to buffer in position 7" })

    keymap.set("n", "<leader>8", function()
      bufferline.go_to(8, true)
    end, { desc = "Go to buffer in position 8" })

    keymap.set("n", "<leader>9", function()
      bufferline.go_to(9, true)
    end, { desc = "Go to buffer in position 9" })

    keymap.set("n", "<leader>0", function()
      bufferline.go_to(-1, true)
    end, { desc = "Go to buffer in last position" })
  end,
}
